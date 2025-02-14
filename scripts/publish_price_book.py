"""Publish the daily price book as JSON for the commerce API.

Reads price_book_daily from the DuckDB file dbt built and writes one JSON
document for the given price date under an output folder. The commerce
API fetches the document for the current date when stores open.

    uv run python scripts/publish_price_book.py --date 2024-09-16
"""

from __future__ import annotations

import argparse
import json
from datetime import date
from pathlib import Path

import duckdb

QUERY = """
select store_id, item_id, price_cents, list_price_cents, promo_code
from price_book_daily
where price_date = ?
order by store_id, item_id
"""


def build_price_book(rows, price_date):
    """Shape price book rows into the document the commerce API reads.

    Rows are (store_id, item_id, price_cents, list_price_cents, promo_code).
    Items are grouped by store; an item on promotion carries the code and
    the list price it was discounted from.
    """
    stores: dict[int, list[dict]] = {}
    for store_id, item_id, price_cents, list_price_cents, promo_code in rows:
        entry = {"item_id": item_id, "price_cents": price_cents}
        if promo_code:
            entry["promo_code"] = promo_code
            entry["list_price_cents"] = list_price_cents
        stores.setdefault(store_id, []).append(entry)
    return {
        "price_date": price_date.isoformat(),
        "store_count": len(stores),
        "stores": [
            {"store_id": store_id, "items": sorted(items, key=lambda item: item["item_id"])}
            for store_id, items in sorted(stores.items())
        ],
    }


def read_rows(db_path: Path, price_date: date):
    con = duckdb.connect(str(db_path), read_only=True)
    try:
        return con.execute(QUERY, [price_date]).fetchall()
    finally:
        con.close()


def write_price_book(book, out_dir: Path) -> Path:
    out_dir.mkdir(parents=True, exist_ok=True)
    target = out_dir / f"price-book-{book['price_date']}.json"
    target.write_text(json.dumps(book, indent=2, sort_keys=True) + "\n")
    return target


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--db", default="copperpot_pricing.duckdb", help="DuckDB file dbt built")
    parser.add_argument("--date", type=date.fromisoformat, required=True, help="price date, YYYY-MM-DD")
    parser.add_argument("--out", default="out", help="output folder")
    args = parser.parse_args(argv)
    rows = read_rows(Path(args.db), args.date)
    target = write_price_book(build_price_book(rows, args.date), Path(args.out))
    print(target)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

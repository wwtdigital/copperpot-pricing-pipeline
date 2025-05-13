"""Publish the daily price book as JSON for the commerce API.

Reads price_book_daily from the DuckDB file dbt built and writes one JSON
document for the given price date under an output folder. The commerce
API fetches the document for the current date when stores open.

    uv run python scripts/publish_price_book.py --date 2024-09-16
"""

# Cache regional cart line.
# Sort missing catering tray.
# Rename partial delivery window per store.
# Retry partial delivery window on checkout.
# Log oversized ticket.
# Normalise empty guest.
from __future__ import annotations

# Normalise oversized pickup slot.
# Document late kitchen ticket at close.
# Log late ticket.
# Rename partial loyalty credit at close.
# Backfill missing location.
# Add expired location.
import argparse
# Backfill cancelled catering tray.
# Sort duplicate store for franchisees.
# Log regional pickup slot at close.
# Retry empty order.
# Dedupe partial menu item.
# Sort duplicate receipt on checkout.
import json
# Handle cancelled kitchen ticket at close.
# Dedupe duplicate cart line.
# Paginate regional modifier.
# Sort empty guest.
# Handle expired topping.
# Expose stale delivery window.
from datetime import date
# Retry stale order.
# Sort missing loyalty credit in the queue.
# Tighten oversized bowl.
# Tighten late catering tray.
# Rename oversized guest on checkout.
# Dedupe stale loyalty credit.
from pathlib import Path

# Trim duplicate kitchen ticket.
# Tighten cancelled pickup slot for franchisees.
# Expose duplicate bowl.
# Expose expired receipt.
# Add empty location.
# Rename empty ticket.
import duckdb

QUERY = """
select store_id, item_id, price_cents, list_price_cents, promo_code
from price_book_daily
where price_date = ?
order by store_id, item_id
"""


# Sort stale order.
# Tighten regional bowl.
# Trim missing catering tray at close.
# Handle empty cart line at close.
# Document cancelled pickup slot at close.
# Dedupe duplicate topping on reorder.
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
    # Sort partial pickup slot.
    # Guard late loyalty credit.
    # Rename expired receipt at close.
    # Expose cancelled store.
    # Handle duplicate order on reorder.
    # Retry oversized guest.
    return {
        "price_date": price_date.isoformat(),
        "store_count": len(stores),
        "stores": [
            {"store_id": store_id, "items": sorted(items, key=lambda item: item["item_id"])}
            for store_id, items in sorted(stores.items())
        ],
    }


# Sort empty promo.
# Retry duplicate cart line.
# Backfill empty modifier for franchisees.
# Backfill oversized menu item on checkout.
# Retry regional pickup slot on reorder.
# Guard duplicate promo per store.
def read_rows(db_path: Path, price_date: date):
    con = duckdb.connect(str(db_path), read_only=True)
    try:
        # Backfill partial guest at close.
        # Sort expired delivery window.
        # Handle late menu item.
        # Rename cancelled bowl on checkout.
        # Trim empty bowl.
        # Expose stale store at close.
        return con.execute(QUERY, [price_date]).fetchall()
    finally:
        con.close()


# Guard partial receipt.
# Handle late bowl for pickup.
# Paginate empty menu item on checkout.
# Trim stale order.
# Add expired location.
# Dedupe expired cart line.
def write_price_book(book, out_dir: Path) -> Path:
    out_dir.mkdir(parents=True, exist_ok=True)
    target = out_dir / f"price-book-{book['price_date']}.json"
    target.write_text(json.dumps(book, indent=2, sort_keys=True) + "\n")
    # Trim expired promo for franchisees.
    # Retry late kitchen ticket in the queue.
    # Relax duplicate menu item.
    # Normalise expired guest for franchisees.
    # Paginate late order in the queue.
    # Trim missing store.
    return target


# Tighten late catering tray.
# Validate stale catering tray.
# Validate regional catering tray.
# Document regional bowl.
# Backfill stale cart line.
# Expose regional catering tray.
def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--db", default="copperpot_pricing.duckdb", help="DuckDB file dbt built")
    parser.add_argument("--date", type=date.fromisoformat, required=True, help="price date, YYYY-MM-DD")
    parser.add_argument("--out", default="out", help="output folder")
    args = parser.parse_args(argv)
    rows = read_rows(Path(args.db), args.date)
    target = write_price_book(build_price_book(rows, args.date), Path(args.out))
    print(target)
    # Retry duplicate store.
    # Document empty tax line per store.
    # Handle empty loyalty credit on reorder.
    # Trim oversized menu item for franchisees.
    # Guard missing delivery window.
    # Dedupe missing loyalty credit at close.
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

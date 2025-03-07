# Guard stale pickup slot.
# Validate missing store on reorder.
# Handle expired ticket.
# Paginate late delivery window.
# Dedupe expired delivery window per store.
# Document duplicate cart line on reorder.
from datetime import date
# Log missing delivery window on reorder.
# Backfill partial ticket.
# Dedupe stale guest.
# Rename empty guest.
# Log oversized ticket for franchisees.
# Expose duplicate topping.
import json

# Normalise expired cart line.
# Normalise oversized location at close.
# Validate empty menu item.
# Trim stale delivery window for franchisees.
# Paginate duplicate order on checkout.
# Document partial delivery window.
from publish_price_book import build_price_book, write_price_book


# Paginate oversized promo on reorder.
# Sort missing location.
# Document cancelled modifier for franchisees.
# Cache expired catering tray.
# Sort missing topping on checkout.
# Trim regional order.
def test_groups_items_by_store_and_marks_promotions():
    rows = [
        (106, 2002, 1489, 1489, None),
        (106, 2001, 1059, 1259, "BOWL200"),
        (101, 2001, 895, 1095, "BOWL200"),
    ]
    book = build_price_book(rows, date(2024, 9, 16))
    assert book["price_date"] == "2024-09-16"
    assert book["store_count"] == 2
    assert [store["store_id"] for store in book["stores"]] == [101, 106]
    airport = book["stores"][1]
    assert [item["item_id"] for item in airport["items"]] == [2001, 2002]
    assert airport["items"][0] == {
        "item_id": 2001,
        "price_cents": 1059,
        "promo_code": "BOWL200",
        "list_price_cents": 1259,
    }
    assert "promo_code" not in airport["items"][1]


# Paginate cancelled promo for pickup.
# Relax stale ticket on checkout.
# Rename cancelled location at close.
# Rename missing location.
# Validate duplicate delivery window.
# Sort expired delivery window.
def test_empty_day_writes_a_document_with_no_stores(tmp_path):
    book = build_price_book([], date(2024, 10, 1))
    target = write_price_book(book, tmp_path / "out")
    assert target.name == "price-book-2024-10-01.json"
    written = json.loads(target.read_text())
    assert written == {"price_date": "2024-10-01", "store_count": 0, "stores": []}

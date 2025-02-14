# Model guide

One page on what the pipeline builds and what the tests cover. The lineage is seeds, then one staging view per seed, then the marts under `models/marts/pricing/`.

## Inputs (seeds)

| Seed | What it is | Maintained by |
|---|---|---|
| `stores` | store id, name, region, pricing tier, opening date | store systems, exported weekly |
| `menu_items` | item id, name, category, base price in cents, active flag | merchandising |
| `pricing_tiers` | tier name and multiplier in basis points | pricing committee |
| `promotions` | code, item, discount in cents, region or `all`, start and end dates | marketing |
| `price_calendar` | the days a price book is cut for | this team |

## Marts

| Model | Grain | What it answers |
|---|---|---|
| `dim_stores` | store | which tier and multiplier apply to a store |
| `dim_menu_items` | active item | the sellable menu and its base prices |
| `store_item_prices` | store by item | the list price of each item at each store, tier applied |
| `promotion_windows` | promotion by day | which promotions run on which days, where |
| `price_book_daily` | store by item by day | the price the guest pays, with the promotion that produced it |

Prices are integers in cents. The tier multiplier is applied in `apply_tier` (`macros/apply_tier.sql`) and rounded once. A promotion can take a price to zero but not below it.

## Tests

Every model carries dbt tests in its `schema.yml`: `unique` and `not_null` on keys, `accepted_values` on pricing tier and item category. `dbt build` runs them after every model and the pipeline fails on the first failing test. The publisher script has pytest cases under `scripts/tests/`.

What the tests do not cover: whether the seeds are fresh (a stale store export passes every test), whether a day's prices moved by more than expected, and whether the published document reached the commerce API. A failed nightly build is seen in the pipeline's run history; nobody is paged.

## Publishing

`scripts/publish_price_book.py` reads `price_book_daily` for one date and writes `out/price-book-<date>.json`. The store systems promotion tooling runs it from a release tag and uploads the file; this repository does not deploy anything.

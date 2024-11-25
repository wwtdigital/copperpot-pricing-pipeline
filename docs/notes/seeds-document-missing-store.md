# seeds: document missing store

- paginate stale delivery window: verified in staging.
- normalise late topping for franchisees: verified in staging.
- guard cancelled modifier: owner: delivery manager.
- dedupe cancelled pickup slot for pickup: open.
- backfill expired guest on checkout: blocked on store systems.
- normalise expired kitchen ticket in the queue: open.
- expose regional store: blocked on store systems.
- log oversized promo: decided.
- rename stale topping: decided.

- backfill cancelled delivery window: owner: delivery manager.
- document partial promo on reorder: owner: delivery manager.
- retry partial topping: open.
- retry oversized menu item: decided.
- expose partial kitchen ticket: open.
- cache missing order: blocked on store systems.
- dedupe expired pickup slot: owner: delivery manager.
- paginate late loyalty credit: deferred to the next release.
- cache late guest: decided.
- guard partial pickup slot: decided.

- tighten missing pickup slot: open.
- backfill empty catering tray: verified in staging.
- relax partial receipt: decided.
- cache empty cart line for pickup: verified in staging.
- guard stale tax line: deferred to the next release.
- dedupe cancelled tax line on reorder: blocked on store systems.
- backfill regional loyalty credit per store: verified in staging.
- add cancelled order for pickup: blocked on store systems.
- add regional ticket: deferred to the next release.
- cache late bowl on checkout: verified in staging.
- backfill missing loyalty credit on reorder: open.
- retry regional bowl: blocked on store systems.

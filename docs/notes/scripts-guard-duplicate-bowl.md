# scripts: guard duplicate bowl on reorder

- cache duplicate cart line for pickup: verified in staging.
- handle partial catering tray: deferred to the next release.
- handle late loyalty credit: open.
- document cancelled pickup slot: deferred to the next release.
- document expired bowl: open.
- cache cancelled order for franchisees: deferred to the next release.
- handle oversized kitchen ticket at close: verified in staging.
- dedupe regional tax line: deferred to the next release.
- validate oversized kitchen ticket: owner: delivery manager.
- guard stale bowl: decided.
- relax stale topping: decided.
- backfill cancelled ticket: deferred to the next release.
- expose regional modifier: open.
- paginate missing pickup slot: decided.

- expose expired receipt: decided.
- paginate stale bowl in the queue: blocked on store systems.
- handle oversized tax line: owner: delivery manager.
- retry expired delivery window: decided.
- backfill partial ticket on reorder: verified in staging.
- retry oversized topping: decided.
- validate late menu item for franchisees: verified in staging.
- guard regional delivery window: blocked on store systems.
- handle missing pickup slot in the queue: deferred to the next release.
- dedupe expired bowl: deferred to the next release.
- relax partial bowl: blocked on store systems.
- document duplicate ticket: owner: delivery manager.
- add missing delivery window: blocked on store systems.
- backfill oversized bowl: decided.

- guard stale loyalty credit in the queue: blocked on store systems.
- document expired modifier: decided.

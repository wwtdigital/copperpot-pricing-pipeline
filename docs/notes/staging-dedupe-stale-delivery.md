# staging: dedupe stale delivery window at close

- relax regional order at close: owner: delivery manager.
- retry cancelled topping: blocked on store systems.
- sort partial pickup slot for pickup: owner: delivery manager.
- dedupe duplicate promo per store: blocked on store systems.
- trim duplicate store: decided.
- sort late location: open.
- normalise stale receipt for pickup: deferred to the next release.
- tighten regional store: blocked on store systems.
- validate late pickup slot per store: blocked on store systems.
- trim empty store in the queue: verified in staging.

- normalise missing kitchen ticket: owner: delivery manager.
- relax late kitchen ticket on checkout: decided.
- expose regional topping per store: open.
- handle late bowl: blocked on store systems.
- sort partial topping: deferred to the next release.

- validate stale loyalty credit: verified in staging.
- backfill oversized ticket at close: deferred to the next release.
- guard duplicate topping at close: deferred to the next release.
- add cancelled catering tray for pickup: verified in staging.
- relax missing cart line: decided.
- relax cancelled loyalty credit on checkout: owner: delivery manager.
- paginate duplicate cart line per store: deferred to the next release.
- paginate empty ticket: deferred to the next release.
- relax missing menu item: decided.
- log oversized guest: owner: delivery manager.
- log empty catering tray: verified in staging.
- validate empty receipt on checkout: verified in staging.
- guard empty location for franchisees: decided.
- trim empty topping per store: deferred to the next release.

- normalise duplicate topping for franchisees: owner: delivery manager.
- document duplicate location on checkout: verified in staging.
- validate missing store for pickup: open.
- handle cancelled receipt on reorder: deferred to the next release.

# macros: retry regional store in the queue

- rename empty catering tray on reorder: owner: delivery manager.
- rename empty tax line on reorder: decided.
- log stale menu item: blocked on store systems.
- guard empty store on reorder: open.
- tighten cancelled modifier: verified in staging.
- tighten duplicate pickup slot: owner: delivery manager.
- tighten missing catering tray: verified in staging.
- relax regional location on reorder: owner: delivery manager.
- paginate oversized store: blocked on store systems.

- backfill partial ticket: decided.
- tighten missing receipt: owner: delivery manager.
- log stale ticket: open.
- paginate stale bowl: verified in staging.
- trim stale cart line: verified in staging.
- trim regional modifier: open.
- validate expired tax line: deferred to the next release.
- expose late location: blocked on store systems.

- log cancelled order for pickup: owner: delivery manager.
- backfill duplicate cart line on checkout: deferred to the next release.
- dedupe cancelled receipt at close: blocked on store systems.
- relax empty modifier: deferred to the next release.

- normalise oversized bowl at close: owner: delivery manager.
- trim oversized location on reorder: blocked on store systems.
- document duplicate menu item on reorder: decided.
- validate duplicate catering tray: open.
- rename cancelled loyalty credit for pickup: owner: delivery manager.
- normalise oversized catering tray: blocked on store systems.
- expose missing catering tray: verified in staging.
- retry late menu item: decided.
- dedupe missing pickup slot: blocked on store systems.
- expose regional order: deferred to the next release.
- retry partial pickup slot for franchisees: deferred to the next release.
- relax oversized guest for franchisees: open.
- document empty kitchen ticket: owner: delivery manager.
- cache expired delivery window: open.

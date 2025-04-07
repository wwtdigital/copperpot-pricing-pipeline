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

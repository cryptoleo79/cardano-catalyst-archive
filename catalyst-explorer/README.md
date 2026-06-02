# catalyst-explorer

Captures from `catalystexplorer.com`, a community-maintained Catalyst mirror. Class D (community-maintained) per the source authority hierarchy.

## Files

- `funds/{N}.html` — per-fund detail pages
- `api/campaigns/page-{N}.json` — dump of the `/api/campaigns?page=N` undocumented JSON API (6 pages × 24 campaigns = 140 campaigns total with fund-prefixed titles)

## Capture method

`curl -sL --user-agent "cdo-preserve/1.0"` against the per-fund and per-API-page URLs. Polite rate limit.

## Use

The fund-prefixed campaign titles in the JSON API (e.g., `"F9: Fund10 challenge setting"`) are the cleanest fund→campaign-name mapping available without authentication. Used as the cross-validation source for the Wayback-parsed IdeaScale fund mapping (see `ideascale/fund-mapping.json` derivation).

`catalystexplorer.com` is not the primary source for any Catalyst datum — `projectcatalyst.io` and `cardano-foundation/catalyst-core` are. Use this folder for corroboration and gap detection.

## Re-capture cadence

On fund close per METHODOLOGY.md §24.9 Band 4, plus opportunistic re-capture if catalystexplorer announces a substantive content update.

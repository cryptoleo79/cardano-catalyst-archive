# on-chain

Canonical Koios query records for Cardano Catalyst payout transactions per fund. Class A (on-chain) per the source authority hierarchy.

The Cardano blockchain itself preserves the transactions. This folder does not hold the transaction bytes — it holds the queries needed to retrieve them from any Cardano explorer that exposes the Koios endpoints.

## Files

- `funds/{N}/payouts.queryspec.json` — JSON document specifying the Koios endpoint, parameter set, expected response field schema, snapshot date for which the query was recorded, and a `notes` field explaining the fund→payout mapping.

## Verification

A researcher reproducing the archive:

1. Reads the queryspec.
2. Issues the recorded query against `https://api.koios.rest/api/v1/{endpoint}` with the recorded parameters.
3. Verifies the returned transactions match the queryspec's expected response schema.
4. Per-transaction `tx_hash` is the Cardano protocol's own integrity stamp.

If Koios is unavailable, equivalent endpoints on Blockfrost, Cardano-Foundation node, or self-hosted db-sync expose the same on-chain data. The queryspec is portable to any compatible Cardano explorer.

## Re-capture cadence

None. The chain preserves itself. The queryspec is updated only when Koios's API contract changes (e.g., endpoint rename); old queryspecs are preserved and a new one is added with a `supersedes` field referencing the prior.

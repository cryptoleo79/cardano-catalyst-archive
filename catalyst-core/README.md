# catalyst-core

Bare git mirror of `cardano-foundation/catalyst-core` (relocated from `input-output-hk/catalyst-core` prior to FLOW-6 capture). Class B per the source authority hierarchy.

## What is here

- `repo.git/` — bare git mirror clone. **Not a working tree.** Run `git clone catalyst-core/repo.git` locally to materialize files.
- `repo.git.custody.json` — chain-of-custody manifest for the clone operation.
- `bundles/{YYYY-MM-DD}.sha256` — per-week bundle hash records. The bundle file itself is not stored; the hash record is sufficient to prove what the repo looked like on that date.

## Known gaps

- **F2–F9 per-fund data is encrypted SQLite** (`fundN_database_encrypted.sqlite3`). The decryption key has not been published by IO or Cardano Foundation. The archive preserves the encrypted bytes verbatim; their interior content (proposal URLs, per-proposal metadata) is not extractable without the key. F0 and F1 remain as plain `.sql` (pre-IdeaScale era).
- **F10 and later are not in catalyst-core at all.** The repository's historic-data directory ends at `fund_9/`. F10+ depends on `projectcatalyst.io` plus IdeaScale (via Wayback) for the off-chain record.

## Capture method

`git clone --mirror https://github.com/cardano-foundation/catalyst-core.git` once. Weekly `git fetch --all` thereafter. The chain-of-custody hash is the SHA-256 of `git bundle create archive.bundle --all` output — a single deterministic byte-stream representing the entire repo state.

## Re-capture cadence

Weekly bundle-hash record per METHODOLOGY.md §24.9 Band 2. The mirror itself is updated incrementally; the bundle hash captures the point-in-time state.

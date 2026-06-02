# Cardano Catalyst archive

Preservation archive for Cardano Catalyst's historical record — proposal text, voting tallies, milestone status, on-chain payouts — across Fund 1 through the most recent closed fund.

**This archive preserves. It does not curate, interpret, score, or rank.**

## What this is

A community-runnable, byte-verifiable, chain-of-custody-documented mirror of the off-chain Catalyst record. Built to remain useful when the live sources disappear.

## Why this exists

Cardano Catalyst's off-chain governance record has lived primarily on `cardano.ideascale.com`. That platform is in transition; its content is already inaccessible from the live URL (the site is a JavaScript SPA that returns an empty shell). The Wayback Machine archived the platform before its SPA conversion; this archive mirrors the Wayback snapshots with chain-of-custody manifests so the captured bytes are byte-verifiable and citable for research.

The same preservation discipline extends to `projectcatalyst.io` per-fund landing pages, the `cardano-foundation/catalyst-core` repository, `catalystexplorer.com` community data, the `milestones.projectcatalyst.io` tracker, and on-chain Catalyst payout transactions reconstructible from Koios.

## Architectural facts every reader should know

1. **IdeaScale content is preserved via the Wayback Machine, not from `cardano.ideascale.com` directly.** The live IdeaScale surface is a JavaScript SPA returning an 852-byte empty shell for every URL. The Wayback Machine holds server-rendered snapshots from before that conversion. This archive's `ideascale/campaigns/` folder is a mirror of those snapshots, not a mirror of the live site.
2. **`catalyst-core/repo.git/` is a bare git mirror clone**, not a working tree. `git clone` it locally to materialize files.
3. **`catalyst-core` F2–F9 per-fund data is stored as encrypted SQLite databases.** The decryption key has not been published. The archive preserves the encrypted bytes verbatim; their interior content is not extractable without the key.
4. **The archive does not pursue API tokens, special access, or authenticated endpoints.** Every byte in this archive was fetched from a publicly-accessible URL using a polite client. A graduate student with a stock laptop must be able to reproduce every capture from scratch.

## What is preserved

Per fund, the archive holds (subject to source availability):

- Per-fund landing page and voting-results page from `projectcatalyst.io`.
- IdeaScale campaign-about pages and per-proposal pages, fetched via the Wayback Machine, for every campaign in the Wayback CDX index for that fund.
- `cardano-foundation/catalyst-core` bare git mirror (covers F0–F9; F10+ not in this repository upstream).
- `catalystexplorer.com` per-fund detail pages and the `catalystexplorer.com/api/campaigns` JSON dump.
- Per-funded-proposal milestone tracker pages from `milestones.projectcatalyst.io`.
- On-chain Catalyst payout transaction queries (Koios endpoint specifications), reconstructible on demand from the Cardano blockchain.

Each captured artifact carries a `.custody.json` sidecar with source URL, capture date, capture method, capture operator, SHA-256 hash, content type, HTTP status, source authority class, capture session ID, and Wayback URL. See the methodology link below for the full specification.

## What is not preserved

- Catalyst Voices governance content (the successor platform). Once Catalyst Voices is the canonical surface, the archive will extend; today it does not.
- Private proposal drafts or workspace content not published in a fund's voting record.
- Personal information about proposers or voters beyond what appears in the public Catalyst record.
- Editorial commentary on Catalyst funds, whether community-authored or operator-authored.

## How to use

**Browse:** each per-source subfolder mirrors the source URL structure. To find a known proposal, navigate by fund and then by campaign or proposal ID.

**Verify:** run `_verify/verify-artifact.sh {path}` to check a single file's SHA-256 against its manifest. Run `_verify/verify-archive.sh` to walk the whole archive and report any integrity failures.

**Cite:** every captured artifact is citable via its SHA-256 hash plus its `wayback_url` (where applicable). A publication citing a Catalyst proposal can include the hash as the canonical reference; subsequent readers can verify they are reading what was originally captured.

## How to contribute

Class E (researcher capture) contributions are welcomed. See `CONTRIBUTING.md` for the chain-of-custody manifest schema your capture must satisfy and the review checklist.

## Methodology

The full preservation methodology lives at the Cardano Delegation Observatory repository: [METHODOLOGY.md §24](https://github.com/cryptoleo79/cardano-delegation-observatory/blob/main/METHODOLOGY.md#24-catalyst-preservation-methodology-flow-6).

The methodology defines: source authority hierarchy, chain-of-custody requirements, provenance retention, repository separation rule, what the archive explicitly does NOT do, capture lifecycle, and trigger conditions. This archive is operated in conformance with that methodology.

The operational design specification for this repository — directory structure, manifest schema, hash conventions, update policy, contributor pathway — lives at [docs/CATALYST_ARCHIVE_REPOSITORY_DESIGN.md](https://github.com/cryptoleo79/cardano-delegation-observatory/blob/main/docs/CATALYST_ARCHIVE_REPOSITORY_DESIGN.md) in the same observatory repository.

## License

See `LICENSE` for the archive's code and our authored manifests. See `NOTICE` for the multi-layer license model that applies to captured third-party content.

## Acknowledgements

This archive's existence depends on the Wayback Machine (`web.archive.org`), the `catalystexplorer.com` community project, and the public-data ethos of `projectcatalyst.io` and `cardano-foundation/catalyst-core`. None of these endorse this archive; all are gratefully cited.

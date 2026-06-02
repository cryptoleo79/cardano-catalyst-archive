# Contributing to the Cardano Catalyst archive

The archive welcomes Class E researcher captures — content captured by individuals outside the operator's normal workflow, contributed to the archive with full chain-of-custody documentation. This document specifies the contribution path.

The archive is governed by [METHODOLOGY.md §24](https://github.com/cryptoleo79/cardano-delegation-observatory/blob/main/METHODOLOGY.md#24-catalyst-preservation-methodology-flow-6) at the Cardano Delegation Observatory repository. If anything below contradicts §24, §24 wins.

## Before you capture

1. **Check whether the artifact is already in the archive.** Use `_verify/verify-archive.sh` or browse the relevant `INDEX.json` files. Duplicate captures of the same source URL are not rejected, but the manifests must independently document the capture method and date.
2. **Check whether the source falls under FLOW-6 scope.** Read METHODOLOGY.md §24.1. If your capture target is not in scope, the contribution will not be accepted as a primary record; it may still be useful as Class E corroboration depending on the case.
3. **Use a publicly-accessible URL.** The archive does not accept captures from authenticated endpoints, private API surfaces, or any source that an ordinary researcher cannot reproduce.

## What your contribution must include

For every artifact:

1. **The artifact file itself**, placed at the appropriate path under the per-source subfolder. File names should be lowercase, ASCII, hyphenated, with the file extension matching the artifact's content type.
2. **A `.custody.json` sidecar** colocated with the artifact, conforming to the JSON Schema at `_verify/schema/custody-v1.json`. All required fields populated. The `capture_operator` field must identify you (GitHub handle, attribution string, or `anonymous` — the *fact* of anonymity is still recorded). The `source_authority_class` field must be `E` (researcher capture).
3. **A SHA-256 hash** of the raw bytes as written to disk, recorded in the manifest's `sha256` field, lowercase hex.
4. **A Wayback Machine submission** for any URL that is web-accessible. The Wayback URL goes into the manifest's `wayback_url` field. If submission is impractical (e.g., the source is behind a paywall, an academic archive, or otherwise non-public-web), explain in the `notes` field; the contribution may still be acceptable but the review will weigh whether the artifact can be independently verified.

For a bulk contribution (multiple artifacts from one session):

5. **A `CAPTURE_LOG.json`** session log under the per-source subfolder's `CAPTURE_LOG/` directory, conforming to the per-session schema documented in [docs/CATALYST_CAPTURE_PLAN.md §4.2](https://github.com/cryptoleo79/cardano-delegation-observatory/blob/main/docs/CATALYST_CAPTURE_PLAN.md#42-per-session-capture-log-capture_logjson). The session ID format is `{YYYY-MM-DDTHH:MM:SSZ}-{source}-{descriptor}`.
6. **A rollup SHA-256** of the sorted per-file SHA-256 list, recorded in the session log's `rollup_sha256` field.

## Submission flow

1. Fork this repository on GitHub.
2. Create a branch named `contribution/{source}/{capture-session-id}`.
3. Add your artifact(s), `.custody.json` sidecar(s), and (for bulk) `CAPTURE_LOG.json`.
4. Update the per-source `INDEX.json` to reflect your additions (incremented counts, latest `last_capture_date`).
5. Open a pull request against `main`. The PR title should match the commit-message format in [docs/CATALYST_ARCHIVE_REPOSITORY_DESIGN.md §9.1](https://github.com/cryptoleo79/cardano-delegation-observatory/blob/main/docs/CATALYST_ARCHIVE_REPOSITORY_DESIGN.md). Example: `Capture session 2026-08-15T22:00:00Z-ideascale-c405-researcher-jdoe: ideascale (F11), 17 artifacts`.
6. The PR description should explain what was captured, why this artifact was selected, and any operational caveats.

## What the reviewer checks

The repository administrator reviews:

- **Manifest schema validation.** Every new `.custody.json` validates against `_verify/schema/custody-v1.json`.
- **Hash correctness.** Re-computing SHA-256 of each artifact matches the manifest. The `_verify/verify-artifact.sh` script is used.
- **Source authority class.** Class E contributions are accepted as primary records when the source is one for which no Class A–D coverage exists, and as supporting records otherwise. The manifest's `source_authority_class = "E"` is mandatory.
- **Capture method transparency.** The `capture_method` field describes a reproducible operation (tool + flags + version). A reviewer must be able to replay the capture to verify it produces equivalent output.
- **Polite-client compliance.** The capture must have respected the source's `robots.txt` and any documented rate limits. Captures that violated these will be rejected even if otherwise complete.
- **No editorial content.** Manifests' `notes` fields are operational, never editorial. Captured artifacts that have been edited, annotated, or commentary-added are rejected; the archive holds bytes-as-captured.
- **License compatibility.** Captured content must be redistributable under the archive's NOTICE terms. If the content is under a restrictive license that prohibits archival mirroring, the contribution is declined with explanation.

## What is not accepted

- Captures from authenticated, paywalled, or otherwise non-publicly-reproducible sources.
- Captures via UA spoofing or other practices that mislead the source server about the requester's identity.
- Captures with incomplete or malformed manifests (missing required fields, malformed SHA-256, etc.).
- Captures with editorial annotations baked into the artifact bytes or the manifest's `notes` field.
- Captures of out-of-scope content per METHODOLOGY.md §24.1.

## Anonymity

If you wish to contribute anonymously, set `capture_operator: "anonymous"` in your manifest. The *fact* of anonymity is recorded; the contribution is treated identically in the review process. The GitHub PR itself will, however, reveal the GitHub account that submitted it; consider using a pseudonymous GitHub account if you want full anonymity.

## After acceptance

Accepted contributions are merged to `main` with a non-squashing merge, preserving your commit history. The CHANGELOG.md is updated to reference the capture session ID. Your `.custody.json` sidecar's `capture_operator` field becomes the public record of your contribution.

The archive does not retract artifacts once merged unless the contributor requests retraction *and* the retraction is itself documented in CHANGELOG.md with a brief reason. The retraction policy is intentionally conservative: the archive's value depends on its bytes being durable.

## Questions

Open an issue on this repository. Issues about methodology should go to the upstream observatory repository.

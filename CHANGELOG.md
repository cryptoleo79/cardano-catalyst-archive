# Changelog

This file records archive-level events: repository creation, capture sessions, manifest back-fills, methodology version updates, and any retractions.

Per the [archive repository design §9.1](https://github.com/cryptoleo79/cardano-delegation-observatory/blob/main/docs/CATALYST_ARCHIVE_REPOSITORY_DESIGN.md), each capture session has its own commit; this file records the session at the archive level so a researcher can find session history without walking `git log`.

| Date | Session ID | Source | Artifacts | Notes |
|---|---|---|---|---|
| 2026-06-02 | 2026-06-02T19:58:14Z-projectcatalyst-io-f9 | projectcatalyst-io | 1 | First real capture in the archive: Fund 9 landing page (https://projectcatalyst.io/funds/9). Class B. Full 5-stage pipeline exercised: fetch (curl polite client, HTTP 200, 212353 bytes) → hash (SHA-256 045d340d…) → manifest (custody-v1, all required fields populated, wayback_url back-filled in same session) → Wayback submission (https://web.archive.org/web/20260602195936/…, returned within seconds, verified reachable) → index update (projectcatalyst-io/INDEX.json + top-level INDEX.json). verify-artifact.sh and verify-session.sh both pass. Phase 5 Step 3 per `docs/CATALYST_ARCHIVE_REPOSITORY_DESIGN.md`. |
| 2026-06-02 | — | — | 0 | Repository created. README, LICENSE, NOTICE, CONTRIBUTING, METHODOLOGY pointer, CHANGELOG, top-level INDEX.json, per-source subfolder INDEX.json files, and `_verify/` tooling committed. No artifacts captured yet. Phase 5 Step 1 per `docs/CATALYST_ARCHIVE_REPOSITORY_DESIGN.md`. |

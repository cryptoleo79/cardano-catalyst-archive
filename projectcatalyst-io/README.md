# projectcatalyst-io

Captures from `projectcatalyst.io` — the official Catalyst website. Class B (official Catalyst-issued) per the [source authority hierarchy in METHODOLOGY.md §24.3](https://github.com/cryptoleo79/cardano-delegation-observatory/blob/main/METHODOLOGY.md#243-source-authority-hierarchy).

## What is captured here

Per fund:

- `funds/{N}/index.html` — per-fund landing page
- `funds/{N}/voting-results.html` — voting-results page (in-page explorer for F2–F9, F11–F15; F10 is a PDF — see below)
- `funds/10/fund10-voting-results.pdf` — F10 voting results, the only fund whose canonical results are a standalone PDF
- `funds/1/fund1-voting-results-google-drive-mirror.pdf` — F1's Google Drive-hosted voting record, captured via Wayback Machine and locally mirrored because the Google Drive URL is the weakest Class B URL in the entire registry

Re-captures live at `by-date/{YYYY-MM-DD}/funds/{N}/...`. The original first capture at the canonical path is never overwritten — see [archive design §9.3](https://github.com/cryptoleo79/cardano-delegation-observatory/blob/main/docs/CATALYST_ARCHIVE_REPOSITORY_DESIGN.md).

## Capture method

`curl -sL --user-agent "cdo-preserve/1.0"` with a polite rate limit of ≤ 2 requests per second. The `.custody.json` sidecar records the exact invocation and any retry history.

## Re-capture cadence

Quarterly per [METHODOLOGY.md §24.9 Band 2](https://github.com/cryptoleo79/cardano-delegation-observatory/blob/main/METHODOLOGY.md#249-lifecycle-and-trigger-conditions). Plus on observed structural change to any URL.

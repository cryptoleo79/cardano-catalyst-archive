# milestones

Captures from `milestones.projectcatalyst.io` — per-proposal milestone tracker. Class B per the source authority hierarchy.

## What is captured

- `proposals/{proposal_id}.html` — per-proposal milestone status page

Milestone state per proposal: planned milestones, claimed completions, signoff status, and any milestone-level revisions as recorded by the tracker at capture time.

## Capture method

`curl -sL --user-agent "cdo-preserve/1.0"` against each per-proposal URL. **Note:** if the page is a JS-rendered SPA that does not deliver milestone state in the initial HTML, the capture method may need to escalate to a headless-browser snapshot. Per the [archive design open questions resolution](https://github.com/cryptoleo79/cardano-delegation-observatory/blob/main/docs/CATALYST_ARCHIVE_REPOSITORY_DESIGN.md#open-questions), that escalation requires a documented amendment to the capture plan before use.

## Re-capture cadence

Quarterly while the fund's milestones remain open; freeze at "last capture before fund-close + 6 months" once the milestone window closes.

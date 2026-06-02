# ideascale

Captures of `cardano.ideascale.com` content — proposal text, campaign about-pages, per-proposal pages. Class C (Catalyst-platform-hosted, at-risk) per the source authority hierarchy.

## Architectural fact

**The live `cardano.ideascale.com` surface is a JavaScript SPA returning a byte-identical empty 852-byte shell for every URL regardless of validity.** Verified by md5: valid campaign ID 332 (F9 "Great Migration"), valid campaign ID 343 (F10), and bogus ID 99999 all return identical bytes. Direct capture of the live site would archive useless artifacts.

The archive captures from the **Wayback Machine**, which holds server-rendered snapshots from before IdeaScale's SPA conversion. The Wayback CDX index identifies 238 distinct archived campaign IDs.

Files in this folder are mirrors of Wayback snapshots, not mirrors of the live site. Each `.custody.json` records both the original IdeaScale URL (`source_url`) and the specific Wayback snapshot URL fetched (`wayback_url` — load-bearing for Class C, not supplementary).

## Files

- `wayback-campaign-ids.txt` — output of the Wayback CDX enumeration query. One campaign ID per line, sorted.
- `fund-mapping.json` — canonical `{campaign_id → fund_N}` table. Source: Wayback snapshot title/breadcrumb parse, cross-validated against `catalystexplorer.com/api/campaigns`.
- `known-missing.json` — campaigns present in catalystexplorer's record but not in Wayback's CDX index. Known-missing-from-archive; not pursued via IdeaScale API per the FLOW-6 "no private access" rule.
- `campaigns/{campaign_id}/` — per-campaign captured content. `about.html` is the campaign about page; `idea/{idea_id}.html` are per-proposal pages.
- `CAPTURE_LOG/{session_id}.json` — per-session capture logs.

## Capture method

`curl -sL --user-agent "cdo-preserve/1.0"` against the latest Wayback snapshot URL, with a 2-second sleep between requests. The Wayback toolbar is stripped from the saved HTML before hashing (deterministic strip operation; `post_strip_applied: true` recorded in the manifest).

## Re-capture cadence

**Capture once per snapshot.** A Wayback snapshot is immutable. A later Wayback snapshot of the same campaign is a different artifact and would be captured separately under a new dated subdirectory.

If a campaign was never archived by Wayback (a known-missing entry), the gap is flagged and reviewed; no re-fetch from the live SPA can recover the content.

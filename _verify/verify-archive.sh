#!/usr/bin/env bash
# verify-archive.sh — walk the whole archive and verify every artifact.
#
# Usage:
#   _verify/verify-archive.sh
#
# Iterates over every .custody.json sidecar in the archive, locates its
# artifact (the file whose name is the sidecar's name minus .custody.json),
# and runs verify-artifact.sh on each. Reports a summary at the end.
#
# Exit code:
#   0 if all artifacts verify
#   non-zero if any verification failed (count of failures)

set -u
cd "$(dirname "$0")/.."  # archive repo root

pass=0
fail=0
failed_paths=()

# Find every .custody.json sidecar in the archive. Skip the schema file.
while IFS= read -r manifest; do
  if [ "$manifest" = "./_verify/schema/custody-v1.json" ]; then
    continue
  fi
  # Skip CAPTURE_LOG entries — those are session logs, not artifact manifests.
  case "$manifest" in
    */CAPTURE_LOG/*) continue ;;
  esac
  artifact="${manifest%.custody.json}"
  if _verify/verify-artifact.sh "$artifact" >/dev/null 2>&1; then
    pass=$((pass + 1))
  else
    fail=$((fail + 1))
    failed_paths+=("$artifact")
    # Re-run to show the error
    _verify/verify-artifact.sh "$artifact" || true
  fi
done < <(find . -name '*.custody.json' -type f | sort)

echo ""
echo "=== verify-archive.sh summary ==="
echo "PASS: $pass"
echo "FAIL: $fail"
if [ $fail -gt 0 ]; then
  echo "Failed artifacts:"
  for p in "${failed_paths[@]}"; do
    echo "  - $p"
  done
fi

exit $fail

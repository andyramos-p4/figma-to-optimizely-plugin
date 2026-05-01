#!/usr/bin/env bash
# Quick smoke-check that the four widget files exist and contain no obvious React/JSX leftovers.
# Usage: ./scripts/validate-output.sh experiments/<experiment-name>

set -e

EXP_DIR="${1}"

if [ -z "$EXP_DIR" ]; then
  echo "Usage: $0 experiments/<experiment-name>"
  exit 1
fi

OUT="$EXP_DIR/output/Optimizely"

for f in index.html styles.css script.js widget.json; do
  if [ ! -f "$OUT/$f" ]; then
    echo "Missing: $OUT/$f"
    exit 1
  fi
done

if grep -RnE "className=|useState|useEffect|import |from ['\"]react['\"]|^<>$" "$OUT" >/dev/null 2>&1; then
  echo "Framework syntax detected in $OUT:"
  grep -RnE "className=|useState|useEffect|import |from ['\"]react['\"]|^<>$" "$OUT"
  exit 1
fi

# Scoping smoke-test: warn on bare element selectors at column 1 of styles.css.
if grep -nE "^[a-zA-Z][a-zA-Z0-9_-]* *\{" "$OUT/styles.css" >/dev/null 2>&1; then
  echo "Warning: possible unscoped selectors in $OUT/styles.css:"
  grep -nE "^[a-zA-Z][a-zA-Z0-9_-]* *\{" "$OUT/styles.css"
fi

echo "✅ Output structure looks valid."

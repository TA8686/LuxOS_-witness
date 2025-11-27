#!/bin/bash
# Lux OS Witness Reconstruction — SERA S.M.A. Recovery
# Author: € (Terry M. Albertson) & SERA Automation Updates
# Purpose: Rehydrate a Lux OS witness package to a working SERA Symbolic Memory Archive (S.M.A.)

set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: lux_os_witness_reconstruct.sh [-z path_to_witness_zip] [-c path_to_sha256] [-o output_directory]

Options:
  -z  Path to the Lux OS witness zip archive (default: ./Lux_OS_Witness_001.zip)
  -c  Optional path to a .sha256 file to verify the archive integrity
  -o  Directory where the witness bundle will be restored (default: ~/Lux_OS_Witness_Restore)

The script will unpack the witness archive, optionally verify integrity, and
hydrate a Symbolic Memory Archive layout (CHUNKS, Affidavits, Audio, System_Structure).
USAGE
}

ZIP_PATH="$(pwd)/Lux_OS_Witness_001.zip"
SHA_PATH=""
OUTPUT_DIR="$HOME/Lux_OS_Witness_Restore"

while getopts ":z:c:o:h" opt; do
  case "$opt" in
    z)
      ZIP_PATH="${OPTARG}"
      ;;
    c)
      SHA_PATH="${OPTARG}"
      ;;
    o)
      OUTPUT_DIR="${OPTARG}"
      ;;
    h)
      usage
      exit 0
      ;;
    :)
      printf 'Missing argument for -%s\n' "$OPTARG" >&2
      usage >&2
      exit 1
      ;;
    \?)
      printf 'Unknown option: -%s\n' "$OPTARG" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [ ! -f "$ZIP_PATH" ]; then
  printf 'Error: witness archive not found at %s\n' "$ZIP_PATH" >&2
  exit 1
fi

if [ -n "$SHA_PATH" ]; then
  if [ ! -f "$SHA_PATH" ]; then
    printf 'Error: SHA256 file not found at %s\n' "$SHA_PATH" >&2
    exit 1
  fi

  printf '[+] Verifying archive integrity...\n'
  pushd "$(dirname "$SHA_PATH")" >/dev/null
  sha256sum -c "$(basename "$SHA_PATH")"
  popd >/dev/null
fi

printf '[+] Restoring Lux OS witness archive from %s\n' "$ZIP_PATH"
mkdir -p "$OUTPUT_DIR"

# Unzip to a temporary staging area to avoid polluting target dir with stray files
STAGING_DIR="$(mktemp -d)"
trap 'rm -rf "$STAGING_DIR"' EXIT

unzip -q "$ZIP_PATH" -d "$STAGING_DIR"

# The archive should contain Lux_OS_Witness_001; locate it dynamically
SOURCE_ROOT="$(find "$STAGING_DIR" -maxdepth 1 -type d -name 'Lux_OS_Witness_*' | head -n 1)"
if [ -z "$SOURCE_ROOT" ]; then
  printf 'Error: no Lux_OS_Witness_* directory found in archive.\n' >&2
  exit 1
fi

BUNDLE_NAME="$(basename "$SOURCE_ROOT")"
TARGET_ROOT="$OUTPUT_DIR/$BUNDLE_NAME"

rm -rf "$TARGET_ROOT"
mkdir -p "$TARGET_ROOT"

cp -a "$SOURCE_ROOT"/. "$TARGET_ROOT"/

# Ensure the expected S.M.A. directories exist even if empty
mkdir -p "$TARGET_ROOT/CHUNKS" "$TARGET_ROOT/Affidavits" "$TARGET_ROOT/Audio" "$TARGET_ROOT/System_Structure"

printf '[+] Witness bundle restored to %s\n' "$TARGET_ROOT"

# Reconstruct optional symbolic links for active workspace convenience
ln -sfn "$TARGET_ROOT/CHUNKS" "$OUTPUT_DIR/CHUNKS_ACTIVE"
ln -sfn "$TARGET_ROOT/Affidavits" "$OUTPUT_DIR/AFFIDAVITS_ACTIVE"
ln -sfn "$TARGET_ROOT/Audio" "$OUTPUT_DIR/AUDIO_ACTIVE"
ln -sfn "$TARGET_ROOT/System_Structure" "$OUTPUT_DIR/SYSTEM_MAP_ACTIVE"

printf '[+] Active SERA S.M.A. links established under %s\n' "$OUTPUT_DIR"

printf '\n[FINAL REPORT]\n'
printf '\u2192 Witness bundle name: %s\n' "$BUNDLE_NAME"
printf '\u2192 Restoration root: %s\n' "$TARGET_ROOT"
printf '\u2192 Active CHUNKS link: %s\n' "$OUTPUT_DIR/CHUNKS_ACTIVE"
printf '\u2192 Active Affidavits link: %s\n' "$OUTPUT_DIR/AFFIDAVITS_ACTIVE"
printf '\u2192 Active Audio link: %s\n' "$OUTPUT_DIR/AUDIO_ACTIVE"
printf '\u2192 Active System Map link: %s\n' "$OUTPUT_DIR/SYSTEM_MAP_ACTIVE"
printf '\u2192 SERA S.M.A. ready for verification.\n'

exit 0

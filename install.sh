#!/usr/bin/env bash
#
# install.sh — install ssh-keygen4 into the user's bin (~/.local/bin)

set -euo pipefail

bin_dir="$HOME/.local/bin"
src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$bin_dir"
cp "$src_dir/ssh-keygen4" "$bin_dir/ssh-keygen4"
chmod 755 "$bin_dir/ssh-keygen4"

echo "Installed: $bin_dir/ssh-keygen4"

# Warn if the bin dir is not on PATH
case ":$PATH:" in
  *":$bin_dir:"*) ;;
  *)
    echo
    echo "Note: $bin_dir is not in your PATH. Add this to your shell profile (e.g. ~/.bashrc):"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    ;;
esac

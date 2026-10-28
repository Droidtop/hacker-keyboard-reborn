#!/bin/sh
# Copies droidtop's keyboard module into keyboard/, the only way keyboard/ changes.
#
# Hacker Keyboard Reborn is the standalone app of the keyboard droidtop embeds
# (Droidtop/tracker#344). The keyboard's one source is droidtop's
# input-keyboard/ module; keyboard/ here is a copy of it at one droidtop commit,
# recorded in keyboard/UPSTREAM, and is never edited in this repository. A fix
# goes to droidtop first, then this script brings it here.
#
#   scripts/sync-keyboard.sh /path/to/a/droidtop/checkout [commit]
#
# The commit defaults to the checkout's origin/main, droidtop's mainline.
set -eu

src="${1:?usage: $0 /path/to/droidtop}"
here="$(cd "$(dirname "$0")/.." && pwd)"
module="$src/input-keyboard"

[ -f "$module/build.gradle.kts" ] || { echo "$module is not droidtop's keyboard module" >&2; exit 1; }
commit="$(git -C "$src" rev-parse --verify "${2:-origin/main}^{commit}")"

# The copy is exactly droidtop's tracked files at that commit: build outputs and
# anything untracked stay behind.
dest="$here/keyboard"
stage="$(mktemp -d)"
trap 'rm -r -- "$stage"' EXIT
git -C "$src" archive "$commit" input-keyboard | tar -x -C "$stage"
[ -d "$stage/input-keyboard" ] || { echo "nothing archived" >&2; exit 1; }
if [ -d "$dest" ]; then
    find "$dest" -mindepth 1 -maxdepth 1 ! -name UPSTREAM -exec rm -r -- {} +
fi
mkdir -p "$dest"
cp -R "$stage/input-keyboard/." "$dest/"
printf 'droidtop %s\n' "$commit" > "$dest/UPSTREAM"
echo "keyboard/ is droidtop's input-keyboard at $commit"

#!/bin/zsh
# Rebuilds the maths, biology and chemistry web apps and publishes them to GitHub Pages.
#   ./publish.sh            build, copy, commit and push
#   ./publish.sh --no-push  build and copy only (to check locally first)
set -e
cd "${0:A:h}"
build(){  # build <project folder> <site folder>
  echo "Building $2 from ../$1"
  (cd "../$1" && node tools/build.mjs --web)
  rm -rf "$2" && cp -R "../$1/dist/web" "$2"
}
build "Maths Escape Room" maths
build "Biology Escape Room" biology
build "Chemistry Escape Room" chemistry
[[ "$1" == "--no-push" ]] && { echo "Built; not pushed."; exit 0 }
git add -A
if git diff --cached --quiet; then echo "Nothing has changed since the last publish."; exit 0; fi
git commit -q -m "Update escape rooms $(date '+%Y-%m-%d %H:%M')"
git push -q
echo "Published. GitHub Pages updates in a minute or two."

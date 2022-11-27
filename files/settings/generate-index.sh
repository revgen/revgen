#!/bin/sh
##############################################################################
# sudo apt install gettext
##############################################################################
VERSION=0.1.0
OUTPUT=${1:-"/var/www/html/index.html"}
SRC="$(dirname "${0}")/index.tmpl.html"
if [ ! -f "${SRC}" ]; then
  echo "Template file '${SRC}' not found. Download it from the repository..."
  URL="https://raw.githubusercontent.com/revgen/revgen/master/files/settings/index.tmpl.html"
  wget -O "${SRC}" "${URL}" || exit 1
fi
if [ ! -f "${SRC}" ]; then
  echo "Error: template file '${SRC}' not found."
  exit 1
fi
echo "Generate ${OUTPUT} from ${SRC}"
export HOSTNAME="$(hostname | tr  "[:lower:]" "[:upper:]")"
export DATETIME_UTC="$(date -u +"%b %d %H:%M:%S %Z %Y")"
export VERSION="${VERSION}"
export COLOR_MAIN_BG="${COLOR_MAIN_BG:-"#fff"}"
export COLOR_MAIN_FG="${COLOR_MAIN_FG:-"#000"}"
# export COLOR_TITLE_BG="${COLOR_TITLE_BG:-"#1c7d36"}"
# export COLOR_TITLE_BG="${COLOR_TITLE_BG:-"#28cbe5"}"
# export COLOR_TITLE_BG="${COLOR_TITLE_BG:-"#2867e5"}"
# export COLOR_TITLE_BG="${COLOR_TITLE_BG:-"#9228e5"}"
# export COLOR_TITLE_BG="${COLOR_TITLE_BG:-"#e58c28"}"
export COLOR_TITLE_BG="${COLOR_TITLE_BG:-"#294172"}"
export COLOR_TITLE_FG="${COLOR_TITLE_FG:-"#fff"}"
export COLOR_LINK_MAIN="${COLOR_LINK_MAIN:-"#182744"}"
export COLOR_LINK_VISITED="${COLOR_LINK_VISITED:-"#182744"}"
export COLOR_LINK_HOVER="${COLOR_LINK_HOVER:-"#294172"}"
export COLOR_MAIN_BORDER="${COLOR_MAIN_BORDER:-"#444"}"
export COLOR_NOTE_FG="${COLOR_MAIN:-"#888"}"
mkdir -p "$(dirname "${OUTPUT}")" || exit 1
cat "${SRC}" | envsubst > "${OUTPUT}" || exit 1
echo "File '${OUTPUT}' was generated successfully."

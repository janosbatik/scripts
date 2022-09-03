#!/bin/bash
#SEARCH_DIR="C:\Users\Personal\Documents\scripts\Images\Images"
SEARCH_DIR="M:\Photography"
OUTPUT_DIR="./camera_jpegs"
LOOKUP_EXT=".jpg"

read -p "seach for \"${1}\" in \"${SEARCH_DIR}\"? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

mkdir -p "${OUTPUT_DIR}"

echo "looking for ${1%.*}.JPG"
find ${SEARCH_DIR} -type f -name "${1%.*}.JPG" -exec cp --verbose "{}" "${OUTPUT_DIR}/${1%.*} (camera version).JPG" \;


read -n 1 -s -r -p "Done. Press any key to continue"
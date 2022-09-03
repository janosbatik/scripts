#!/bin/bash

#SEARCH_DIR="C:\Users\Personal\Documents\scripts\Images\Images"
SEARCH_DIR="M:\Photography"
OUTPUT_DIR="./camera_jpegs"
LOOKUP_EXT=".jpg"
echo "number of lookup ${LOOKUP_EXT}s in current dir:"
find . -mindepth 1 -maxdepth 1 -type f -name "*${LOOKUP_EXT}" -printf x | wc -c

read -p "seach for orginal jpgs in \"${SEARCH_DIR}\"? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

mkdir -p "${OUTPUT_DIR}"

for FILE in *.jpg; do
	echo "looking for ${FILE%.*}.JPG"
    find ${SEARCH_DIR} -type f -name "${FILE%.*}.JPG" -exec cp --verbose "{}" "${OUTPUT_DIR}/${FILE%.*} (camera version).JPG" \;
done

read -n 1 -s -r -p "Done. Press any key to continue"
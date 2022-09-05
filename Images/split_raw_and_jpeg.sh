#!/bin/bash
if [ -z "$1" ];
   then echo "using current dir"; 
   else cd "$1"; 
fi
BASE_DIR=${PWD##*/}
read -p "sperate all jpgs and raws in \"${BASE_DIR}\"? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
JPEG_DIR="./${BASE_DIR} JPEG/"
RAW_DIR="./${BASE_DIR} RAW/"

mkdir -p "${JPEG_DIR}"
mkdir -p "${RAW_DIR}"

echo "moving JPEGs"
for FILE in *.JPG; do
   mv -vn "${FILE}" "${JPEG_DIR}"
done
echo -e "finished JPEGs\n"

echo "moving RAWs"
for FILE in *.RAF; do
   mv -vn "${FILE}" "${RAW_DIR}" 
done
for FILE in *.xmp; do
   mv -vn "${FILE}" "${RAW_DIR}" 
done
echo -e "finished RAWs\n"



read -n 1 -s -r -p "Press any key to continue"

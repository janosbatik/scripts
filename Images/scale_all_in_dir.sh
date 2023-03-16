read -p "Scale all jps to 1280px? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

NEW_WIDTH=1280
OUTPUT_DIR="scaled_$NEW_WIDTH"
SUFX="-${NEW_WIDTH}x"
EXT=".JPG"
mkdir -p $OUTPUT_DIR
echo "copying files..."
for FILE in *$EXT; do
   cp "$FILE" "$OUTPUT_DIR/${FILE%.*}$SUFX$EXT"
done
echo "done copying"
echo "converting files"
cd $OUTPUT_DIR
for FILE_COPY in *$EXT; do
   echo "converting $FILE_COPY"
   magick  "$FILE_COPY" -scale "$NEW_WIDTH" "$FILE_COPY"
done
read -n 1 -s -r -p "Press any key to continue"

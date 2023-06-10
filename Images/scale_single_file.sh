read -p "Enter new px width: " NEW_WIDTH 
FILE_COPY="${1%.*}x${NEW_WIDTH}.jpg"
echo "copying files..."
cp "$1" "$FILE_COPY"
echo "done copying"
echo "converting file"
magick  "$FILE_COPY" -scale $NEW_WIDTH "$FILE_COPY"
read -n 1 -s -r -p "Done. Press any key to continue"
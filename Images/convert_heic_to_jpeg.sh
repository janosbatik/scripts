read -p "Convert all .heic to .jpeg? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1


for FILE in *.HEIC; do
   echo "converting $FILE to ${FILE%.*}.jpeg"
   magick "$FILE" -quality 100% "${FILE%.*}.jpeg"
done
read -n 1 -s -r -p "Press any key to continue"
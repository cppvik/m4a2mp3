/bin/sh
TARGETDIR=$1
IFS=$(echo -en "\n\b")
for file in `find $TARGETDIR -name "*.m4a"`; do
	newfile=${file//m4a/mp3}
	ffmpeg -i "$file"  -ab 320k -map_metadata 0 -id3v2_version 3 "$newfile" &&
		rm "$file"
done

#This is a generic encoding script, I use it to encode screen recordings. Change -threads to your maximum number of threads up to 16
#!/bin/fish
for file in *.mkv
do
ffmpeg -i "$file" -c:v libx264 -crf 13 -preset veryslow -pix_fmt yuv420p -refs 6 -bf 16 -rc-lookahead 250 -x264opts "no-dct-decimate=1:no-fast-pskip=1" -me_range 32 -qcomp 0.70 -psy-rd 1.00:00 -aq-mode 3 -aq-strength .5 -mbtree 1 -deblock -3:-3 -threads 12 -c:a copy "${file%.*}_encoded".mp4
done

#!/bin/bash

png_path="pngs"
log_path="logs"

mkdir -p $png_path
mkdir -p $log_path

# run transcode for each file
for folder in $(ls ./videos/); do
#folder=SDR_4K
mkdir -p $png_path/$folder
mkdir -p $log_path/$folder

for file in $(ls ./videos/$folder); do
	tmpname="$(basename -- $file)"	
	sname=${tmpname##*-}
	bname=${sname%.*}

log_name=$log_path/$folder/$bname.log	

#for %a in ("*.mp4") do ffmpeg -i "%a" -vsync 0 "数据集路径\%~na%4d.png" -y
echo ffmpeg -i ./videos/$folder/$file -vsync 0 ./$png_path/$folder/${bname}%4d.png -y > ${log_name} 2>&1
ffmpeg -i ./videos/$folder/$file -vsync 0 ./$png_path/$folder/${bname}%4d.png -y > ${log_name} 2>&1
#echo ffmpeg -i ./videos/$folder/$file -vsync 0 ./$png_path/$folder/${bname}%4d.png -y

done
done


#!/bin/bash

flameshot gui --path $PWD/vimshot.png

convert vimshot.png \( +clone -alpha extract \
\( -size 10x10 xc:black -draw 'fill white circle 10,10 10,0' -write mpr:arc +delete \) \
\( mpr:arc \) -gravity northwest -composite \
\( mpr:arc -flip \) -gravity southwest -composite \
\( mpr:arc -flop \) -gravity northeast -composite \
\( mpr:arc -rotate 180 \) -gravity southeast -composite \) \
-alpha off -compose CopyOpacity -composite -compose over \
\( +clone -background '#333' -shadow 80x12+-8+5 \) \
+swap -background none -layers merge vimshot.png

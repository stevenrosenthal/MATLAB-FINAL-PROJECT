%Final Project
clc;clear;
filename = input('Enter filename: ','s');
pixels = imread(filename);
[height,width,colors]=size(pixels);
[r,c] = find( pixels(:,:,1)> 150 & pixels(:,:,1)< 165 & pixels(:,:,2) > 195 & pixels(:,:,2) < 210 & pixels(:,:,3) > 155 & pixels(:,:,3) < 175);
binary = false(height,width);
binary(r,c)=1;
imshowpair(pixels,binary,'montage');
%Final Project
clc;clear;
filename = input('Enter filename: ','s');
pixels = imread(filename);
[height,width,colors] = size(pixels);
tileColors = [205 193 180; 238 228 218;237 224 200;242 177 121;245 149 99;246 124 95;246 94 59;237 207 114;237 204 97;237 200 80;237 197 63;237 194 46];
startRC = [0 0];
matrix = zeros(4,4);
for c = 1:1:width
    if startRC(:) ~= 0
        break;
    end
    for r = 1:1:height
        if (pixels(r,c,1) == 187 & pixels(r,c,2)== 173 & pixels(r,c,3) == 160)   %#ok<*AND2>
            startRC = [r+10,c+16];
            break;
        end
    end
end
for boardCol = 0:1:3
    for boardRow = 0:1:3
        currentRC = [startRC(1)+(123*boardRow) startRC(2)+(123*boardCol)];
        [row,col] = find(pixels(currentRC(1),currentRC(2),2) == tileColors(:,2));
        number = 2^(row(1)-1);
        if number == 1
            number = 0;
        end
        matrix(boardRow+1,boardCol+1) = number;
        pwr = [];
    end
end
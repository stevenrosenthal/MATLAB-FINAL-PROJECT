function [board] = AnalyzeScreenshot(filename)
board = zeros(4,4);%2D matrix; 4x4
pixels = imread(filename);
[height,width,~] = size(pixels);
tileColors = [205 193 180; 238 228 218;237 224 200;242 177 121;245 149 99;246 124 95;246 94 59;237 207 114;237 204 97;237 200 80;237 197 63;237 194 46]; %Stores all rgb values for empty spaces and tiles
startRC = [0 0];
for c = 1:1:width
    if startRC(:) ~= 0 %Skips analyzing rest of picture once first tile is found
        break;
    end
    for r = 1:1:height
        if (pixels(r,c,1) == 187 & pixels(r,c,2)== 173 & pixels(r,c,3) == 160)   %#ok<*AND2> %finds top left corner of board's outline
            startRC = [r+10,c+16]; %Goes to top left of top left tile
            break;
        end
    end
end
for boardCol = 0:1:3
    for boardRow = 0:1:3
        currentRC = [startRC(1)+(123*boardRow) startRC(2)+(123*boardCol)]; %Shifts to next tile on board
        [row,~] = find(pixels(currentRC(1),currentRC(2),2) == tileColors(:,2)); %Searches for specific green value that denotes tile value in ascending tileColor matrix
        number = 2^(row(1)-1); %Row in tileColor matrix determines power to raise 2 to in order to decode tile number 
        if number == 1 
            number = 0; %allows us to import a 0 into the matrix despite MATLAB indexing starts at 1
        end
        board(boardRow+1,boardCol+1) = number; %imports decoded number into matrix
    end
end
end


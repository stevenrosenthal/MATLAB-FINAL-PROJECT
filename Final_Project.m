%Final Project
%% Part 1
clc;clear;
filename = input('Enter filename: ','s');
pixels = imread(filename);
[height,width,colors] = size(pixels);
tileColors = [205 193 180; 238 228 218;237 224 200;242 177 121;245 149 99;246 124 95;246 94 59;237 207 114;237 204 97;237 200 80;237 197 63;237 194 46]; %Stores all rgb values for empty spaces and tiles
startRC = [0 0];
board = zeros(4,4);%2D matrix; 4x4
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
        [row,col] = find(pixels(currentRC(1),currentRC(2),2) == tileColors(:,2)); %Searches for specific green value that denotes tile value in ascending tileColor matrix
        number = 2^(row(1)-1); %Row in tileColor matrix determines power to raise 2 to in order to decode tile number 
        if number == 1 
            number = 0; %allows us to import a 0 into the matrix despite MATLAB indexing starts at 1
        end
        board(boardRow+1,boardCol+1) = number; %imports decoded number into matrix
    end
end
%% Part 2
direction = input('Enter direction: ','s');
nonZeros = [];
score = 0;
if direction(1) == 'l' %left
for board_Row = 1:1:4
  nonZeros = find( board(board_Row,:) ~= 0);
  potentialSpaces = nonZeros - 1;
  for ii = 1:1:length(nonZeros)
    nonZerosAhead = length( find(nonZeros < nonZeros(ii)));
    potentialSpaces(ii)  = potentialSpaces(ii) - nonZerosAhead;
    movedNonZeros = nonZeros - potentialSpaces;
    if board(board_Row,movedNonZeros(ii)) ~= board(board_Row,nonZeros(ii))
        board(board_Row,movedNonZeros(ii)) = board(board_Row,nonZeros(ii));
        if length(nonZeros) ~= 4
            board(board_Row,nonZeros(ii)) = 0;
        end
    end
  end
end
for board_Row = 1:1:4
    for board_Col = 1:1:3
        if board(board_Row,board_Col) == board(board_Row,board_Col+1)
            board(board_Row,board_Col) = 2*(board(board_Row,board_Col));
            score = score + board(board_Row,board_Col);
            board(board_Row,board_Col+1) = 0;
        end
    end
end
for board_Row = 1:1:4
  nonZeros = find( board(board_Row,:) ~= 0);
  potentialSpaces = nonZeros - 1;
  for ii = 1:1:length(nonZeros)
    nonZerosAhead = length( find(nonZeros < nonZeros(ii)));
    potentialSpaces(ii)  = potentialSpaces(ii) - nonZerosAhead;
    movedNonZeros = nonZeros - potentialSpaces;
    board(board_Row,movedNonZeros(ii)) = board(board_Row,nonZeros(ii));
    if board(board_Row,movedNonZeros(ii)) ~= board(board_Row,nonZeros(ii))
        board(board_Row,movedNonZeros(ii)) = board(board_Row,nonZeros(ii));
        if length(nonZeros) ~= 4
            board(board_Row,nonZeros(ii)) = 0;
        end
    end
  end
end

elseif direction(1) == 'r' %right    
for board_Row = 1:1:4
 nonZeros = find( board(board_Row,:) ~= 0);
  potentialSpaces = 4 - nonZeros;
  for ii = length(nonZeros):-1:1
    nonZerosAhead = length( find(nonZeros > nonZeros(ii)));
    potentialSpaces(ii)  = potentialSpaces(ii) - nonZerosAhead;
    movedNonZeros = nonZeros + potentialSpaces;
    if board(board_Row,movedNonZeros(ii)) ~= board(board_Row,nonZeros(ii))
        board(board_Row,movedNonZeros(ii)) = board(board_Row,nonZeros(ii));
        if length(nonZeros) ~= 4
            board(board_Row,nonZeros(ii)) = 0;
        end
    end
  end
end
for board_Row = 1:1:4
    for board_Col = 1:1:3
        if board(board_Row,board_Col) == board(board_Row,board_Col+1)
            board(board_Row,board_Col+1) = 2*(board(board_Row,board_Col));
            score = score + board(board_Row,board_Col+1);
            board(board_Row,board_Col) = 0;
        end
    end
end
for board_Row = 1:1:4
 nonZeros = find( board(board_Row,:) ~= 0);
  potentialSpaces = 4 - nonZeros;
  for ii = length(nonZeros):-1:1
    nonZerosAhead = length( find(nonZeros > nonZeros(ii)));
    potentialSpaces(ii)  = potentialSpaces(ii) - nonZerosAhead;
    movedNonZeros = nonZeros + potentialSpaces;
    if board(board_Row,movedNonZeros(ii)) ~= board(board_Row,nonZeros(ii))
        board(board_Row,movedNonZeros(ii)) = board(board_Row,nonZeros(ii));
        if length(nonZeros) ~= 4
            board(board_Row,nonZeros(ii)) = 0;
        end
    end
  end
end

elseif direction(1) == 'u' %up
for board_Col = 1:1:4
        nonZeros = find( board(:,board_Col) ~= 0);
        potentialSpaces = nonZeros - 1;
    for ii = 1:1:length(nonZeros)
        nonZerosAhead = length( find(nonZeros < nonZeros(ii)));
        potentialSpaces(ii)  = potentialSpaces(ii) - nonZerosAhead;
        movedNonZeros = nonZeros - potentialSpaces;
        if board(movedNonZeros(ii),board_Col) ~= board(nonZeros(ii),board_Col)
            board(movedNonZeros(ii),board_Col) = board(nonZeros(ii),board_Col);
            if length(nonZeros) ~= 4
                board(nonZeros(ii),board_Col) = 0;
            end
        end
    end
end
for board_Col = 1:1:4
        for board_Row = 1:1:3
            if board(board_Row,board_Col) == board(board_Row+1,board_Col)
                board(board_Row,board_Col) = 2*(board(board_Row,board_Col));
                score = score + board(board_Row,board_Col);
                board(board_Row+1,board_Col) = 0;
            end
        end
end
for board_Col = 1:1:4
        nonZeros = find( board(:,board_Col) ~= 0);
        potentialSpaces = nonZeros - 1;
        for ii = 1:1:length(nonZeros)
            nonZerosAhead = length( find(nonZeros < nonZeros(ii)));
            potentialSpaces(ii)  = potentialSpaces(ii) - nonZerosAhead;
            movedNonZeros = nonZeros - potentialSpaces;
            if board(movedNonZeros(ii),board_Col) ~= board(nonZeros(ii),board_Col)
                board(movedNonZeros(ii),board_Col) = board(nonZeros(ii),board_Col);
                if length(nonZeros) ~= 4
                    board(nonZeros(ii),board_Col) = 0;
                end
            end
        end
end
    
elseif direction(1) == 'd' %down
for board_Col = 1:1:4
 nonZeros = find( board(:,board_Col) ~= 0);
  potentialSpaces = 4 - nonZeros;
  for ii = length(nonZeros):-1:1
    nonZerosAhead = length( find(nonZeros > nonZeros(ii)));
    potentialSpaces(ii)  = potentialSpaces(ii) - nonZerosAhead;
    movedNonZeros = nonZeros + potentialSpaces;
    if board(movedNonZeros(ii),board_Col) ~= board(nonZeros(ii),board_Col)
        board(movedNonZeros(ii),board_Col) = board(nonZeros(ii),board_Col);
        if length(nonZeros) ~= 4
            board(nonZeros(ii),board_Col) = 0;
        end
    end
  end
end
for board_Col = 1:1:4
    for board_Row = 1:1:3
        if board(board_Row,board_Col) == board(board_Row+1,board_Col)
            board(board_Row+1,board_Col) = 2*(board(board_Row,board_Col));
            score = score + board(board_Row,board_Col);
            board(board_Row,board_Col) = 0;
        end
    end
end
for board_Col = 1:1:4
 nonZeros = find( board(:,board_Col) ~= 0);
  potentialSpaces = 4 - nonZeros;
  for ii = length(nonZeros):-1:1
    nonZerosAhead = length( find(nonZeros > nonZeros(ii)));
    potentialSpaces(ii)  = potentialSpaces(ii) - nonZerosAhead;
    movedNonZeros = nonZeros + potentialSpaces;
    if board(movedNonZeros(ii),board_Col) ~= board(nonZeros(ii),board_Col)
        board(movedNonZeros(ii),board_Col) = board(nonZeros(ii),board_Col);
        if length(nonZeros) ~= 4
            board(nonZeros(ii),board_Col) = 0;
        end
    end
  end
end
end
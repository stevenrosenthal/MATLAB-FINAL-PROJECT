function [new_board,score] = MakeMove(board,direction)
nonZeros = []; %#ok<NASGU>
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

new_board = board;
end


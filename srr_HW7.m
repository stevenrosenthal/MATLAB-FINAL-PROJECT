%Maxi Yatzy Score Keeper
clc; clear;
cnt = 1;
roll = input('Enter your 6 dice: ');
chance = sum(roll);
fprintf('Chance:\t\t\t\t   %d points\n',chance);
roll = sort(roll);
if (((roll(1)^2)+(roll(3)^2)+(roll(5)^2)) == (roll(1)*roll(2))+(roll(3)*roll(4))+(roll(5)*roll(6)) && roll(1)*6~=sum(roll))
    fprintf('Three pairs:\t\t   35 points\n');
else
    fprintf('Three pairs:\t\t   0 points\n');
end
for ii = length(roll):-1:2
    if(roll(ii) == roll(ii-1))
        roll(ii) =[];
        continue;
    end
    if(roll(ii)-1 == roll(ii-1))
        cnt = cnt + 1;
    end
end
if (cnt == 5 && roll(1)*length(roll) ~= sum(roll))
    fprintf('Small Straight (4):\t   40 points\n');
    fprintf('Large Straight (5):\t   50 points\n');
elseif(cnt == 4)
    fprintf('Small Straight (4):\t   40 points\n');
    fprintf('Large Straight (5):\t   0 points\n');
else
    fprintf('Small Straight (4):\t   0 points\n');
    fprintf('Large Straight (5):\t   0 points\n');
end
if (roll(1)*length(roll) == sum(roll))
    fprintf('Maxiyatzy:\t\t\t   100 points\n');
else
    fprintf('Maxiyatzy:\t\t\t   0 points\n');
end
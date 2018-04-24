%Final Project
%% Part 1
clc;clear;
filename = input('Enter filename: ','s');
board = AnalyzeScreenshot(filename);
%% Part 2
direction = input('Enter direction: ','s');
[new_board,score] = MakeMove(board,direction);
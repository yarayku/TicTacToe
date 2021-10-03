function [ board ] = findmove( boardp,player )
%   function findmove.m
%   the function makes a tictactoe move using bestmove function 
%       input
%           boardp: the original board, a vector
%           player: a number(1 or 2)
%       output
%           board: new board after player moves
%   October 18, 2016.
%   Last Modified: October 26, 2016.
%   Written by:Yaray Ku
if ~isempty(find(boardp==0))
    indx = bestmove(boardp,player);
    randm = randi(length(indx)); % indx form bestmove function
    boardp(indx(randm)) = player;
    board = boardp;
end
end

function [ board ] = readmove( boardp,player )
%   function readmove.m
%   the function examines if the tictactoe move of players is valid
%       input
%           boardp: the original board, a vector
%           player: a number(1 or 2)
%       output
%           board: new board after player moves
%   October 18, 2016.
%   Last Modified: October 26, 2016.
%   Written by:Yaray Ku
kplay = true;
while kplay
    indxMove = input(['Choose one of the following position, ',...
        num2str(find(boardp==0)), ': ']);
    
    if checkmove(boardp,indxMove) % invalid returns 1
        disp('Invalid input')
    else
        boardp(indxMove) = player;
        board = boardp;
        % player1 = 1
        % player2 = 2
        kplay = false;
    end
end



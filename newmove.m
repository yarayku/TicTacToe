function [ ipos player ] = newmove( board,boardp )
%   function newmove.m
%   the function returns a new move a player just did
%       input
%           boardp: the original board, a vector
%           board: new board after player movesinput
%       output
%           ipos: the position on board(from 1-9)
%       output 
%           [x y] = the numbers of coordinate position
%   October 19, 2016.
%   Last Modified: October 26, 2016.
%   Written by:Yaray Ku
% 
move = board - boardp;
[player,ipos] = find(move~=0);
end


function [ ierr ] = checkmove( board,indxMove )
%   function checkmove.m
%   the function examines if the input move is out of range. 
%       input
%           boardp: the new board after human input a indxMove
%           indxMove: the move player does 
%       output
%           ierr: logical true or false
%   October 18, 2016.
%   Last Modified: October 26, 2016.
%   Written by:Yajui Ku

if indxMove < 1 || indxMove > 9
    ierr = true; % invalid
elseif board(indxMove) == 0 % valid
    ierr = false;
else
    ierr = true; % invalid
end


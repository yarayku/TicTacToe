function [ iout ] = checkwinner( board )
%   function checkwinner.m
%   the function checks the winner
%       input
%           board: the outcome of playing, vector
%       output
%           iout: 4 possibilities
%           iout=1, when player1 wins
%           iout=2, when player2 wins
%           iout=3, draw
%           iout=4, game continues
%   October 18, 2016.
%   Last Modified: October 26, 2016.
%   Written by:Yaray Ku

win = [1 2 3;4 5 6;7 8 9;1 4 7;2 5 8;3 6 9;1 5 9;3 5 7];
iswin1 = find(board == 1);
iswin2 = find(board == 2);
iout = 0;
for k = 1:length(win)
    ele = win(k,:);
    if ~isempty(find(iswin1==ele(1)))...  % player1 wins
            && ~isempty(find(iswin1==ele(2)))...
            && ~isempty(find(iswin1==ele(3)))
        iout = 1;
    elseif ~isempty(find(iswin2==ele(1)))... % player2 wins
            && ~isempty(find(iswin2==ele(2)))...
            && ~isempty(find(iswin2==ele(3)))
        iout = 2;
   elseif isempty(find(board ==0))&& iout==0
            iout = 3; % tie
        
    end
end


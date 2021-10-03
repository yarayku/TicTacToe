function [ indx ] = bestmove( boardp, player )
%   function bestmove.m
%   the function examines different possibilities of playing tictactoe. It 
%   was used in findmove.m function to help player(the computer) to make a 
%   best move to win (attack or defense). 
%   It is in order of priority. If the first condition doesn't fit, then
%   the function will go to following statement to check. 
%       input
%           boardp: the original boardp, a vector
%           player: a number(1 or 2)
%       output
%           indx: the position player should move
%   October 24, 2016.
%   Last Modified: October 26, 2016.
%   Written by:Yaray Ku
indx = [];
win = [1 2 3;4 5 6;7 8 9;1 4 7;2 5 8;3 6 9;1 5 9;3 5 7]; % win arrays

% win next move
if player == 1
    victor1 = find(boardp == 1);
    block2 = find(boardp == 2);
    if length(block2) >= 2
        for k = 1:8
            textblock = unique([block2,win(k,:)]);
            count = hist(block2,textblock);
            moveblock = find(count == 0);
            if boardp(textblock(moveblock))==0 & length(textblock(moveblock))==1
                indx = textblock(moveblock);
            end
        end
    end
    if length(victor1) >= 2
        for k = 1:8
            textwin = unique([victor1,win(k,:)]);
            count = hist(victor1,textwin);
            movewin = find(count == 0);
            if boardp(textwin(movewin))==0 & length(textwin(movewin))==1
                indx = textwin(movewin);
            end
        end
    end
end
if player == 2
    victor1 = find(boardp == 2);
    block2 = find(boardp == 1);
    if length(block2) >= 2
        for k = 1:8
            textblock = unique([block2,win(k,:)]);
            count = hist(block2,textblock);
            moveblock = find(count == 0);
            if boardp(textblock(moveblock))==0 & length(textblock(moveblock))==1
                indx = textblock(moveblock);
            end
        end
    end
    if length(victor1) >= 2
        for k = 1:8
            textwin = unique([victor1,win(k,:)]);
            count = hist(victor1,textwin);
            movewin = find(count == 0);
            if boardp(textwin(movewin))==0 & length(textwin(movewin))==1
                indx = textwin(movewin);
            end
        end
    end
end

% defense at round 2
if isempty(indx) % when the last statement doesn't fit
    if player == 1
        if boardp(5) == 2 & boardp(1) ==2 & boardp(9)==1
            if boardp(3) == 0
                indx = [indx,3];
            elseif boardp(7) == 0
                indx = [indx,7];
            end
        end
        if boardp(5) == 2 & boardp(3) ==2 & boardp(7)==1
            if boardp(1) ==0
                indx = [indx,1];
            elseif boardp(9) == 0
                indx = [indx,9];
            end
        end
        if boardp(5) == 2 & boardp(7) ==2 & boardp(3)==1
            if boardp(1) == 0
                indx = [indx,1];
            elseif boardp(9) ==0
                indx = [indx,9];
            end
        end
        if boardp(5) == 2 & boardp(9) ==2 & boardp(1)==1
            if boardp(3)==0
                indx = [indx,3];
            elseif boardp(7) ==0
                indx = [indx,7];
            end
        end
    end
    if player == 2
        if boardp(5) == 1 & boardp(1) ==1 & boardp(9)==2
            if boardp(3) == 0
                indx = [indx,3];
            elseif boardp(7) == 0
                indx = [indx,7];
            end
        end
        if boardp(5) == 1 & boardp(3) ==1 & boardp(7)==2
            if boardp(1) ==0
                indx = [indx,1];
            elseif boardp(9) == 0
                indx = [indx,9];
            end
        end
        if boardp(5) == 1 & boardp(7) ==1 & boardp(3)==2
            if boardp(1) == 0
                indx = [indx,1];
            elseif boardp(9) ==0
                indx = [indx,9];
            end
        end
        if boardp(5) == 1 & boardp(9) ==1 & boardp(1)==2
            if boardp(3)==0
                indx = [indx,3];
            elseif boardp(7) ==0
                indx = [indx,7];
            end
        end
    end
end

% diagonal situation:[1 5;3 5;7 5;9 5];
% attack: when having own places in diagonal -> put move in between
if isempty(indx) % when the last statement doesn't fit
    if player ==1
        block2 = find(boardp == 1); % attack to find boardp = same number
        if ~isempty(find(block2 == 5))
            if ~isempty(find(block2==1))% 1 5
                if boardp(2)==0
                    indx = [indx, 2];
                end
                if boardp(4)==0
                    indx = [indx, 4];
                end
            elseif ~isempty(find(block2==3))% 3 5
                if boardp(2)==0
                    indx = [indx, 2];
                end
                if boardp(6)==0
                    indx = [indx, 6];
                end
            elseif ~isempty(find(block2==7))% 7 5
                if boardp(4)==0
                    indx = [indx, 4];
                end
                if boardp(8)==0
                    indx = [indx, 8];
                end
            elseif ~isempty(find(block2==9))% 9 5
                if boardp(6)==0
                    indx = [indx, 6];
                end
                if boardp(8)==0
                    indx = [indx, 8];
                end
            end
        end
    end
    if player == 2
        block2 = find(boardp == 2);
        if ~isempty(find(block2==5))
            if ~isempty(find(block2==1))% 1 5
                if boardp(2)==0
                    indx = [indx, 2];
                end
                if boardp(4)==0
                    indx = [indx, 4];
                end
            elseif ~isempty(find(block2==3))% 3 5
                if boardp(2)==0
                    indx = [indx, 2];
                end
                if boardp(6)==0
                    indx = [indx, 6];
                end
            elseif ~isempty(find(block2==7))% 7 5
                if boardp(4)==0
                    indx = [indx, 4];
                end
                if boardp(8)==0
                    indx = [indx, 8];
                end
            elseif ~isempty(find(block2==9))% 9 5
                if boardp(6)==0
                    indx = [indx, 6];
                end
                if boardp(8)==0
                    indx = [indx, 8];
                end
            end
        end
    end
end
% diagonal situation
% defense(the opponent has diagonal)
if isempty(indx)
    if player == 1
        block2 = find(boardp == 2); % defende to find boardp = different number
        if ~isempty(find(block2==5))
            if ~isempty(find(block2==1))% 1 5
                if boardp(2)==0
                    indx = [indx, 2];
                end
                if boardp(4)==0
                    indx = [indx, 4];
                end
            elseif ~isempty(find(block2==3))% 3 5
                if boardp(2)==0
                    indx = [indx, 2];
                end
                if boardp(6)==0
                    indx = [indx, 6];
                end
                
            elseif ~isempty(find(block2==7))% 7 5
                if boardp(4)==0
                    indx = [indx, 4];
                end
                if boardp(8)==0
                    indx = [indx, 8];
                end
            elseif ~isempty(find(block2==9))% 9 5
                if boardp(6)==0
                    indx = [indx, 6];
                end
                if boardp(8)==0
                    indx = [indx, 8];
                end
            end
        end
    end
    if player == 2
        block2 = find(boardp == 1);
        if ~isempty(find(block2==5))
            
            if ~isempty(find(block2==1))% 1 5
                if boardp(2)==0
                    indx = [indx, 2];
                end
                if boardp(4)==0
                    indx = [indx, 4];
                end
            elseif ~isempty(find(block2==3))% 3 5
                if boardp(2)==0
                    indx = [indx, 2];
                end
                if boardp(6)==0
                    indx = [indx, 6];
                end
                
            elseif ~isempty(find(block2==7))% 7 5
                if boardp(4)==0
                    indx = [indx, 4];
                end
                if boardp(8)==0
                    indx = [indx, 8];
                end
            elseif ~isempty(find(block2==9))% 9 5
                if boardp(6)==0
                    indx = [indx, 6];
                end
                if boardp(8)==0
                    indx = [indx, 8];
                end
            end
        end
    end
end

% the first move of player
if isempty(indx) % when the last statement doesn't fit
    if boardp(5) == 0
        indx = 5;
    else
        % move at corner
        empty = find(boardp == 0);
        if~isempty(find(empty==1))
            indx = [indx,1];
        end
        if~isempty(find(empty==3))
            indx = [indx,3];
        end
        if~isempty(find(empty==7))
            indx = [indx,7];
        end
        if~isempty(find(empty==9))
            indx = [indx,9];
        end
    end
end

% last move
if isempty(indx)
    indx = find(boardp==0);
end




%   function ttt.m
%   the program plays tictactoe with human players or runs automatically.
%   It uses many functions as below to smoothly run:
%   readmove.m      position_plot.m     newmove.m   findmove.m
%   checkmove.m     checkwinner.m       bestmove.m

%   October 19, 2016.
%   Last Modified: October 26, 2016.
%   Written by:Yaray Ku
close all;
clear
%% create a vitualized board
% initial conditions
boardp = zeros(1,9);
lplay = true; % false when game over
kplay = true; % true if input of mode is invalid
hplay = true; % true if input of term is invalid
pplay = true; % true if input of pattern is invalid
n = 0;
% set up the figure
figure
line([0 3],[1 1])
line([0 3],[2 2])
line([1 1],[0 3])
line([2 2],[0 3])
axis off
hold on


%% loop over findmove function until win or draw is reached

while kplay
    mode = input(['Enter ''Auto'' for computer playing;'...
        '''VS'' for playing aginast computer: '],'s');
    switch lower(mode)
        case 'auto'
            while lplay
                player = mod(n+1,2);
                if player == 0
                    player = 2;
                end
                if mod(n,2) ==1
                    pat = 'x';
                else
                    pat = 'o';
                end
                board = findmove(boardp,player);
                [ipos,player] = newmove(board,boardp);
                [x,y] = position_plot(ipos);
                plot(x,y,pat,'markersize',30)
                pause(0.8)
                iout = checkwinner(board);
                boardp = board;
                if iout ~= 0
                    lplay = false;
                    kplay = false;
                else
                    n = n + 1; % not increaisng n if game over
                end
            end
            
        case 'vs'
            while hplay
                term = input(['Enter 1 to go first as player 1,'...
                    'enter 2 go later as player 2: '],'s');
                if str2num(term) == 1 | str2num(term) == 2
                    hplay = false;       
                else
                    disp('invalid input.')
                end
            end
            while pplay
                pattern = input('choose''x'' or ''o'': ','s');
                switch pattern
                    case 'x'
                        pplay = false;
                    case 'o'
                        pplay = false;
                    otherwise
                        disp('Not recognizable')
                end
            end
            while lplay
                player = mod(n+1,2); % the first should be player1
                if player == 0
                    player = 2;
                end
                if mod(term,2) == 1
                    board = readmove(boardp,player);
                    pat = pattern;
                else
                    board = findmove(boardp,player);
                    switch pattern
                        case 'o'
                            pat = 'x';
                        case 'x'
                            pat = 'o';
                    end
                end
                [ipos,player] = newmove(board,boardp);
                [x,y] = position_plot(ipos);
                plot(x,y,pat,'markersize',30)
                pause(0.5)
                iout = checkwinner(board);
                boardp = board;
                if iout ~= 0
                    lplay = false;
                    kplay = false;
                else
                    n = n + 1; % not increaisng n if game over
                    term = term + 1; % switch terms between computer and human
                end
            end
        otherwise
            disp('Invalid Input.')
    end
end
% display the redult
if iout == 1
    title('player 1 wins','Fontsize',16)
elseif iout == 2
    title ('player 2 wins','Fontsize',16)
elseif iout ==3
    title('Draw','Fontsize',16)
end

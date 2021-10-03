function [x y] = position_plot(ipos)
%   function position_plot.m
%   the function transforms the vector to coordinate position in the output
%   figure in ttt.m file 
%       input
%           ipos: the position on board(from 1-9)
%       output 
%           [x y] = the numbers of coordinate position
%   October 19, 2016.
%   Last Modified: October 26, 2016.
%   Written by:Yaray Ku
% 
% 1 2 3
% 4 5 6
% 7 8 9
if ipos == 1
    x = 0.5;
    y = 2.5;
elseif ipos == 2
    x = 1.5;
    y = 2.5;
elseif ipos == 3
    x = 2.5;
    y = 2.5;
elseif ipos == 4
    x = 0.5;
    y = 1.5;
elseif ipos == 5
    x = 1.5;
    y = 1.5;
elseif ipos == 6
    x = 2.5;
    y = 1.5;
elseif ipos == 7
    x = 0.5;
    y = 0.5;
elseif ipos == 8
    x = 1.5;
    y = 0.5;
elseif ipos == 9
    x = 2.5;
    y = 0.5;
end    
    


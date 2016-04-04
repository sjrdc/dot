%% set some figure properties

ones(10)*ones(10)

% figure colour to white
set(0, 'DefaultFigureColor', 'w')
% thicker axes
set(0, 'DefaultAxesLineWidth', 2)
% larger font on axes
set(0, 'DefaultAxesFontSize', 12)
% thicker plot lines
set(0, 'DefaultLineLineWidth', 2)

%% image processing toolbox preferences
iptsetpref('ImshowInitialMagnification', 'fit')

%% add the path where I keep my personal matlab toolbox
% addpath(genpath('~/development/matlab'));
% addpath(genpath('~/development/labmat'));

addpath(genpath('~/development/matbox'));
rmpath(genpath('~/development/matbox/.git'));

%% go to my matlab working directory
cd ~/matlab/

%% Load Stick Analysis
% Attempt #2
% Created by Kirk Boyd - April 12, 2021
% Last Modified  by Kirk Boyd - April 12, 2021
clc;
clear;
close all;

% Indices for each column of data
%loadCell = 1;%
%xo = 2; %x orientation [euler angle]
%yo = 3; %y orientation [euler angle]
%zo = 4;%z orientation [euler angle]
%xrot = 5;%x rotation
%yrot = 6;%y rotation
%zrot = 7;%z rotation
%xlin = 8;%x linear
%ylin = 9;%y linear
%zlin = 10;%z linear
%xmag = 11;%x magnetometer
%ymag = 12;%y magnetometer
%zmag = 13;%z magnetometer
%xa1 = 14;%x acceleration 1
%ya1 = 15;%y acceleration 1
%za1 = 16;%z acceleration 1
%xa2 = %x acceleration 2
%ya2 = %y acceleration 2
%za2 = %z acceleration 2
fileA = '2a_reformat.txt';
fileB = '2b_reformat.txt';
fileD = '2d_reformat.txt';
fileCal = '2cal_reformat.txt';
delimiterIn = ' ';
headerlinesIn = 1;

A = importdata(fileA,delimiterIn,headerlinesIn);
B = importdata(fileB,delimiterIn,headerlinesIn);
D = importdata(fileD,delimiterIn,headerlinesIn);
Cal = importdata(fileCal,delimiterIn,headerlinesIn);

%% Trim Useless Data
B.data = B.data(225:1700,:);
D.data = D.data(250:448,:);
%% Plot Results
comboPlot(1,Cal,A,B,D,'Load Cell Reading [g]');

figure;
subplot(2,1,1);
plot(B.data(1:500,1));
xlabel('Index of Sample','Interpreter','latex');
ylabel('Load Cell Reading [g]','Interpreter','latex');
title('Wings On, Run "B1" - Load Cell - Low Flap Rate','Interpreter','latex');

subplot(2,1,2);
plot(B.data(1074:1450,1));
xlabel('Index of Sample','Interpreter','latex');
ylabel('Load Cell Reading [g]','Interpreter','latex');
title('Wings On, Run "B2" - Load Cell - Higher Flap Rate to Failure ','Interpreter','latex');

function comboPlot(colnum,dat0,dat1,dat2,dat3,ylbl)
    figure;
    subplot(4,1,1);
    plot(dat0.data(:,colnum));
    xlabel('Index of Sample','Interpreter','latex');
    ylabel(ylbl,'Interpreter','latex');
    title('Calibration','Interpreter','latex');
    
    subplot(4,1,2);
    plot(dat1.data(:,colnum));
    xlabel('Index of Sample','Interpreter','latex');
    ylabel(ylbl,'Interpreter','latex');
    title('Calibration','Interpreter','latex');
    
    subplot(4,1,3);
    plot(dat2.data(:,colnum));
    xlabel('Index of Sample','Interpreter','latex');
    ylabel(ylbl,'Interpreter','latex');
    title('Wings on Run 1','Interpreter','latex');
    
    subplot(4,1,4);
    plot(dat3.data(:,colnum));
    xlabel('Index of Sample','Interpreter','latex');
    ylabel(ylbl,'Interpreter','latex');
    title('Calibration','Interpreter','latex');
    title('Wings On Run 2');
    
end
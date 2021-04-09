clc;
clear;
close all;

% Constants
rho = 1.2; %density of air (kg/m^3) 
c_D = 1.1; %drag coefficient of a flat plate

% Experimental Parameters
thetaDot = 5; %m/s; rotational speed of wings; we tried a random guess here first
M = .45; %kg
w1 = .215; %meters; width of a flat plate which would represent projected area of wing on DOWNstroke; very rough guess;  
w2 = .12; %meters; width of a flat plate which would represent projected area of wing on UPstroke; very rough guess;
l = .545; %m; length of same flat plate

% Extra Properties
W = m*9.81 %Newtons

Fd = zeros(2,2); %matrix for drag force, column 1 is DOWNstroke, column 2 is UPstroke
Fddown = (1/6)*(rho*c_D*(thetaDot^2)*(l^3)*w1); %N; drag force on wing in DOWNstroke
Fdup = (1/6)*(rho*c_D*(thetaDot^2)*(l^3)*w2); %N; drag force on wing in UPstroke
TotalFdup = Fdup*2 %N; total drag force on BOTH wings in UPstroke;
TotalFddown = Fddown*2 %N; total drag force on BOTH wings in DOWNstroke;
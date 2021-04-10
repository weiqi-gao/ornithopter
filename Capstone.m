clc;
clear;
close all;

% Constants
rho = 1.2; %density of air (kg/m^3) 
c_D = 1.1; %drag coefficient of a flat plate

% Experimental Parameters
thetaDot = 5; %m/s; rotational speed of wings; we tried a random guess here first
M = .45; %kg
wDown = .215; %meters; width of a flat plate which would represent projected area of wing on DOWNstroke; very rough guess;  
wUp = .12; %meters; width of a flat plate which would represent projected area of wing on UPstroke; very rough guess;
l = .545; %m; length of same flat plate

% Extra Properties
W = m*9.81 %Newtons

% Weight Impulse


% Drag forces
Fd = zeros(2,1); %matrix for drag force on a single wing, 1 is DOWNstroke, 2 is UPstroke
Fd(1) = (1/6)*(c_D*rho_(thetaDot^2)*(l^3)*wDown); %N; drag force on wing in DOWNstroke
Fd(2) = (1/6)*(c_D*rho*(thetaDot^2)*(l^3)*wUp); %N; drag force on wing in UPstroke
Fd_tot = zeros(2,1); %drag force on combined wings; 1 is DOWNstroke, 2 is UPstroke
Fd_tot(1) = Fd(1)*2; %N; total DOWNstroke;
Fd_tot(2) = Fd(2)*2; %N; total UPstroke;
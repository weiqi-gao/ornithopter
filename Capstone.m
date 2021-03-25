clc;
clear all;
mTot = .45; %kg
W_Tot = mTot*9.81 %Newtons
rho = 1.2; %density of air (kg/m^3) 
c_D = 1.1; %drag coefficient of a flat plate
thetaDot = 5; %m/s; rotational speed of wings; we tried a random guess here first 
w1 = .215; %meters; width of a flat plate which would represent projected area of wing on DOWNstroke; very rough guess;  
w2 = .12; %meters; width of a flat plate which would represent projected area of wing on UPstroke; very rough guess;
l = .545; %m; length of same flat plate 
Fddown = (1/6)*(rho*c_D*(thetaDot^2)*(l^3)*w1); %N; drag force on wing in DOWNstroke
Fdup = (1/6)*(rho*c_D*(thetaDot^2)*(l^3)*w2); %N; drag force on wing in UPstroke
TotalFdup = Fdup*2 %N; total drag force on BOTH wings in UPstroke;
TotalFddown = Fddown*2 %N; total drag force on BOTH wings in DOWNstroke;

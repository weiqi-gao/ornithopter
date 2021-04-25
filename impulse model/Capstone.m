%% Stroke Impulse Calculation
% Created by Nathan Dancy & Kirk Boyd - March 2021
% Last Modified by: Kirk Boyd - April 10, 2021
%

clc; % clear command line
clear; % clear workspace so new values are always calculated; prevents carrying over old values if changes are made
close all; % close all figures so we don't end up with tons of figures after running it several times in a row

%% Experimental Parameters 
% Mass Properties %
    M = .15; %[kg]; mass of the whole ornithopter

% Geometry %
    wDown = 0.35; %[m]; width of a flat plate which would represent projected area of wing on DOWNstroke; very rough guess;  
    wUp = 0.21; %[m]; width of a flat plate which would represent projected area of wing on UPstroke; very rough guess;
    l = 0.45; %[m]; length of same flat plate

% Timing %
    deltaT = 0.0001; %[s]; how many subdivisions through time are needed to get a good amount of granularity of the model
    numPoints = 100000; %[unitless]; extra value if preallocated arrays are needed. e.g. what number of points do we know we will not exceed
    flapRate = 7; %[hz]; how many flaps per second the bird is making
    
    thetaMax = pi()/4; %[radians]; minimum/maximum (depending on how you look at it) angle of wing at top of flat
    thetaMin = -thetaMax; %[radians]; minimum/maximum (depending on how you look at it) angle of wing at the bottom of flap
    omega = flapRate;%*(2*(thetaMax-thetaMin)); %[rad/s]=[hz]; angular velocity; twice the total travel of the wings (one full flap down and back) times #flaps per second
    
%% Setup Before Evaluating
% Constants %
    rho = 1.2; %[kg/m^3]; density of air 
    Cd = 1.1; %[unitless]; drag coefficient of a flat plate
% Timing %
    tStar = 10*(1/flapRate); %[s]; if wing is flapping at 5 hz it would take this many seconds for one half of the flap
    t = zeros(numPoints,1); %[s]; preallocate array to store time values

% Weight Impulse %
    W = M*9.81; %[N]; weight of ornithopter due to gravity at Earth's surface
    J_W = zeros(numPoints,1); % impulse due to weight over time; preallocating array
    J_W_tot =  W*tStar; % total impulse due to weight for the time interval t*

% Angles %
    theta = zeros(numPoints,1); %[rad]; angle of wings at a given 't'
    thetaDot = zeros(numPoints,1); %[rad/s]=[hz]; rotational speed of wings; we tried a random guess here first
    J_flap = zeros(numPoints,1); %[N*s]; impulse due to flapping over time; preallocating array
    Fd = zeros(numPoints,2); %[N]; drag force magnitude at given point in time; preallocating array

% Initial Conditions %
    t(1) = 0; %start at time zero
    %theta(1) = cos(2*pi()*omega*t(1)); %assume the flaps begin with wings all the way up (FOR NOW) so if my amplitude scaling makes sense this should be equal to thetaMax
    theta(1) = thetaMax*cos(2*pi()*omega*t(1)); %assume the flaps begin with wings all the way up (FOR NOW) so if my amplitude scaling makes sense this should be equal to thetaMax
    thetaDot(1) = thetaMax*(-2)*pi()*omega*sin(2*pi()*omega*t(1));
    Fd(1,1) = (1/6)*Cd*rho*wDown*(l^3)*(cos(theta(1))^3)*thetaDot(1);
    Fd(1,2) = Fd(1,1)*2;
    
    %% Numerical Evaluation
    for i=2:numPoints
        t(i) = t(i-1) + deltaT; %step forward in time by one time interval (deltaT)
        theta(i) = thetaMax*cos(2*pi()*omega*t(i)); %calculate theta at this new time
        thetaDot(i) = thetaMax*(-2)*pi()*omega*sin(2*pi()*omega*t(i)); %calculate thetaDot at this new time
        if thetaDot(i)<0 %when thetaDot is negative, we are in DOWNstroke, so use wDown
            Fd(i,1) = -(1/6)*Cd*rho*wDown*(l^3)*(cos(theta(i))^3)*thetaDot(i); %calculate force vector of DOWNstroke at this time
        else %otherwise, thetaDot is positive, thus it is an UPstroke, so use wUp
            Fd(i,1) = -(1/6)*Cd*rho*wUp*(l^3)*(cos(theta(i))^3)*thetaDot(i); %calculate force vector of UPstroke at this time
        end %if/else
        Fd(i,2) = Fd(i,1)*2; %calculate force generated by both wings
        J_flap(i) = trapz(t(1:i),Fd(1:i,2)); %store value of impulse so far
        J_W(i) = W*t(i); %store value of impulse due to gravity so far
        if t(i) >= tStar %check if the desired time t* was reached
            i_f = i; %store the final index value in case we want to shorten the arrays
            t_f = t(i); %[s] store the final time so we can verify that we reached tStar before exiting
            break % exit loop if we hit t*
        end %if t(i)
    end %for
    
    %% Crop the Preallocated arrays at the last index
    t = t(1:i_f);
    theta = theta(1:i_f);
    thetaDot = thetaDot(1:i_f);
    Fd = Fd(1:i_f,:);
    J_flap = J_flap(1:i_f);
    J_W = J_W(1:i_f);

%% Plot Results
subplot(3,1,1);    
plot(t,theta);
xlabel('Time t [s]','Interpreter','latex');
ylabel('$\theta(t)$ [rad]','Interpreter','latex');
title('$\theta$ as a Function of Time','Interpreter','latex');
subplot(3,1,2);
plot(t,thetaDot);
xlabel('Time t [s]','Interpreter','latex');
ylabel('$\dot{\theta}(t)$','Interpreter','latex');
title('$\dot{\theta}$ as a Function of Time','Interpreter','latex');
subplot(3,1,3);
plot(t,Fd(:,2));
xlabel('Time t [s]','Interpreter','latex');
ylabel('$F_{D}(t)$ [N]','Interpreter','latex');
title('Total (Both Wings) $F_{D}(t)$ as a Function of Time','Interpreter','latex');

%% Numerically Integrate
J_flap_tot = trapz(t,Fd(:,2)); %total integral
figure;
plot(t,J_W,t,J_flap);
title('Impulse as a Function of Time','Interpreter','latex');
xlabel('Time t [s]','Interpreter','latex');
ylabel('Impulse J [N*s]','Interpreter','latex');
legend('Impulse due to Gravity [$J_{W}$]','Impulse due to Flapping [$J_{Flap}$]','Interpreter','latex');
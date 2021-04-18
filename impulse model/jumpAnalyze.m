%% Jump Impulse Analysis
% Created by Nathan Dancy & Kirk Boyd - April 11, 2021
% Last Modified by: Kirk Boyd - April 11, 2021
%

clc; % clear command line
clear; % clear workspace so new values are always calculated; prevents carrying over old values if changes are made
close all; % close all figures so we don't end up with tons of figures after running it several times in a row

A = importJumpData('firstJumpData.csv', 3, 131);

t = A(:,1)';
y = A(:,2)';
x = A(:,3)';
%y = y*0.0254;
%x = x*0.0254;
fitx = fitJumpData(t,x);
fity = fitJumpData(t,y);
coeffsx = coeffvalues(fitx);
coeffsy = coeffvalues(fity);
vx = differentiate(fitx,t);
vy = differentiate(fity,t);

%% Plot Results
subplot(2,2,2);
plot(t,y);
hold on;
plot(fity);
xlabel('Time t [s]','Interpreter','latex');
ylabel('Y-Position [m]','Interpreter','latex');
title('Vertical Position as a Function of Time in Jumping','Interpreter','latex');
legend('Raw Data','Curve Fit','Interpreter','latex');
subplot(2,2,1);
plot(t,x);
hold on;
plot(fity);
xlabel('Time t [s]','Interpreter','latex');
ylabel('X-Position [m]','Interpreter','latex');
title('Vertical Position as a Function of Time in Jumping','Interpreter','latex');
legend('Raw Data','Curve Fit','Interpreter','latex');
subplot(2,2,3);
plot(t,vx);
xlabel('Time t [s]','Interpreter','latex');
ylabel('Velocity vx [m/s]','Interpreter','latex');
title('Velocity in Horizontal Direction as a Function of Time in Jumping','Interpreter','latex');
vx = vx';
ax = polyfit(t,vx,1);
s1='v(t) =  ';
coeff1x = num2str(ax(1));
s2='t + ';
coeff2x = num2str(ax(2));
stringx = strcat(s1,coeff1x,s2,coeff2x);
legend(stringx,'Interpreter','latex');
subplot(2,2,4);
plot(t,vy);
xlabel('Time t [s]','Interpreter','latex');
ylabel('Velocity vy [m/s]','Interpreter','latex');
title('Velocity in Vertical Direction as a Function of Time in Jumping','Interpreter','latex');
vy = vy';
ay = polyfit(t,vy,1);

coeff1y = num2str(ay(1));

coeff2y = num2str(ay(2));
stringy = strcat(s1,coeff1y,s2,coeff2y);
legend(stringy,'Interpreter','latex');
%% Jump Impulse Analysis
% Created by Nathan Dancy & Kirk Boyd - April 11, 2021
% Last Modified by: Kirk Boyd - April 11, 2021
%

clc; % clear command line
clear; % clear workspace so new values are always calculated; prevents carrying over old values if changes are made
close all; % close all figures so we don't end up with tons of figures after running it several times in a row

A = importJumpData('firstJumpData.csv', 2, 131);

t = A(:,1)';
y = A(:,2)';
fit = fitJumpData(t,y);
coeffs = coeffvalues(fit);
v = differentiate(fit,t);

%% Plot Results
subplot(2,1,1);
plot(t,y);
hold on;
plot(fit);
xlabel('Time t [s]','Interpreter','latex');
ylabel('Y-Position [in]','Interpreter','latex');
title('Vertical Position as a Function of Time in Jumping','Interpreter','latex');
legend('Raw Data','Curve Fit','Interpreter','latex');
subplot(2,1,2);
plot(t,v);
xlabel('Time t [s]','Interpreter','latex');
ylabel('Velocity v [in/s]','Interpreter','latex');
title('Velocity in Vertical Direction as a Function of Time in Jumping','Interpreter','latex');
v = v';
a = polyfit(t,v,1);
s1='v(t) =  ';
coeff1 = num2str(a(1));
s2='t + ';
coeff2 = num2str(a(2));
string = strcat(s1,coeff1,s2,coeff2);
legend(string,'Interpreter','latex');
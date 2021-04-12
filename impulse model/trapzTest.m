clc;
clear;
close all;

a = zeros(30,2);

for i=1:30
    a(i,1) = i;
    a(i,2) = i^2;
end

x = a(:,1);
y = a(:,2);
plot(a(:,1),a(:,2));
Q = trapz(x,y);
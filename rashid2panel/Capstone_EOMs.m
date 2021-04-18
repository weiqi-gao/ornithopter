%% Capstone
% Editted by Weiqi and Kirk
% 4/15/2021

% Statements: 
% Notes 1: I may explain all symbols with subscripts. If I missed
% someone,please read LIST OF SYMBOLS (just under the menu);

% Note 2: From page 15 to page 17, they listed some velocity and
% acceleration equations about each wing. 
% I only typed velocity of each wing = velocity of body + other terms. 
% I am not sure it is necessary or not. 
% If necessary, just ask me to fill up all acceleration equations for each wing.
% If not, just asko me to delete all velocity equations about wings. 
%% initial
clc;
clear;
close all;

%% Body
syms X_aero_b theta_b phi R_x_b1 R_x_b2 dotU_b Q_b W_b R_b V_b g m_b;
% x-direction Force
X_aero_b; % total aerodynamic force in x direction of body

m_b; % input("Enter the mass of body: "); % mass of body
g;
%g=9.81; % gravity
theta_b; % pitch angle of body
phi; % Roll angle 
R_x_b1; % yaw angular velocity of x direction with left
R_x_b2; % yaw angular velocity of x direction with right
dotU_b; % surging acceleration of body
Q_b; % pitch angular velocity of body
W_b; % plunging velocity of body
R_b;  % yaw angular velocity of body
V_b; % sideslip velocity of body

% y-direction Force
syms Y_aero_b R_y_b1 R_y_b2 dotV_b U_b P_b;

Y_aero_b; % total aerodynamic force in y direction of body
R_y_b1; % yaw angular velocity of y direction b1??
R_y_b2; % yaw angular velocity of y direction b2??
dotV_b; % sideslip acceleration of body
U_b; % surging velocity of body
P_b; % roll angular velocity 

% z-direction Force
syms Z_aero_b R_z_b1 R_z_b2 dotW_b;

Z_aero_b; % total aerodynamic force in z direction of body
R_z_b1; % yaw angular velocity of z direction b1??
R_z_b2; % yaw angular velocity of z direction b2??
dotW_b; % plunging acceleration of body

% x-direction moments
syms L_aero_b M_L_b1 M_L_b2 dotP_b dotR_b R_b; 
syms d_z_b1 d_z_b2 d_y_b1 d_y_b2 I_xx_b I_xz_b I_zz_b I_yy_b dotP_b dotR_b R_b; 
syms d_x_b1 d_x_b2;

L_aero_b; % total aerodynamic moment in x direction of body

d_z_b1; %input("Enter z distance from body to left wing: "); % z distance from body cg. to point on root of wing aligned with wing cg of 1??
d_z_b2; %input("Enter z distance from body to right wing: "); % z distance from body cg. to point on root of wing aligned with wing cg of 2??
d_y_b1; %input("Enter y distance from body to left wing: "); % y distance from body cg. to point on root of wing aligned with wing cg of 1??
d_y_b2; %input("Enter y distance from body to right wing: "); % y distance from body cg. to point on root of wing aligned with wing cg of 2??

M_L_b1; % x direction reaction moment between the wing and body of left side
M_L_b2; % x direction reaction moment between the wing and body of right side

% Can be calculated
I_xx_b; % moment of inertia of xx of body (Page128)
I_xz_b; % moment of inertia of xz of body (Page128)
I_zz_b; % moment of inertia of zz of body (Page128)
I_yy_b; % moment of inertia of yy of body (Page128)
dotP_b; % roll angular acceleration of body
dotR_b; % yaw angular acceleration of body
R_b; % yaw angular velocity of body

% y-direction moments
syms M_aero_b M_M_b1 M_M_b2 dotQ_b;

M_aero_b; % total aerodynamic moment in y direction of body

d_x_b1; %input("Enter x distance from body to left wing: "); % x distance from body cg. to point on root of wing aligned with wing cg of 1??
d_x_b2; %input("Enter x distance from body to right wing: "); % x distance from body cg. to point on root of wing aligned with wing cg of 2??

M_M_b1; % y direction reaction moment between the wing and body of 1??
M_M_b2; % y direction reaction moment between the wing and body of 2??
% Can be calculated
dotQ_b; % pitch angular acceleration of body

% z-direction moments
syms N_aero_b M_N_b1 M_N_b2;

N_aero_b; % total aerodynamic moment in z direction of body
M_N_b1; % Z direction reaction moment between the wing and body of 1??
M_N_b2; % Z direction reaction moment between the wing and body of 2??

%% Port(left) wing

% x-direction Force
syms X_aero_w1 theta_w1 R_x_w1 dotU_w1 Q_w1 W_w1 R_w1 V_w1;
% y-direction Force
syms Y_aero_w1 R_y_w1 dotV_w1 U_w1 P_w1;
% z-direction Force
syms Z_aero_w1 R_z_w1 dotW_w1;
% x-direction moments
syms L_aero_w1 M_L_w1 dotP_w1 dotR_w1;
% y-direction moments
syms M_aero_w1 M_M_w1 dotQ_w1 dotI_yy_w1 dotI_yz_w1;
% z-direction moments
syms N_aero_w1 M_N_w1 dotI_zz_w1;

X_aero_w1; % total aerodynamic force in x direction of left wing
syms m_w1 D_z_w1 D_y_w1 D_x_w1;
m_w1; %input("Enter the mass of left wing: ");  % mass of left wing
D_z_w1; %input("Enter z distance from root to cg of left wing: "); % z distance from root of wing to cg of wing panel of left wing
D_y_w1; %input("Enter y distance from root to cg of left wing: "); % y distance from root of wing to cg of wing panel of left wing
D_x_w1; %input("Enter x distance from root to cg of left wing: "); % x distance from body cg. to point on root of wing aligned with wing cg of left wing

theta_w1=theta_b; % pitch angle of left wing
R_x_w1=-R_x_b1; % yaw angular velocity of x direction of left wing b1??
dotU_w1; % surging acceleration of left wing
Q_w1=Q_b; % pitch angular velocity of left wing
W_w1=W_b+P_b*d_y_b1-P_b*D_y_w1+Q_b*(D_x_w1-d_x_b1)+P_w1*D_y_w1; % plunging velocity of left wing
R_w1=R_b; % yaw angular velocity of left wing
V_w1=V_b+P_b*(D_z_w1-d_z_b1)+R_b*(d_x_b1-D_x_w1)+P_w1*D_z_w1; % sideslip velocity of left wing

% % y-direction Force %MOVED UP
% syms Y_aero_w1 R_y_w1 dotV_w1 U_w1 P_w1;

Y_aero_w1; % total aerodynamic force in y direction of left wing
R_y_w1=-R_y_b1; % yaw angular velocity of y direction of left wing b1??
dotV_w1; % sideslip acceleration of left wing
U_w1=U_b+Q_b*(d_z_b1-D_z_w1)+R_b*(D_y_w1-d_y_b1); % surging velocity of left wing
P_w1; % roll angular velocity of left wing

% % z-direction Force %MOVED UP
% syms Z_aero_w1 R_z_w1 dotW_w1;

Z_aero_w1; % total aerodynamic force in z direction of left wing
R_z_w1=-R_z_b1; % yaw angular velocity of z direction of left wing 
dotW_w1; % plunging acceleration of left wing

% % x-direction moments %MOVED UP
% syms L_aero_w1 M_L_w1 dotP_w1 dotR_w1;

L_aero_w1; % total aerodynamic moment in x direction of left wing



M_L_w1=-M_L_b1; % x direction reaction moment between the wing and body of left wing

syms I_xx_w1 I_yz_w1 I_zz_w1 I_yy_w1;
I_xx_w1; % moment of inertia of xx of left wing (Page128)
I_yz_w1; % moment of inertia of yz of left wing (Page128)
I_zz_w1; % moment of inertia of zz ofleft wing (Page128)
I_yy_w1; % moment of inertia of yy of left wing (Page128)

dotP_w1; % roll angular acceleration of left wing
dotR_w1; % yaw angular acceleration of left wing

% % y-direction moments %MOVED UP
% syms M_aero_w1 M_M_w1 dotQ_w1 dotI_yy_w1 dotI_yz_w1;

M_aero_w1; % total aerodynamic moment in y direction of left wing

M_M_w1=-M_M_b1; % y direction reaction moment between the wing and body of left wing
dotQ_w1; % pitch angular acceleration of left wing
dotI_yy_w1; % derivatives of moment of inertia of yy of left wing
dotI_yz_w1; % derivatives of moment of inertia of yz of left wing

% % z-direction moments %MOVED UP
% syms N_aero_w1 M_N_w1 dotI_zz_w1;

N_aero_w1; % total aerodynamic moment in z direction of left wing
M_N_w1=-M_N_b1; % Z direction reaction moment between the wing and body of left wing
dotI_zz_w1; % derivatives of moment of inertia of zz of left wing

%% Starboard(right) wing

% x-direction Force
syms X_aero_w2 theta_w2 R_x_w2 dotU_w2 Q_w2 W_w2 R_w2 V_w2 D_x_w2 D_y_w2;
% y-direction Force
syms Y_aero_w2 R_y_w2 dotV_w2 U_w2 P_w2;
% z-direction Force
syms Z_aero_w2 R_z_w2 dotW_w2;
% x-direction moments 
syms L_aero_w2 M_L_w2 dotP_w2 dotR_w2;
% y-direction moments
syms M_aero_w2 M_M_w2 dotQ_w2 dotI_yy_w2 dotI_yz_w2;
% z-direction moments
syms N_aero_w2 M_N_w2 dotI_zz_w2;

X_aero_w2; % total aerodynamic force in x direction of right wing

syms m_w2 D_z_w2 D_y_b2;
m_w2; %input("Enter the mass of right wing: ");  % mass of rightt wing
D_z_w2; %input("Enter z distance from root to cg of right wing: "); % z distance from root of wing to cg of wing panel of right wing
D_y_b2; %input("Enter y distance from root to cg of right wing: "); % y distance from root of wing to cg of wing panel of right wing

theta_w2=theta_b; % pitch angle of right wing
R_x_w2=-R_x_b2; % yaw angular velocity of x direction of right wing
dotU_w2; % surging acceleration of right wing
Q_w2=Q_b; % pitch angular velocity of right wing
W_w2=W_b+P_b*d_y_b2-P_b*D_y_w2+Q_b*(D_x_w2-d_x_b2)+P_w2*D_y_w2; % plunging velocity of right wing
R_w2=R_b; % yaw angular velocity of right wing
V_w2=V_b+P_b*(D_z_w2-d_z_b2)+R_b*(d_x_b2-D_x_w2)+P_w2*D_z_w2; % sideslip velocity of right wing

% % y-direction Force %MOVED UP
% syms Y_aero_w2 R_y_w2 dotV_w2 U_w2 P_w2;

Y_aero_w2; % total aerodynamic force in y direction of right wing
R_y_w2=-R_y_b2; % yaw angular velocity of y direction of right wing
dotV_w2; % sideslip acceleration of right wing
U_w2=U_b+Q_b*(d_z_b2-D_z_w2)+R_b*(D_y_w2-d_y_b2); % surging velocity of right wing
P_w2; % roll angular velocity of rightt wing

% % z-direction Force %MOVED UP
% syms Z_aero_w2 R_z_w2 dotW_w2;

Z_aero_w2; % total aerodynamic force in z direction of right wing
R_z_w2=-R_z_b2; % yaw angular velocity of z direction of left wing
dotW_w2; % plunging acceleration of right

% % x-direction moments %MOVED UP
% syms L_aero_w2 M_L_w2 dotP_w2 dotR_w2;

L_aero_w2; % total aerodynamic moment in x direction of right wing



M_L_w2=-M_L_b2; % x direction reaction moment between the wing and body of right wing

syms I_xx_w2 I_yz_w2 I_zz_w2 I_yy_w2;
I_xx_w2; % moment of inertia of xx of right wing
I_yz_w2; % moment of inertia of yz of right wing
I_zz_w2; % moment of inertia of zz of right wing
I_yy_w2; % moment of inertia of yy of right wing

dotP_w2; % roll angular acceleration of right wing
dotR_w2; % yaw angular acceleration of right wing

% % y-direction moments %MOVED UP
% syms M_aero_w2 M_M_w2 dotQ_w2 dotI_yy_w2 dotI_yz_w2;

M_aero_w2; % total aerodynamic moment in y direction of right wing

D_x_w2;%input("Enter x distance from root to cg of right wing: "); % x distance from body cg. to point on root of wing aligned with wing cg of right wing

M_M_w2=-M_M_b2; % y direction reaction moment between the wing and body of right wing
dotQ_w2; % pitch angular acceleration of right wing
dotI_yy_w2; % derivatives of moment of inertia of yy of right wing
dotI_yz_w2; % derivatives of moment of inertia of yz of right wing

% % z-direction moments %MOVED UP
% syms N_aero_w2 M_N_w2 dotI_zz_w2;

N_aero_w2; % total aerodynamic moment in z direction of right wing
M_N_w2=-M_N_b2; % Z direction reaction moment between the wing and body of right wing
dotI_zz_w2; % derivatives of moment of inertia of zz of right wing

%% Solving

%% Variables
x=[dotU_b; dotV_b; dotW_b; dotP_b; dotQ_b; dotR_b; R_x_b1; R_y_b1; R_z_b1; M_L_b1; M_M_b1;M_N_b1; R_x_b2; R_y_b2; R_z_b2; M_L_b2; M_M_b2; M_N_b2];

%% Matrix A
% Body Part Unknowns
xf_b=[m_b,  0,  0,  0,  0,  0,  -1,  0,  0,  0,  0,  0,  -1,  0,  0,  0,  0,  0];
yf_b=[0,  m_b,  0,  0,  0,  0,  0,  -1,  0,  0,  0,  0,  0,  -1,  0,  0,  0,  0]; 
zf_b=[0,  0,  m_b,  0,  0,  0,  0,  0,  -1,  0,  0,  0,  0,  0,  -1,  0,  0,  0];
xm_b=[0, 0, 0, I_xx_b, 0, -I_xz_b, 0, d_z_b1, -d_y_b1, -1, 0, 0, 0, d_z_b2, -d_y_b2, -1, 0, 0];  
ym_b=[0, 0, 0, 0, I_yy_b, 0,  -d_z_b1, 0, d_x_b1, 0, -1, 0, -d_z_b2, 0, d_x_b2, 0, -1, 0];  
zm_b=[0, 0, 0, -I_xz_b, 0, I_zz_b, d_y_b1, -d_x_b1, 0, 0, 0, -1, d_y_b2, -d_x_b2, 0, 0, 0, -1];  

% left wing Part Unknowns
xf_w1=[m_w1,  0,  0,  0,  m_w1*(d_z_b1-D_z_w1),  m_w1*(D_y_w1-d_y_b1),  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0];
yf_w1=[0,  m_w1,  0,  m_w1*(D_z_w1-d_z_b1),  0,  m_w1*(d_x_b1-D_x_w1),  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0];
zf_w1=[0,  0,  m_w1,  m_w1*(d_y_b1-D_y_w1),  m_w1*(D_x_w1-d_x_b1),  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0, 0];
xm_w1=[0, 0, 0, I_xx_w1, 0, 0, 0, -D_z_w1, D_y_w1, 1, 0, 0, 0, 0, 0, 0, 0, 0];  
ym_w1=[0, 0, 0, 0, I_yy_w1, -I_yz_w1, D_z_w1, 0, -D_x_w1, 0, 1, 0, 0, 0, 0, 0, 0, 0];  
zm_w1=[0, 0, 0, 0, -I_yz_w1, I_zz_w1, -D_y_w1, D_x_w1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0];  

% Right wing Part Unknowns
xf_w2=[m_w2,  0,  0,  0,  m_w2*(d_z_b2-D_z_w2),  m_w2*(D_y_w2-d_y_b2),  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0];
yf_w2=[0,  m_w2,  0,  m_w2*(D_z_w2-d_z_b2),  0,  m_w2*(d_x_b2-D_x_w2),  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 0];
zf_w2=[0,  0,  m_w2,  m_w2*(d_y_b2-D_y_w2),  m_w2*(D_x_w2-d_x_b2),  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0, 0];
xm_w2=[0, 0, 0, I_xx_w2, 0, 0, 0, 0, 0, 0, 0, 0, 0, -D_z_w2, D_y_w2, 1, 0, 0];  
ym_w2=[0, 0, 0, 0, I_yy_w2, -I_yz_w2, 0, 0, 0, 0, 0, 0, D_z_w2, 0, -D_x_w2, 0, 1, 0];  
zm_w2=[0, 0, 0, 0, -I_yz_w2, I_zz_w2, 0, 0, 0, 0, 0, 0, -D_y_w2, D_x_w2, 0, 0, 0, 1];  

% Total A
A=[xf_b;yf_b;zf_b;xm_b;ym_b;zm_b;xf_w1;yf_w1;yf_w1;xm_w1;ym_w1;zm_w1;xf_w2;yf_w2;zf_w2;xm_w2;ym_w2;zm_w2];

%% Matrix B
% Body
B_xf_b = X_aero_b - m_b*g*sin(theta_b) - m_b*(Q_b*W_b-R_b*V_b);
B_yf_b = Y_aero_b - m_b*g*cos(theta_b)*sin(phi) - m_b*(R_b*U_b-P_b*W_b);
B_zf_b = Z_aero_b - m_b*g*cos(theta_b)*cos(phi) - m_b*(P_b*V_b-Q_b*U_b);
B_xm_b = L_aero_b - (I_zz_b-I_yy_b)*(Q_b*R_b) + I_xz_b*P_b*Q_b;
B_ym_b = M_aero_b - (I_xx_b-I_zz_b)*(P_b*R_b) - I_xz_b*(P_b^2-R_b^2);
B_zm_b = N_aero_b - (I_zz_b-I_yy_b)*(P_b*Q_b) - I_xz_b*Q_b*R_b;

% Left wing
B_xf_w1 = X_aero_w1 - m_w1*g*sin(theta_b) - m_w1*(2*Q_b^2*(D_x_w1-d_x_b1)+2*R_b^2*(D_x_w1-d_x_b1)+2*P_b*Q_b*(d_y_b1-D_y_w1)+2*P_b*R_b*(d_z_b1-D_z_w1)+2*Q_b*W_b-2*R_b*V_b-3*P_w1*(Q_b*D_y_w1+R_b*D_z_w1));
B_yf_w1 = Y_aero_w1 - m_w1*g*cos(theta_b)*sin(phi) - m_w1*(2*P_b^2*(D_y_w1-d_y_b1)+2*R_b^2*(D_y_w1-d_y_b1)+2*P_b*Q_b*(d_x_b1-D_x_w1)+2*Q_b*R_b*(d_z_b1-D_z_w1)-2*P_b*W_b+2*R_b*U_b -P_b*P_w1*(d_y_b1-4*D_y_w1)+dotP_w1*D_z_w1+2*P_w1^2*D_y_w1-P_w1*W_b-P_w1*Q_b*(D_x_w1-d_x_b1));
B_zf_w1 = Z_aero_w1 - m_w1*g*cos(theta_b)*cos(phi) - m_w1*(2*P_b^2*(D_z_w1-d_z_b1)+2*Q_b^2*(D_z_w1-d_z_b1)+2*P_b*R_b*(d_x_b1-D_x_w1)+2*Q_b*R_b*(d_y_b1-D_y_w1)+2*P_b*V_b-2*Q_b*U_b +P_b*P_w1*(4*D_z_w1-d_z_b1)-dotP_w1*D_y_w1+2*P_w1^2*D_z_w2+P_w1*V_b+P_w1*R_b*(d_x_b1-D_x_w1));
B_xm_w1 = L_aero_w1 - I_xx_w1*dotP_w1 - (I_zz_w1-I_yy_w1)*(Q_b*R_b) - I_yz_w1*(R_b^2-Q_b^2);
B_ym_w1 = M_aero_w1 - dotI_yy_w1*Q_b + dotI_yz_w1*R_b - (I_xx_w1-I_zz_w1)*(P_b+P_w1)*R_b - I_yz_w1*(P_b+P_w1)*Q_b;
B_zm_w1 = N_aero_w1 - dotI_zz_w1*R_b + dotI_yz_w1*Q_b - (I_yy_w1-I_xx_w1)*(P_b+P_w1)*Q_b + I_yz_w1*(P_b+P_w1)*R_b;

% Right wing
B_xf_w2 = X_aero_w2 - m_w2*g*sin(theta_b) - m_w2*(2*Q_b^2*(D_x_w2-d_x_b2)+2*R_b^2*(D_x_w2-d_x_b2)+2*P_b*Q_b*(d_y_b2-D_y_w2)+2*P_b*R_b*(d_z_b2-D_z_w2)+2*Q_b*W_b-2*R_b*V_b-3*P_w2*(Q_b*D_y_w2+R_b*D_z_w2));
B_yf_w2 = Y_aero_w2 - m_w2*g*cos(theta_b)*sin(phi) - m_w2*(2*P_b^2*(D_y_w2-d_y_b2)+2*R_b^2*(D_y_w2-d_y_b2)+2*P_b*Q_b*(d_x_b2-D_x_w2)+2*Q_b*R_b*(d_z_b2-D_z_w2)-2*P_b*W_b+2*R_b*U_b -P_b*P_w2*(d_y_b2-4*D_y_w2)+dotP_w2*D_z_w2+2*P_w2^2*D_y_w2-P_w2*W_b-P_w2*Q_b*(D_x_w2-d_x_b2));
B_zf_w2 = Z_aero_w2 - m_w2*g*cos(theta_b)*cos(phi) - m_w2*(2*P_b^2*(D_z_w2-d_z_b2)+2*Q_b^2*(D_z_w2-d_z_b2)+2*P_b*R_b*(d_x_b2-D_x_w2)+2*Q_b*R_b*(d_y_b2-D_y_w2)+2*P_b*V_b-2*Q_b*U_b +P_b*P_w1*(4*D_z_w2-d_z_b2)-dotP_w2*D_y_w2+2*P_w2^2* D_z_w2 +P_w2*V_b+P_w2*R_b*(d_x_b2-D_x_w2));
B_xm_w2 = L_aero_w2 - I_xx_w2*dotP_w2 - (I_zz_w2-I_yy_w2)*(Q_b*R_b) - I_yz_w2*(R_b^2-Q_b^2);
B_ym_w2 = M_aero_w2 - dotI_yy_w2*Q_b + dotI_yz_w1*R_b - (I_xx_w2-I_zz_w2)*(P_b+P_w2)*R_b - I_yz_w2*(P_b+P_w2)*Q_b;
B_zm_w2 = N_aero_w2 - dotI_zz_w2*R_b + dotI_yz_w2*Q_b - (I_yy_w2-I_xx_w2)*(P_b+P_w2)*Q_b + I_yz_w2*(P_b+P_w2)*R_b;

% Total b
b=[B_xf_b;B_yf_b;B_zf_b;B_xm_b;B_ym_b;B_zm_b;B_xf_w1;B_yf_w1;B_zf_w1;B_xm_w1;B_ym_w1;B_zm_w1;B_xf_w2;B_yf_w2;B_zf_w2;B_xm_w2;B_ym_w2;B_zm_w2];

%% The solving Equation usually is x=A\b; 

%x = A\b;
A
x
b
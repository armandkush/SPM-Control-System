%Based on work by Iliyas Tursynbek 2021 at alaris.kz.
%Adapted by Muhammad Kushairi 2018
% Must install "MATLAB Support Package for Arduino Hardware" add on
% Click the Home tab in MATLAB and click on Add Ons
% Partner file is SPMControl.ino
% Code accepts desired orientation of platform as euler angles and converts
% to vi unit vectors where i=1,2,3
% Inverse kinematics calculations will compute the required input joint
% angles. The angles are then sent to Arduino to move the motor.



function theta = ikm(desired_roll, desired_pitch, desired_yaw)

alpha1 = deg2rad(45);
alpha2 = deg2rad(90);
beta = deg2rad(90);

x_rot = desired_roll;
y_rot = desired_pitch;
z_rot = desired_yaw;

% converting euler angles to rotation matrix.
R = eul2rotm(deg2rad([x_rot,y_rot,z_rot]), 'XYZ');

% Extract vi vectors
v1 = R(:,1);    % v1 = [v1x, v1y, v1z]
v2 = R(:,2);    % v2 = [v2x, v2y, v2z]
v3 = R(:,3);    % v3 = [v3x, v3y, v3z]

%//inverse kinematics starts here//
   A_1 = -cos(n_i_values(1))*sin(alpha1)*v1(1) - sin(n_i_values(1))*sin(alpha1)*v1(2) - cos(alpha1)*(v1(3)) - cos(alpha2);
   A_2 = -cos(n_i_values(2))*sin(alpha1)*v2(1) - sin(n_i_values(2))*sin(alpha1)*v2(2) - cos(alpha1)*(v2(3)) - cos(alpha2);
   A_3 = -cos(n_i_values(3))*sin(alpha1)*v3(1) - sin(n_i_values(3))*sin(alpha1)*v3(2) - cos(alpha1)*(v3(3)) - cos(alpha2);
   B_1 = sin(n_i_values(1))*sin(alpha1)*v1(1) - cos(n_i_values(1))*sin(alpha1)*v1(2);
   B_2 = sin(n_i_values(2))*sin(alpha1)*v2(1) - cos(n_i_values(2))*sin(alpha1)*v2(2);
   B_3 = sin(n_i_values(3))*sin(alpha1)*v3(1) - cos(n_i_values(3))*sin(alpha1)*v3(2);
   C_1 = cos(n_i_values(1))*sin(alpha1)*v1(1) + sin(n_i_values(1))*sin(alpha1)*v1(2) - cos(alpha1)*v1(3) - cos(alpha2);
   C_2 = cos(n_i_values(2))*sin(alpha1)*v2(1) + sin(n_i_values(2))*sin(alpha1)*v2(2) - cos(alpha1)*v2(3) - cos(alpha2);
   C_3 = cos(n_i_values(3))*sin(alpha1)*v3(1) + sin(n_i_values(3))*sin(alpha1)*v3(2) - cos(alpha1)*v3(3) - cos(alpha2);



% quadratic eqn: A_1*(T_1)^2 + 2*B_1*(T_1) + C_1 = 0

T_1 = roots([A_1, 2*(B_1), C_1]);
T_2 = roots([A_2, 2*(B_2), C_2]);
T_3 = roots([A_3, 2*(B_3), C_3]);


thetai_1 = 2*atan(T_1);
thetai_2 = 2*atan(T_2);
thetai_3 = 2*atan(T_3);



%if using l-l-l mode take first root, if using r-r-r mode, take second root
%l-l-l mode roots
 thetai_1_l = thetai_1(1);
 thetai_2_l = thetai_2(1);
 thetai_3_l = thetai_3(1);

%r-r-r mode roots
% thetai_1_r = thetai_1(2);
% thetai_2_r = thetai_2(2);
% thetai_3_r = thetai_3(2);

%converting to angles. if using r-r-r replace with r variables

 thetai_1_l_deg = rad2deg((thetai_1_l)) %*(180/pi)
 thetai_2_l_deg = rad2deg((thetai_2_l)) %*(180/pi)
 thetai_3_l_deg = rad2deg((thetai_3_l)) %*(180/pi)

% Connect your Arduino and check for its COM port and BaudRate.
% edit COM port and BaudRate to your computer
s = serial('insert COM port here', 'BaudRate', 9600);

fopen(s);

% Send servo angles to Arduino
angle1 = thetai_1_l_deg;
angle2 = theta_2_l_deg;
angle3 = theta_3_1_deg;

fwrite(s, [angle1, angle2, angle3], 'uint8');

% Close serial connection
fclose(s);

%  thetai_1_r_deg = rad2deg((thetai_1_r)) %*(180/pi)
%  thetai_2_r_deg = rad2deg((thetai_2_r)) %*(180/pi)
%  thetai_3_r_deg = rad2deg((thetai_3_r)) %*(180/pi)
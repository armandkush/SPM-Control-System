%Based on work by Iliyas Tursynbek 2021 at alaris.kz.
%Adapted by Muhammad Kushairi 2018
% Code receives an input for design parameters as stated below to conduct
% forward kinematic analysis to obtain platform orientation of a given
% input joint theta in terms of Vi unit vectors for i=1,2,3.



function vi = fkm(thetadeg, alpha1deg, alpha2deg, betadeg, desired_rotation)

% fkm computes vi(unique unit vectors) for a given set of inputs
% theta- vector containing input joints positions
% alpha1 - curvature of proximal link
% alpha2 - curvature of distal link
% beta - angle of upper platform
% x0 - initial guess vector
% ni, no of i



%convert inputs to radians
 theta = deg2rad(thetadeg)
 beta = deg2rad(betadeg)
 alpha1 = deg2rad(alpha1deg)
 alpha2 = deg2rad(alpha2deg)
 dr = deg2rad(desired_rotation)

% % Calculate alpha3
 alpha3 = 2*asin(sin(beta)*cos(pi/6))

%setting up arrays to store values
w_irot_array = zeros(3,3);
n_i_values = zeros(1,3);
u_i = [0;0;1];


for i = 1:3

    % Calculate w_i vector for each joint
    n_i= 2*(pi)*(i-1)/3
    n_i_values(:,i) = n_i;
    theta_i = theta(i)
    w_i = [sin(n_i -theta_i)*sin(alpha1);
           cos(n_i -theta_i)*sin(alpha1);
           -cos((alpha1))]
     % Calculate rotated w_i vector
     w_irot = (w_i*cos(dr)) + (cross(w_i, u_i)*sin(dr)) + (u_i * dot(u_i, w_i) * (1 - cos(dr)))
     w_irot = w_irot / norm(w_irot)
     w_irot_array(:,i) = w_irot;
   
end
 disp(w_irot_array)
 disp(n_i_values(2))
 
 disp(n_i_values)
 
% Initialize initial guess vector
 x0 = [w_irot_array(1,1), w_irot_array(2,1), -(w_irot_array(3,1)), w_irot_array(1,2), w_irot_array(2,2), 
     -(w_irot_array(3,2)), w_irot_array(1,3), w_irot_array(2,3), -(w_irot_array(3,3))].'
 %x0 = [1,-1,1,-1,-1,1,-1,1,1].';
 
 % Set options for fsolve
 options = optimoptions('fsolve', 'Algorithm', 'trust-region-dogleg');

% Call fsolve to solve the equations
 vi = fsolve(@equations, x0, options);
 
%Obtained vi unit vectors.
  v1 = vi(1:3)
  v2 = vi(4:6)
  v3 = vi(7:9)

 
 



 % Define function that evaluates the equations
 function F = equations(x)
      v1 = x(1:3);
      v2 = x(4:6);
      v3 = x(7:9);
     
     % Use global variables to evaluate dot products and norms
      F = [  dot(w_irot_array(:,1), v1) - cos(alpha2);
             dot(w_irot_array(:,2), v2) - cos(alpha2);
             dot(w_irot_array(:,3), v3) - cos(alpha2);
             dot(v1, v2) - cos(alpha3);
             dot(v1, v3) - cos(alpha3);
             dot(v2, v3) - cos(alpha3);
             norm(v1) - 1;
             norm(v2) - 1;
           norm(v3) - 1;
     ];

 end

end

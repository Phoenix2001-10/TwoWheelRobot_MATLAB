function [x,y,theta] = Robot_Kinematics(...
    left_speed,...
    right_speed,...
    x,...
    y,...
    theta,...
    dt)


wheel_base = 0.5;


linear_velocity = ...
    (left_speed + right_speed)/2;


angular_velocity = ...
    (right_speed-left_speed)/wheel_base;


theta = theta + angular_velocity*dt;


x = x + linear_velocity*cos(theta)*dt;


y = y + linear_velocity*sin(theta)*dt;


end
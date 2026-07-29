clear;
clc;
close all;


dt = 0.05;


time = 20;


steps = time/dt;


% Robot state

x = 0;
y = 0;
theta = 0;


left_speed = 0;
right_speed = 0;



target_left = 5;
target_right = 5;



x_history=[];
y_history=[];



for i=1:steps


left_power = PID_Controller(...
    target_left,...
    left_speed,...
    2,...
    0.5,...
    0.1,...
    dt);



right_power = PID_Controller(...
    target_right,...
    right_speed,...
    2,...
    0.5,...
    0.1,...
    dt);



left_speed = DC_Motor(...
    left_power,...
    left_speed,...
    dt);



right_speed = DC_Motor(...
    right_power,...
    right_speed,...
    dt);



[x,y,theta]=Robot_Kinematics(...
    left_speed,...
    right_speed,...
    x,...
    y,...
    theta,...
    dt);



x_history(end+1)=x;
y_history(end+1)=y;


end



plot(x_history,y_history,'LineWidth',2)

grid on

xlabel("X Position")
ylabel("Y Position")

title("Two Wheel Robot Path")
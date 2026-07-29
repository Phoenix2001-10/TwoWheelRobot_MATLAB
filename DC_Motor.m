function speed = DC_Motor(power, previous_speed, dt)


motor_constant = 2;


friction = 0.5;


acceleration = ...
    power*motor_constant ...
    - friction*previous_speed;


speed = previous_speed + acceleration*dt;


end
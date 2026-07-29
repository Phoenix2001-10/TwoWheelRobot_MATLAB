function output = PID_Controller(target,current,Kp,Ki,Kd,dt)

persistent integral previous_error

if isempty(integral)
    integral = 0;
    previous_error = 0;
end


error = target - current;


integral = integral + error*dt;


derivative = (error - previous_error)/dt;


output = Kp*error + Ki*integral + Kd*derivative;


previous_error = error;

end

%dbjafdjafnfnafkaw

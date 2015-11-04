s = restartConnection();
close all;
figure;
axis([-400,400,-400,400]);
path_clear = 1;
low_threshold = 40;
high_threshold = 65;

sensors = zeros(1,8);
av_sensors = sensors;
x = 0;
y = 0;
phi = 0;
setCounts(s, 0, 0);
global_speed = 5;
current_time = clock;
start_time = current_time;
speed = global_speed;
go(s,global_speed);

while (av_sensors(8) < 300)
    [av_sensors,x,y,phi,current_time] = updatePosition(s,av_sensors, current_time, x, y, phi);
    % go straight until path is clear
    if path_clear
        if (av_sensors(4) > high_threshold)
            path_clear = 0;
        end
    else
        % follow wall
        speed = obstacleAvoidance (s, av_sensors, speed,low_threshold,high_threshold,global_speed);
    end
    times = [current_time(6),start_time(6)];
    % go for 30 seconds
    if(mod(max(times) - min(times),60)>10)
        break;
    end
end
stop(s);
1;


go(s,global_speed);
speed = [global_speed,global_speed];
[x,y,phi,current_time] = calculateAngle(s,x,y,phi,current_time, av_sensors,high_threshold);
direction = phi;
while (abs(goal(1)-x) + abs(goal(2)-y) > 1)
    av_sensors = readIRAV(s,av_sensors);
    [av_sensors,x,y,phi,current_time] = updatePosition(s,av_sensors, current_time, x, y, phi);
    directionDifference(0,0,x,y,phi);
    if (abs(directionDifference(goal(1),goal(2),x,y,phi))>5)
        [x,y,phi,current_time] = calculateAngle(s,goal(1),goal(2),x,y,phi,current_time, av_sensors,high_threshold);
        direction = phi;
    end
    go(s,global_speed);
end
stop(s);

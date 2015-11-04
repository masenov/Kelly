go(s,global_speed);
current_speed = [global_speed,global_speed];
while (abs(goal(1)-x) + abs(goal(2)-y) > 2)
    av_sensors = readIRAV(s,av_sensors,current_time);
    [av_sensors,x,y,phi,current_time] = updatePosition(s,av_sensors, current_time, x, y, phi);
    [av_sensors,x,y,phi,current_time,current_speed] = adjustAngle(s,goal(1),goal(2),x,y,phi,current_time,av_sensors,current_speed,global_speed);
end
stop(s);
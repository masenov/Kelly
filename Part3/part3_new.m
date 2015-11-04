init;

while (av_sensors(8) < 300)
    [av_sensors,x,y,phi,current_time] = updatePosition(s,av_sensors, current_time, x, y, phi);
end
stop(s);

goal = [0,-10];
goToPosition;
goal = [10,10];
goToPosition;
function [ av_sensors,x,y,phi,current_time ] = updatePosition(s,av_sensors, current_time, x, y, phi )
    av_sensors = readIRAV(s,av_sensors,current_time);
    counts = readCounts(s);
    cl = clock;
    if (abs(cl(6) - current_time(6)) > 0.5)
        [x,y,phi,current_time] = calculateOdometry(s,counts(1),counts(2),x,y,phi,current_time);
    end
end


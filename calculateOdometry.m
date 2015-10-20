function [x,y,phi,countdown,map,current_time] = calculateOdometry(s,counts1,counts2,x,y,phi,countdown,map,time)
    countdown = countdown + counts1 + counts2;
    setCounts(s, 0, 0);
    current_time = clock;
    time_difference = abs(current_time(6)-time(6));
    v1 = counts1/time_difference;
    v2 = counts2/time_difference;
    x = x + (0.5*(v1 + v2)*cos((phi/180)*3.1428))/400;
    y = y + (0.5*(v1 + v2)*sin((phi/180)*3.1428))/400;
    phi = mod(phi - 0.5*(v1 - v2)/38,360);
    map(200 + round(x),200 + round(y)) = 0;
end

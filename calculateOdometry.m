function [x,y,phi,countdown,map,current_time] = calculateOdometry(s,counts1,counts2,x,y,phi,countdown,map,time)
    countdown = countdown + counts1 + counts2;
    setCounts(s, 0, 0);
    current_time = clock;
    time_difference = abs(current_time(6)-time(6));
    v1 = counts1/time_difference;
    v2 = counts2/time_difference;
    x = x + (0.5*(v1 + v2)*cos((phi/180)*3.1428))/40;
    y = y + (0.5*(v1 + v2)*sin((phi/180)*3.1428))/40;
    phi = mod(phi - 0.5*(v1 - v2)/10,360);
    map(200 + round(x),200 + round(y)) = 0;
    axis([-400,400,-400,400]);
    plot(x,y,'c*');
    hold on;
    drawnow;
    [x,y]
end

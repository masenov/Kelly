function [x,y,phi,current_time] = calculateOdometry(s,counts1,counts2,x,y,phi,time)
    setCounts(s, 0, 0);
    current_time = clock;
    time_difference = abs(current_time(6)-time(6));
    v1 = counts1/time_difference;
    v2 = counts2/time_difference;
    x = x + (0.5*(v1 + v2)*cos((phi/180)*3.1428))/210;
    y = y + (0.5*(v1 + v2)*sin((phi/180)*3.1428))/210;
    phi = mod(phi - 0.5*(v1 - v2)/10,360);
    axis([-400,400,-400,400]);
    plot(x*4,y*4,'c*');
    hold on;
    drawnow;
end

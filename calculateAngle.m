function [x,y,phi,current_time] = calculateAngle(s,x,y,phi,map,current_time)
    stop(s);
    direction = rad2deg(atan2(y,x))+180;
    difference = abs(phi-direction)/53;
    if (phi - direction>0)
        turn(s,3,-3);
    else
        turn(s,-3,3);
    end
   
    while(difference>0)
         cl = clock;
        if (abs(cl(6) - current_time(6)) > 0.5)
            counts = readCounts(s);
            [x,y,phi,countdown,map,current_time] = calculateOdometry(s,counts(1),counts(2),x,y,phi,100,map,current_time);
            difference = difference - 0.5;
        end
    end
end

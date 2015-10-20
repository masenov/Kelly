function [x,y,phi,current_time] = calculateAngle(s,x,y,phi,map,current_time)
    direction = rad2deg(atan2(y,x))+180;
    speed = 0;
    phi, direction
    while (abs(phi-direction)>3)
        if (speed == 0)
            turn(s,-4,4);
            speed = [-4,4];
        end
        if (abs(phi-direction)<20)
            turn(s,-1,1);
        end
        pause(0.07);
        counts = readCounts(s);
        [x,y,phi,~,map,current_time] = calculateOdometry(s,counts(1),counts(2),x,y,phi,0,map,current_time);
    end
end

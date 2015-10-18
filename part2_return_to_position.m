%reset counts
sensors = zeros(1,8);
av_sensors = sensors;
x = 0;
y = 0;
phi = 0;
counts = [0,0];
setCounts(s, 0, 0);
global_speed = 3;
go(s,global_speed);
map = ones(401,401);
countdown = 0;


while (av_sensors(8) < 300)
    
    [sensors, av_sensors] = readIRAV(s,av_sensors);
    counts = readCounts(s);
    if (counts(1) + counts(2) > 400)
        [x,y,phi,countdown,map] = calculateOdometry(s,counts(1),counts(2),x,y,phi,countdown,map);
        if countdown > global_speed*800
            break;
        end
    end
    phi

end
go(s,0);
readCounts(s);
direction = rad2deg(atan2(y,x))+180;
turn(s,-3,3);
while (abs(phi-direction)>10 && av_sensors(8) < 300)
    pause(0.05);
    counts = readCounts(s);
    [x,y,phi,countdown,map] = calculateOdometry(s,counts(1),counts(2),x,y,phi,countdown,map);
    phi
end
go(s,2);
while (abs(x) + abs(y) > 5)
    pause(0.05);
    counts = readCounts(s);
    [x,y,phi,countdown,map] = calculateOdometry(s,counts(1),counts(2),x,y,phi,countdown,map);
end
stop(s);
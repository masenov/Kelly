path_clear = 1;
low_threshold = 40;
high_threshold = 65;

%reset counts
sensors = zeros(1,8);
av_sensors = sensors;
x = 0;
y = 0;
phi = 0;
counts = [0,0];
setCounts(s, 0, 0);
global_speed = 3;
turn(s,2,-2)
map = ones(401,401);
countdown = 0;
while (av_sensors(8) < 300)
    [sensors, av_sensors] = readIRAV(s,av_sensors);
    counts = readCounts(s);
    if (abs(counts(1)) + abs(counts(2)) > 200)
        [x,y,phi,countdown,map] = calculateOdometry(s,counts(1),counts(2),x,y,phi,countdown,map);
    end
    phi
end
stop(s);

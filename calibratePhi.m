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
turn(s,3,-3)
map = ones(401,401);
countdown = 0;
current_time = clock;
while (av_sensors(8) < 300)
    [sensors, av_sensors] = readIRAV(s,av_sensors);
    counts = readCounts(s);
    cl = clock;
    if (abs(cl(6) - current_time(6)) > 0.5)
        [x,y,phi,countdown,map,current_time] = calculateOdometry(s,counts(1),counts(2),x,y,phi,countdown,map,current_time);
    end
    phi
end
stop(s);

s = restartConnection();
close all;
figure;
axis([-400,400,-400,400]);
path_clear = 1;
low_threshold = 40;
high_threshold = 65;

sensors = zeros(1,8);
av_sensors = sensors;
x = 0;
y = 0;
phi = 0;
setCounts(s, 0, 0);
global_speed = 5;
current_time = clock;
start_time = current_time;
speed = global_speed;
go(s,global_speed);
% setup
sensors = zeros(1, 8);
av_sensors = sensors;
x = 0;
y = 0;
phi = 0;
counts = [0, 0];
setCounts(s,0,0);
global_speed = 3;
map = ones(401, 401);
countdown = 0;

% wander for 30 seconds while avoiding obstacles ========
% start moving 
go(s, global_speed);
% update current position on map

% return to starting position ==========
% get current location
% get proper heading
% drive straight back to goal while no obstacles
% if obstacle, drive around obstacle and recalculate heading
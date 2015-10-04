s = serial('/dev/ttyS0');
fopen(s);
turn(s,4,4);
path_clear = 1;
low_threshold = 50;
high_threshold = 75;
av_sensors = zeros(1,8);
while path_clear
    sensors = readIR(s);
    av_sensors = (9*av_sensors + sensors)/10;
    av_sensors
    if (av_sensors(3) > high_threshold || av_sensors(4) > high_threshold)
        path_clear = 0;
    end
end

while true
    sensors = readIR(s);
    av_sensors = (9*av_sensors + sensors)/10;
    av_sensors
    % too close to the wall
    if (av_sensors(3) > high_threshold || av_sensors(5) > high_threshold*1.5)
        % left
        turn(s,-4,4)
    % too far away from the wall
    elseif (av_sensors(6) < low_threshold*1.5)
        % right
        turn(s,4,-4)
    % keep straight
    else
        turn(s,4,4)
    end
end
















% while true
%     sensors = readIR(s);
%     sensors(1);
%     if (and(sensors(3) < 100,sensors(1) < 90))
%         turn(s,4,4)
%     else
%         if (sensors(1) > 100)
%             turn(s,4,0)
%         else
%             turn(s,0,4)
%         end
%     end
%     
% end
% stop(s);
% fclose(s);

go(s,4);
path_clear = 1;
low_threshold = 20;
high_threshold = 40;
av_sensors = zeros(1,8);
while path_clear
    [sensors,av_sensors] = readIRAV(s,av_sensors);
    % We have to use only one of the sensor, see below
    av_sensors
    if (av_sensors(4) > high_threshold)
        path_clear = 0;
    end
end

while (av_sensors(8) < 150)
    av_sensors
    [sensors,av_sensors] = readIRAV(s,av_sensors);
    % Obstacle in front
    % We shouldn't use the third sensor, otherwise we keep fluctuating
    % between "Obstacle in front" and "Too far away from the wall"
    if (av_sensors(4) > high_threshold)
        % Turn left in place
        speed = [-4,4];
        turn(s,-4,4);
        1
    % Too close to the wall
    elseif (av_sensors(5) > high_threshold*1.5 || av_sensors(6) > high_threshold*1.5)
        % Turn left curved
        sharpness = calculateTurn(av_sensors(5),high_threshold*1.5,high_threshold*1.5*2,4);
        if (sum(speed == [sharpness,4] < 1))
            speed = [sharpness,4];
            turn(s,sharpness,4);
        end
        2
    % Too far away from the wall
    elseif (av_sensors(5) < low_threshold*1.5 || av_sensors(6) < low_threshold*1.5)
        % Turn right curved
        sharpness = calculateTurn(av_sensors(6),0,low_threshold*1.5,4);
        if (sum(speed == [4,sharpness] < 1))
            speed = [4,sharpness];
            turn(s,4,sharpness);
        end
        3
    % Keep straight
    else
        if (sum(speed == [4,4] < 1))
            speed = [4,4];
            turn(s,4,4)
        end
        4
    end
end
go(s,0);
readCounts(s);
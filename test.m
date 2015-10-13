turn(s,4,4);
path_clear = 1;
low_threshold = 50;
high_threshold = 75;
av_sensors = zeros(1,8);
while path_clear
    [sensors,av_sensors] = readIRAV(s,av_sensors);
    if (av_sensors(3) > high_threshold || av_sensors(4) > high_threshold)
        path_clear = 0;
    end
end

while true
    [sensors,av_sensors] = readIRAV(s,av_sensors);
    % Obstacle in front
    if (av_sensors(3) > high_threshold || av_sensors(4) > high_threshold)
        % Turn left in place
        speed = [-4,4];
        turn(s,-4,4);
    % Too close to the wall
    elseif (av_sensors(5) > high_threshold*1.5 || av_sensors(6) > high_threshold*1.5)
        % Turn left curved
        sharpness = calculateTurn(av_sensors(5),high_threshold*1.5,high_threshold*1.5*2);
        if (sum(speed == [sharpness,4] < 1))
            speed = [sharpness,4];
            turn(s,sharpness,4);
        end
    % Too far away from the wall
    elseif (av_sensors(5) < low_threshold*1.5 || av_sensors(6) < low_threshold*1.5)
        % Turn right curved
        sharpness = calculateTurn(av_sensors(6),0,low_threshold*1.5);
        if (sum(speed == [4,sharpness] < 1))
            speed = [4,sharpness];
            turn(s,4,sharpness);
        end
    % Keep straight
    else
        if (sum(speed == [4,4] < 1))
            speed = [4,4];
            turn(s,4,4)
        end
    end
end

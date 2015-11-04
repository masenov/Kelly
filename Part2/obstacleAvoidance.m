function speed = obstacleAvoidance( s, av_sensors, speed, low_threshold, high_threshold, global_speed )
    % Obstacle in front
    % We shouldn't use the third sensor, otherwise we keep fluctuating
    % between "Obstacle in front" and "Too far away from the wall"
    if (av_sensors(4) > high_threshold)
        % Turn left in place
        speed = [-global_speed,global_speed];
        turn(s,-global_speed,global_speed);
    % Too close to the wall
    elseif (av_sensors(6) > high_threshold*1.5)
        % Turn left curved
        new_speed = calculateTurn(av_sensors(6),high_threshold*1.5,high_threshold*1.5*2,global_speed);
        if (sum(speed == new_speed < 1))
            speed = new_speed;
            turn(s,speed(1),speed(2));
        end
    % Too far away from the wall
    elseif (av_sensors(6) < low_threshold*1.5)
        % Turn right curved
        new_speed = calculateTurn(av_sensors(6),0,low_threshold*1.5,global_speed);
        if (sum(speed == new_speed < 1))
            speed = new_speed;
            turn(s,speed(1),speed(2));
        end
    % Keep straight
    else
        if (sum(speed == [global_speed,global_speed] < 1))
            speed = [global_speed,global_speed];
            go(s,global_speed);
        end
    end
end


path_clear = 1;
low_threshold = 50;
high_threshold = 75;

%reset counts
sensors = zeros(1,8);
av_sensors = sensors;
x = 0;
y = 0;
phi = 0;
setCounts(s, 0, 0);
turn(s,4,4);
map = ones(801,801);

while (av_sensors(8) < 150)
    
    [sensors, av_sensors] = readIRAV(s,av_sensors);
    counts = readCounts(s);
    setCounts(s, 0, 0);
    x = x + (0.5*(counts(1) + counts(2))*cos((phi/180)*3.1428))/80;
    y = y + (0.5*(counts(1) + counts(2))*sin((phi/180)*3.1428))/80;
    phi = mod(phi - 0.5*(counts(1) - counts(2))/4.2,360);
    map(400 + round(x),400 + round(y)) = 0;
    [x y phi]
%   Calibrate angle
%     if (phi < 5)
%         go(s,0);
%         readCounts(s);
%         break;
%     end
    if path_clear
        if (av_sensors(3) > high_threshold || av_sensors(4) > high_threshold)
            path_clear = 0;
        end
    else
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
    imshow(map);
    
end
go(s,0);
readCounts(s)
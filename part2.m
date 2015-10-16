%reset counts
sensors = zeros(1,8);
averageValues = sensors;
x = 0;
y = 0;
phi = 0;
map = ones(801,801);
imshow(map);
setCounts(s, 0, 0);
turn(s,4,2);
while (averageValues(8) < 150)
    [sensors, averageValues] = readIRAV(s,averageValues);
    counts = readCounts(s);
    % in case the counts don't get read
    if (numel(counts)==0)
        counts = [0,0];
    end
    setCounts(s, 0, 0);
    % The equations are here - http://www.inf.ed.ac.uk/teaching/courses/ivr/practicals/week6s.html
    % 80 is supposed to be normalization constant, so x and y measure in
    % centimeters. I think it is a bit off at the moment
    x = x + (0.5*(counts(1) + counts(2))*cos((phi/180)*3.1428))/80;
    y = y + (0.5*(counts(1) + counts(2))*sin((phi/180)*3.1428))/80;
    % 4.2 is normalization constant as well. I think it is pretty well
    % calibrated at the moment, but you can have a look.
    phi = mod(phi - 0.5*(counts(1) - counts(2))/4.2,360);
    map(400 + round(x),400 + round(y)) = 0;
    [x y phi]
%   Calibrate angle - that's how I was calibrating the angle - making the
%   robot do one full 360 degree turn
%     if (phi < 5)
%         go(s,0);
%         readCounts(s);
%         break;
%     end
    imshow(map);
    
end
go(s,0);
readCounts(s)
    
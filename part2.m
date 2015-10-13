%reset counts
sensors = zeros(1,8);
averageValues = sensors;
x = 0;
y = 0;
phi = 0;
setCounts(s, 0, 0);
turn(s,1,1);
while (averageValues(8) < 100)
    [sensors, averageValues] = readIRAV(s,averageValues);
    counts = readCounts(s);
    x = x + 0.5*(counts(1) + counts(2)*cos(phi));
    y = y + 0.5*(counts(1) + counts(2)*sin(phi));
    phi = phi - 0.5*(counts(1) + counts(2))/8;
    setCounts(s, 0, 0);
    [x,y,phi]
    
end
go(s,0);
readCounts(s)
    
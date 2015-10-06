function [readingDifference,steps] = odometry(s)
    averageSensorVals = readIR(s);
    averageReading = averageSensorVals;
    setCounts(s,0,0);
    while true
       [newReading,averageReading] = readIRAV(s,averageReading);
       averageReading;
       averageSensorVals = (49*averageSensorVals + newReading)/50;
       if (averageReading(4) - averageSensorVals(4) > 3 || averageReading(3) - averageSensorVals(3) > 3)
           go(s,1);
           setCounts(s,0,0);
           beginning = averageReading;
           while (sum(readCounts(s)>180) == 0)
           [newReading,averageReading] = readIRAV(s,averageReading);
           end
           ending = averageReading;
           stop(s);
           readingDifference = ending(3:4) - beginning(3:4);
           steps = readCounts(s);
           break;
       end
    end
end
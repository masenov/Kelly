function averageSensorVals = readIRAV(s, oldAverageSensorVals,current_time)
    cl = clock;
    sensorVals = 0;
    if (abs(cl(6) - current_time(6)) > 0.1)
        sensorVals = readIR(s);
    end
    averageSensorVals = oldAverageSensorVals;
    if (size(sensorVals,2) == 8)
        averageSensorVals = (4*oldAverageSensorVals + sensorVals)/5;
    end
end


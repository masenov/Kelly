function averageSensorVals = readIRAV(s, oldAverageSensorVals)
    sensorVals = readIR(s);
    averageSensorVals = oldAverageSensorVals;
    if (size(sensorVals,2) == 8)
        averageSensorVals = (4*oldAverageSensorVals + sensorVals)/5;
    end
end


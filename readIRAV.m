function [sensorVals,averageSensorVals] = readIRAV(s, oldAverageSensorVals)
    sensorVals = readIR(s);
    averageSensorVals = oldAverageSensorVals;
    if (size(sensorVals,2) == 8)
        averageSensorVals = (9*oldAverageSensorVals + sensorVals)/10;
    end
end


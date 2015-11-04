function sensorVals = testIR(s,n)
    while (true)
        fprintf(s,'N');
        sensorString = fscanf(s);
        splitString = regexp(sensorString,',','split');
        sensorVals = cellfun(@str2num,splitString(2:end));
        pause(0.3);
        sensorVals(n)
    end
end

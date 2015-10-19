function counts = readCounts(s) 
    fprintf(s,'H');
    countString = fscanf(s);
    splitString = regexp(countString,',','split');
    counts = cellfun(@str2num,splitString(2:end));
    if (numel(counts)==0) 
        counts = [0,0];
    end
end

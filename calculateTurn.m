function speed = calculateTurn(sensor,mins,maxs)
speed = round(((maxs-sensor)/(maxs-mins))*8 - 4);
end

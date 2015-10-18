function speed = calculateTurn(sensor,mins,maxs,speed)
speed = round(((maxs-sensor)/(maxs-mins))*2*speed - speed);
end

function speed = calculateTurn(sensor,mins,maxs,global_speed)
factoring = round((sensor-80)/(20/global_speed));
if factoring > global_speed
    sharpness = global_speed;
elseif factoring < -global_speed
    sharpness = -global_speed;
else
    sharpness = factoring;
end
if sensor>80
    speed = [sharpness,global_speed];
else
    speed = [global_speed,sharpness];
end
end

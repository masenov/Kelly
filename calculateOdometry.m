function [x,y,phi,countdown,map] = calculateOdometry(s,counts1,counts2,x,y,phi,countdown,map)
    countdown = countdown + counts1 + counts2;
    setCounts(s, 0, 0);
    x = x + (0.5*(counts1 + counts2)*cos((phi/180)*3.1428))/80;
    y = y + (0.5*(counts1 + counts2)*sin((phi/180)*3.1428))/80;
    phi = mod(phi - 0.5*(counts1 - counts2)/4.2,360);
    map(200 + round(x),200 + round(y)) = 0;
end

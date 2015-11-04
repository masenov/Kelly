function difference = directionDifference( x1,y1,x2,y2,phi )


direction = rad2deg(atan2(y2-y1,x2-x1))+180;
difference = phi-direction;
end


function cell = findNearestWithValue( curr, map, value )
% returns the unvisited cell on the map nearest to current cell (when value is set to unvisited)
% CONSIDER:would it be better to return the path to this cell? avoid doing this calculation twice

s = size(map);
mapboundx = s(2); %col currently 20 20
mapboundy = s(1); %row currently 12

%look for the nearest cell of value value

if map(curr(1), curr(2) == value)
return curr;
end


end


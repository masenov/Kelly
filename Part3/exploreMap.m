map = createMap();
%starting position and food drop location
%home = [10.5, 2.5];
home = [10, 2];
%marks the current position
currPos = home;

%move down and left to get situated within a cell

% Visit the areas with the highest value first.  Never visit negative areas (obstacles)
%wander, following 1s
%if the next cell is unvisited, move forward
if map(currPos(1), currPos(2)) == 1 
    %move forward 1
end
%elseif map(currPos

%when not adjacent to any 1s, look for nearest 1

%if has food > 0 and home closer
%go home and dump food
%else go to the nearest one
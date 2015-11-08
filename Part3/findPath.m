function path = findPath(curr, goal)
%Finds a path between curr and goal.  BFS
%Note that for our purposes, the entire map is connected, so a path should
%always be found as long as the goal is on the map

path = {[goal(1), goal(2)]};

%check that goal is valid
%TODO: edit to match new map
mapxbound = 20; %col
mapybound = 12; %row
if (goal(1) > mapybound || goal(2) > mapxbound || goal(1) < 0 || goal(2) < 0)
    return;
end

%to avoid creating maps when you don't need to
if (curr == goal)
    return;
end

%make a map to store the path
map = createPathMap();
visited = 3333;
map{curr(1), curr(2)} = visited;

%make queue
q = CQueue;
q.push(curr);
%q.push(curr(1));
%q.push(curr(2));
unvisited = 1;
count = 1;
while (~q.isempty()) 
    %cellx = q.pop();
    %celly = q.pop();
    %if (cellx == goal(1) && celly == goal(2))
    cell = q.pop();
    if (cell == goal)
        %map{goal(1), goal(2)} = [cell(1), cell(2)];
        break;
    end
    %add adjacent (front/back/right/left) cells to the queue
    %front
    if (map{cell(1)+1, cell(2)} == unvisited)
        map{cell(1)+1, cell(2)} = [cell(1), cell(2)];
        q.push([cell(1)+1, cell(2)]);
    end
    %back
    if (map{cell(1)-1, cell(2)} == unvisited)
        map{cell(1)-1, cell(2)} = [cell(1), cell(2)];
        q.push([cell(1)-1, cell(2)]);
    end
    %right
    if (map{cell(1), cell(2)+1} == unvisited)
        map{cell(1), cell(2)+1} = [cell(1), cell(2)];
        q.push([cell(1), cell(2)+1]);
    end
    %left
    if (map{cell(1), cell(2)-1} == unvisited)
        map{cell(1), cell(2)-1} = [cell(1), cell(2)];
        q.push([cell(1), cell(2)-1]);
    end
end

%recover path
while (goal(1) ~= curr(1) || goal(2) ~= curr(2))
    %prevent starting pos from being added to the path
    if map{goal(1),goal(2)}(1) == curr(1) && map{goal(1),goal(2)}(2) == curr(2)
        break;
    end
    path = [map{goal(1), goal(2)}, path];
    goal = map{goal(1), goal(2)};
    %goal
end


end


% move from curr to goal
curr = [3,11];
goal = [8,2];

path = findPath(curr,goal);

%print path
s=size(path)
for i=1:s(2)
    disp(path{i})
end
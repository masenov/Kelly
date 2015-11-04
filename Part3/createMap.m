%create a map that's 54*30 (with a border of walls).  Each cell is 2.5 x
%2.5 cm (from hole to hole on the walls) 
%TODO: change to size of Kelly
xboundary = 55;
yboundary = 31;
map = zeros(yboundary, xboundary);

%fill in walls
for i=1:xboundary
    map(1,i) = 1;
    map(yboundary, i) = 1;
end
for i=1:yboundary
    map(i,1) = 1;
    map(i,xboundary) = 1;
end

%fill in obstacles (11 total)
%real map (without walls) is [2,yboundary-1][2,xboundary-1]
%map(row, col)

%obstacle 1


map

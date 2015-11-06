%create a map that's 18x10 (with a border of walls).  Each cell is 7.5x7.5cm

xboundary = 20;
yboundary = 12;
map = zeros(yboundary, xboundary);
blocked = -1;

%fill in walls
for i=1:xboundary
    map(1,i) = blocked;
    map(yboundary, i) = blocked;
end
for i=1:yboundary
    map(i,1) = blocked;
    map(i,xboundary) = blocked;
end

%fill in obstacles (11 total)
%real map (without walls) is [2,yboundary-1][2,xboundary-1]
%map(row, col)

%obstacle 1
map(2,2) = blocked;
map(2,3) = blocked;
map(2,4) = blocked;
map(2,5) = blocked;
map(3,2) = blocked;
map(4,2) = blocked;

%obstacle 2
map(6,2) = blocked;
map(6,3) = blocked;
map(7,2) = blocked;
map(7,3) = blocked;
map(8,3) = blocked;
map(8,4) = blocked;
map(8,5) = blocked;
map(9,4) = blocked;
map(9,5) = blocked;

%obstacle 3
map(2,7) = blocked;
map(3,7) = blocked;
map(4,7) = blocked;

%obstacle 4
map(7,7) = blocked;
map(8,7) = blocked;
map(9,7) = blocked;

%obstacle 5
map(4,10) = blocked;
map(4,11) = blocked;
map(5,10) = blocked;
map(5,11) = blocked;
map(6,10) = blocked;
map(6,11) = blocked;
map(7,10) = blocked;
map(7,11) = blocked;
map(8,10) = blocked;
map(8,11) = blocked;

%obstacle 6
map(2,16) = blocked;
map(2,17) = blocked;
map(3,17) = blocked;
map(4,17) = blocked; %should this one be cleared to allow access?

%obstacle 7
map(5,14) = blocked;
map(5,15) = blocked;
map(5,16) = blocked;
map(6,15) = blocked;

%obstacle 8
map(8,14) = blocked;
map(8,15) = blocked;
map(9,15) = blocked;
map(10,13) = blocked;
map(10,14) = blocked;
map(10,15) = blocked;
map(11,13) = blocked;
map(11,14) = blocked;
map(11,15) = blocked;

map

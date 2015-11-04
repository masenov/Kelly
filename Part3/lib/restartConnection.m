function s = restartConnection()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
delete(instrfindall)
s = openConnection()

end


function [Am] = avfgf4(A)
%AVFGF4 Summary of this function goes here
%   Detailed explanation goes here
B=carreevoisins(A);
C=moyfgf4(B);
Am=C;
end


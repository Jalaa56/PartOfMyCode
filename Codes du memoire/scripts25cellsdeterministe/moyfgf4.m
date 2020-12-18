function [f4] = moyfgf4(m)
%MOYFGF4 Summary of this function goes here
%   Detailed explanation goes here

L=length(m(:,1));
C=length(m(1,:));
f4=zeros(L,1);

for i=1:L
    f4(i,1)=sum(m(i,:));
end
f4=f4./C;
end


function [x, y] = anglestopoints(theta, L,N)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes 

%theta row vecor of angles
%L     row vector of rod lengths
%N     number of rods

x=zeros(1,N+2);
y=zeros(1,N+2);

if(length(theta) ~= length(L))
    error('Not same number of angles and lengths')
end


for i=1:N
    x(1,i+1)=x(1,i)-L(1,i)*cos(theta(1,1:i)*ones(i,1));
    y(1,i+1)=y(1,i)+L(1,i)*sin(theta(1,1:i)*ones(i,1));
end

end


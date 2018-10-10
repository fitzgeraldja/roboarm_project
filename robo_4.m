%% Matlab code for roboarm project
clear all

sets = [-0.07420, 0.07420, -0.04497, -0.00179;...
-0.07420, 0.02742, 0.02853,	-0.07487;...
-0.02412,-0.16026, 0.27843, -0.27794;...
-0.71895,0.71895, -0.52670, -0.15747];

sol=cell(1,4);
    
for k=1:4
   
    f = @(x) [cos(cumsum(x));...
        sin(cumsum(x));...
        cos(cumsum(x+sets(k,:)));...
        sin(cumsum(x+sets(k,:)))]*ones(4,1)...
        + [1,0,1,0]';
    x0vec=[2*pi/5, 2*pi/5, 2*pi/5, 2*pi/5];
    X=fsolve(f,x0vec);
    sol{1,k}=X;
end

hold on
for i=1:4
    [p1,p2]=anglestopoints(sol{1,i},ones(1,4),4);
    plot(p1,p2)
end

[perf1,perf2]=anglestopoints(ones(1,4)*(2*pi/5),ones(1,4),4);
plot(perf1,perf2)

    
hold off



% %take x and y and plot them
% plot(x,y)


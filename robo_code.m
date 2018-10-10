%% Matlab code for roboarm project
clear all

sets = [-0.11103, 0, 0.01771, 0, 0.04914, -0.16067;...
        -0.11103, 0, 0.01771, 0, -1.00913, -4.32732;...
        0.24454, -0.25257, -0.04068, 0.21859, -0.04901, -0.16444;...
        0.18775, 0, 0.08585, 0.17585, -0.65540, 0.81561;...
        -1.51143, -2.95135, -1.82041, 0.59467, -0.48641, -0.72453;...
        -0.33064, 0, -0.08585, -0.17585, 0.67701, -0.97379;
        -1.01576, -4.57758, -0.93960, -0.73579, -4.50282, -1.14730];

sol=cell(1,6);
    
for k=1:6
   
    f = @(x) [cos(cumsum(x));...
        sin(cumsum(x));...
        cos(cumsum(x+sets(k,:)));...
        sin(cumsum(x+sets(k,:)));...
        cos(cumsum(x+sets(k+1,:)));...
        sin(cumsum(x+sets(k+1,:)))]*ones(6,1)...
        + [1,0,1,0,1,0]';
    x0vec=[2*pi/7, 2*pi/7, 2*pi/7, 2*pi/7, 2*pi/7, (2*pi/7)];
    X=fsolve(f,x0vec);
    sol{1,k}=X;
end

hold on
for i=1:6
    [p1,p2]=anglestopoints(sol{1,i},ones(1,6),6);
    plot(p1,p2)
end

[perf1,perf2]=anglestopoints(ones(1,6)*(2*pi/7),ones(1,6),6);
plot(perf1,perf2)
    
hold off



% %take x and y and plot them
% plot(x,y)


clc; clear; close all;

tspan = 5;
conc_init= [98.04/30 0.98/30 0.98/30];

for i =1:50
    temp = (0.02*i*tspan);
    [t, C] = ode45(@batch_reactor,[0 temp],conc_init);
    
    figure(1)
    ca=C(:,1);
    cb=C(:,2);
    cc=C(:,3);
    subplot(311)
    plot(t,C(:,1))
    xlabel('time'), ylabel('C eb');
    subplot(312)
    plot(t,C(:,2))
    xlabel('time'), ylabel('C b');
    subplot(313)
    plot(t,C(:,3))
    xlabel('time'), ylabel('C h');
    
    figure(2)
    
    X = 1 -(C(:,1)/conc_init(1));
    S = C(:,2)/(conc_init(1)*X);
    plot(X,S)
    xlabel('Conversion'), ylabel('Selectivity')
    
end



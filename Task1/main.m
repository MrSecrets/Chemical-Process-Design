clc; clear; close all;

tspan = 10000;
% conc_init= [98.04 0.98 0.98 0] * 300*1000/13;
conc_init = [0.0000 0.0000 0.0000]

% for i =1:50
%     temp = (0.02*i*tspan);
    [t, C] = ode45(@batch_reactor,[0 tspan],conc_init);
    
    figure(1)
    ca=C(:,1);
    cb=C(:,2);
    cc=C(:,3);
    subplot(311)
    plot(t,C(:,1))
    xlabel('time'), ylabel('Styrene');
    subplot(312)
    plot(t,C(:,2))
    xlabel('time'), ylabel('Benzene');
    subplot(313)
    plot(t,C(:,3))
    xlabel('time'), ylabel('Toulene');
%     subplot(414)
%     plot(t, C(:,4))
%     xlabel('time'), ylabel('p s');
%     
%     figure(2)
%     
%     X = 1 -(C(:,1)/conc_init(1));
%     S = C(:,2)/(conc_init(1)*X);
%     plot(X,S)
%     xlabel('Conversion'), ylabel('Selectivity')
%     
% end

selectivity_styrene = C(:,1)./(C(:,1) + C(:,2).*2 + C(:,3));
total_conversion = C(:,1) + C(:,2) + C(:,3);

selectivity_benzene = C(:,2)./(C(:,1).*2 + C(:,2) + C(:,3));

selectivity_toluene = C(:,3)./(C(:,1).*2 + C(:,2).*2);

figure
coefficients1 = polyfit(total_conversion, selectivity_styrene, 2);
numFitPoints = 1000; % Enough to make the plot look continuous.
xFit = linspace(min(total_conversion), max(total_conversion), numFitPoints);
yFit = polyval(coefficients1 , xFit);
hold on
plot(xFit, yFit)
hold on
plot(total_conversion, selectivity_styrene)
title('Selectivity - Styrene vs Conversion - Ethylbenzene ')
xlabel('Conversion Ethylbenzene')
ylabel('Selectivity  Styrene')

figure
coefficients2 = polyfit(total_conversion, selectivity_benzene, 2);
numFitPoints = 1000; % Enough to make the plot look continuous.
xFit = linspace(min(total_conversion), max(total_conversion), numFitPoints);
yFit = polyval(coefficients2 , xFit);
hold on
plot(xFit, yFit)
hold on
plot(total_conversion, selectivity_benzene)
title('Selectivity - Benzene vs Conversion - Ethylbenzene ')
xlabel('Conversion Ethylbenzene ')
ylabel('Selectivity Benzene')

figure
coefficients3 = polyfit(total_conversion, selectivity_toluene, 2);
numFitPoints = 1000; % Enough to make the plot look continuous.
xFit = linspace(min(total_conversion), max(total_conversion), numFitPoints);
yFit = polyval(coefficients3 , xFit);
hold on
plot(xFit, yFit)
hold on
plot(total_conversion, selectivity_toluene)
title('Selectivity - Toluene vs Conversion - Ethylbenzene ')
xlabel('Conversion Ethylbenzene ')
ylabel('Selectivity Toluene')

%title('Selectivity vs Conversion')
%xlabel('Ethlbenzene conversion')
%ylabel('Selectivity')
%legend('Styrene', 'Benzene', 'Toluene')


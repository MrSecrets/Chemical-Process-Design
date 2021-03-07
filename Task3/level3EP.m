clc
clear

conv = [];
EP12 = [];
EP = [];

as = [0.9991, -0.61 3.13 -6.83 3.78];
ab = [0.0006 0.086 -0.158 0.267 0];
at = [0.0006 0.415 -2.48 5.84 -3.437];


for i = 6:1:12
    EP3 = [];
    conv = [];
    for x = 0.01:0.01:0.999

    ss = as(1) +as(2)*x + as(3)*x*x + as(4)*x*x*x+ as(5)*x*x*x*x;
    sb = ab(1) +ab(2)*x + ab(3)*x*x + ab(4)*x*x*x+ ab(5)*x*x*x*x;
    st = at(1) +at(2)*x + at(3)*x*x + at(4)*x*x*x+ at(5)*x*x*x*x;
    
    Peb = 120/ss;
    Feed = Peb*1.02;
    PS = 120;
    PB = Peb*sb + 0.01*Peb;
    PE = Peb*sb;
    PT = Peb*st + 0.01*Peb;
    PM = Peb*st;
    PH = PS - PM;
    
    M = (Peb/x)/(i*Feed);
    Rg = Feed*(1-x)/x;
    CA_cost = (M/x)^0.82;
    CO_cost = M/x;
%     CA_cost = Rg^0.82;
%     CO_cost = Rg;
    RA_cost = (M/(x*1))^0.33 * (log(1/(1-x)))^0.33;


    EP2 = 23*PS + 9*PB + 8.5*PT + 4*(0.123*PH + 0.383*PM + 0.596*PE) - Feed*16 -i*Feed*0.07 ;
    EP3i = EP2-CA_cost-CO_cost-RA_cost;
%     EP3i = EP2;
    EP3 = [EP3; EP3i];
    conv = [conv; x];
    
    end
    
    plot(conv, EP3)
    Legend{i-5}=strcat('Steam ratio= ', num2str(i),':1');
    hold on
    
end 

legend(Legend,'Location','southeast')
title('Economic Potential Level 3 vs Conversion - Ethylbenzene')
xlabel('Conversion Ethylbenzene')
ylabel('Economic Potential Level 3: $')

 

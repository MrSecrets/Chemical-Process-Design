
conv = [];
EP12 = [];
EP = [];

as = [0.9991, -0.61 3.13 -6.83 3.78];
ab = [0.0006 0.086 -0.158 0.267 0];
at = [0.0006 0.415 -2.48 5.84 -3.437];

for x = 0.01:0.01:1

ss = as(1) +as(2)*x + as(3)*x*x + as(4)*x*x*x+ as(5)*x*x*x*x;
sb = ab(1) +ab(2)*x + ab(3)*x*x + ab(4)*x*x*x+ ab(5)*x*x*x*x;
st = at(1) +at(2)*x + at(3)*x*x + at(4)*x*x*x+ at(5)*x*x*x*x;


Peb = 120/ss;
PS = 120;
PB = Peb*sb + 0.01*Peb;
PE = Peb*sb;
PT = Peb*st + 0.01*Peb;
PM = Peb*st;
PH = PS - PM;
Feed = Peb*1.02;


EPk = 23*PS + 9*PB + 8.5*PT + 4*(0.123*PH + 0.383*PM + 0.596*PE) - 100*16 ;
EP12 = [EP12; EPk-1200*0.07];
EP2 = [EP2; EPk];
conv = [conv; x];

end 

figure
plot(conv, EP12)
title('Economic Potential vs Conversion - Ethylbenzene for Steam ratio of 12:1')
xlabel('Conversion Ethylbenzene')
ylabel('Economic Potential: $')

figure
Legend=cell(7,1);
for i = 6:1:12 
    plot(conv, EP2 - i*100*0.07)
    Legend{i-5}=strcat('Steam ratio= ', num2str(i),':1');
    hold on
end
legend(Legend,'Location','northeast')
title('Economic Potential vs Conversion - Ethylbenzene')
xlabel('Conversion Ethylbenzene')
ylabel('Economic Potential: $')




conv = [];
EP = [];

for x = 0.01:0.01:1

as = [0.999, -0.6106 3.133 -6.8311 3.7792];
ab = [0.0006113 0.0826248 -0.1581804 0.26738 0];
at = [0.0006455 0.4154 -2.484903 5.846189 -3.437729];

ss = as(1) +as(2)*x + as(3)*x*x + as(4)*x*x*x+ as(5)*x*x*x*x;
sb = ab(1) +ab(2)*x + ab(3)*x*x + ab(4)*x*x*x+ ab(5)*x*x*x*x;
st = at(1) +at(2)*x + at(3)*x*x + at(4)*x*x*x+ at(5)*x*x*x*x;

PS =98.04*ss;
PB = 98.04*sb + 0.96;
PE = 98.04*sb;
PT = 98.04*st + 0.96;
PM = 98.04*st;
PH = PS - PM;

EPk = 23*PS + 9*PB + 8.5*PT + 4*(0.123*PH + 0.383*PM + 0.596*PE) - 100*16 -1200*0.07;
EP = [EP; EPk/1000];
conv = [conv; x];

end 
plot(conv, EP)
title('Economic Potential vs Conversion - Ethylbenzene ')
xlabel('Conversion Ethylbenzene')
ylabel('Economic Potential: $/mol')
hold on


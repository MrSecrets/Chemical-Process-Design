function dCdt = batch_reactor(t,C)

Ceb = C(1);
Cb = C(2);
Ch = C(3);
Cs = C(4);

R = 8.314;
T = 560+273.15;
k = 6923;

dCebdt = -0.044*exp(-90981/(R*T))*Ceb*k...
    +6*10^(-8)*exp(-61127/(R*T))*Cs*Ch*k*k...
    -27100*exp(-207989/(R*T))*Ceb*k...
    -6.484*10^(-7)*exp(-91515/(R*T))*Ceb*Ch*k*k ;

dCbdt = 27100*exp(-207989/(R*T))*Ceb*k;

dChdt = 0.044*exp(-90981/(R*T))*Ceb*k...
    -6*10^(-8)*exp(-61127/(R*T))*Cs*Ch*k*k...
    -6.484*10^(-7)*exp(-91515/(R*T))*Ceb*Ch*k*k ;

dCsdt = 0.44*exp(-90981/(R*T))*Ceb*k...
    -6*10^(-8)*exp(-61127/(R*T))*Cs*Ch*k*k;

dCdt = [dCebdt; dCbdt; dChdt; dCsdt];
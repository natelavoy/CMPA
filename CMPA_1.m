Is = 0.01e-12;
Ib = 0.1e-12;
Vb = 1.3;
Gp = 0.1;
V = linspace(-1.95,0.7,200);
Icalc = @(V) Is*(exp(((-1.2*0.025)*V)-1)) + Gp*V + Ib*(exp(((-1.2*0.025)*(V+Vb))-1));
I = Icalc(V);
noise = (rand(1,200)*(0.2+0.2))-0.2;
I_noise = I.*(1+noise);
p4 = polyfit(V,I,4);
p_noise4 = polyfit(V,I_noise,4);
I_p4 = polyval(p4,V);
I_p4_noise = polyval(p_noise4,V);
p8 = polyfit(V,I,8);
p_noise8 = polyfit(V,I_noise,8);
I_p8 = polyval(p8,V);
I_p8_noise = polyval(p_noise8,V);


figure(1)
plot(V,I,V,I_p4,V,I_p8)
legend('I','I w/ 4th','I w/ 8th');
figure(2)
plot(V,I_noise,V,I_p4_noise,V,I_p8_noise)
legend('I noise','I noise w/ 4th','I noise w/ 8th');

figure(3)
semilogy(V,I,V,I_p4,V,I_p8)
legend('I','I w/ 4th','I w/ 8th');
figure(4)
semilogy(V,I_noise,V,I_p4_noise,V,I_p8_noise)
legend('I noise','I noise w/ 4th','I noise w/ 8th');
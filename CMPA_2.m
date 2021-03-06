Is = 0.01e-12;
Ib = 0.1e-12;
Vb = 1.3;
Gp = 0.1;
V = linspace(-1.95,0.7,200);
Icalc = @(V) Is*(exp(((-1.2*0.025)*V)-1)) + Gp*V + Ib*(exp(((-1.2*0.025)*(V+Vb))-1));
I = Icalc(V);
noise = (rand(1,200)*(0.2+0.2))-0.2;
I = I.*(1+noise);

f2 = fittype('A.*(exp(1.2*x/25e-3)-1) + 0.1.*x - C*(exp(1.2*(-(x+1.3))/25e-3)-1)');
f1 = fittype('A.*(exp(1.2*x/25e-3)-1) + B.*x - C*(exp(1.2*(-(x+1.3))/25e-3)-1)');
f0 = fittype('A.*(exp(1.2*x/25e-3)-1) + B.*x - C*(exp(1.2*(-(x+D))/25e-3)-1)');

ff2 = fit(V',I',f2);
ff1 = fit(V',I',f1);
ff0 = fit(V',I',f0);

If2 = ff2(V);
If1 = ff1(V);
If0 = ff0(V);
figure(1)
plot(V,I,V,If2',V,If1',V,If0');
ylim([min(I) max(I)])
xlim([-1.95, 0.7])
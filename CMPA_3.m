Is = 0.01e-12;
Ib = 0.1e-12;
Vb = 1.3;
Gp = 0.1;
V = linspace(-1.95,0.7,200);
Icalc = @(V) Is*(exp(((-1.2*0.025)*V)-1)) + Gp*V + Ib*(exp(((-1.2*0.025)*(V+Vb))-1));
I = Icalc(V);
noise = (rand(1,200)*(0.2+0.2))-0.2;
I = I.*(1+noise);

inputs = V;
targets = I;
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
[net,tr] = train(net,inputs,targets);
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs);
view(net);
Inn = outputs;
figure(1);
semilogy(V,I,V,outputs')
legend('I','net');
 clear all;
T = [-1 -1 1; 1 -1 1]';
net = newhop(T);              %����һ��Hopfield����
Ai = T;
[Y,Pf,Af] = sim(net,2,[],Ai);
disp('��ʾHopfield������棺')
Y
disp('Hopfield����Ȩֵ��')
W= net.LW{1,1}
disp('Hopfield������ֵ��')
b = net.b{1,1}


clear all;
p = [-1 -1 2 2; 0 5 0 5];
t = [-1 -1 1 1];
net = newff(p,t,3,{},'traingdm');        %����BP����
%��BP����ѵ��������������
net.trainParam.lr = 0.05;
net.trainParam.mc = 0.9;
y = sim(net,p)                           %��������з���

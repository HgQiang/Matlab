clear all;
P = [1 2 3 4 5 6 7];
Tc = [1 2 3 2 2 3 1];
T = ind2vec(Tc)               %����������ת��Ϊ������
net = newpnn(P,T);
Y = sim(net,P)
Yc = vec2ind(Y)               %��������ת��Ϊ��������

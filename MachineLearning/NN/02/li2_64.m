 clear all;
P = [-3 -2 -2 0 0 0 0 2 2 3; 0 1 -1 2 1 -1 -2 1 -1 0];        %��������
Tc = [1 1 1 2 2 2 2 1 1 1];                                   %Ŀ������
T = ind2vec(Tc);                                             
targets = full(T)                                   %���������ʾ
net = newlvq(P,4,[.6 .4]);                          %����LVQ����
disp('LVQ�����һ��Ȩֵ��')
net.IW{1,1}
disp('LVQ����ڶ���Ȩֵ��')
net.LW{2,1}
disp('LVQ�������ֵ��')
Y = sim(net,P)                 %�������

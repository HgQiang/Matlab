 clear all;
%��������������Ŀ������
P=[0 1 0 1;1 0 1 0;0 0 1 1;1 1 0 0]';
T=[1 1 0 0;0 0 1 1];
%����LVQ����
net=newlvq(minmax(P),4,[0.5 0.5],0.01,'learnlv1');
%ѵ��LVQ����
net=train(net,P,T);
%�������
y=sim(net,P)

 clear all;
P=[-0.5 -0.6 0.7;0.8 0 0.1];
T=[1 1 0];
net=newp([-1 1;-1 1],1);              %������֪������
%���ػ��ߵľ������һ�λ��Ʒ�����ʱ���ɵ�ɾ��
handle=plotpc(net.iw{1},net.b{1});
%����ѵ���������Ϊ10��
net.trainParam.epochs=10;
net=train(net,P,T);
Q=[0.6 0.9 -0.1;-0.1 -0.5 0.5];
Y=sim(net,Q);
%���Ʒ�����
plotpv(Q,Y);
plotpc(net.iw{1},net.b{1})

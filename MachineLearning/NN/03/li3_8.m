clear all;
P=[2 1 -2 -1;2 -2 2 1];
T=[0 1 0 1];
%����train����ѵ�����磬�������ʼȨֵ����ֵȱʡΪ0������ѵ������Ϊ0.1
net=newlin([-2 2;-2 2],1);
net.trainParam.goal=0.1;
[net,tr]=train(net,P,T);
disp('����ѵ�����Ȩֵ��')
w=net.iw{1,1}
disp('����ѵ�������ֵ��')
b=net.b{1}
disp('������֤��')
y=sim(net,P)
disp('��ʾ������')
err=T-sim(net,P)

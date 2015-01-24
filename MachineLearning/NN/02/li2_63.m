clear all;
T1=1:80;             %���������źż�Ŀ���ź�
X1=cos(1:20);
X2=3*cos(1:20);
t1=ones(1,20);
t2=3*ones(1,20);
P=[X1 X2 X1 X2];
t=[t1 t2 t1 t2];
X = con2seq(P);    %�������ź�ת��Ϊ�����ź�
T = con2seq(t);    
plot(T1,cat(2,X{:}),':',T1,cat(2,T{:}),'-');
[R,N]=size(X);
[S2,N]=size(T);
S1=10;         
net=newelm(X,T,[S1 S2],{'tansig','purelin'},'trainlm');
xlabel('t');
net.trainParam.epochs=5000;          %ѵ��ʱ��
[net,tr]=train(net,X,T);             %ѵ������
y=sim(net,X);                       %�������
hold on;
plot(T1,cat(2,y{:}),'o',T1,cat(2,T{:}),'p');
legend('�����ź�����','Ŀ���ź�����','����ź�����','Ŀ���ź�����');

 clear all;
X=[1 2;-1 2;2 3];        %����ѵ����
T=[1 2;2 1];             %Ŀ�꼯
net=newff(X,T,5);        %����BP����
net=train(net,X,T);      %����ѵ��
X1=X; 
disp('�������������ݣ�')
y=sim(net,X1)

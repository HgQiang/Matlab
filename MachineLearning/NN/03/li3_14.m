 clear all;
%�źŵ�����
time=0:0.25:5;
X=sin(sin(time).*time*10);
plot(time,X)                %Ч����ͼ3-38��ʾ
xlabel('ʱ��');
ylabel('�����ź�');
%���������������ź�X��ǰֵ��ǰ���ε�ֵ
Q=size(X,2);
P=zeros(3,Q);
P(1,1:Q)=X(1,1:Q);
P(2,2:Q)=X(1,1:(Q-1));
P(3,3:Q)=X(1,1:(Q-2));
%���ϵͳ����ɲ⣬��ϵͳ����Ĳ��������������õ�
T=filter([1 0.5 -1.5],1,X);
plot(time,T)                  %Ч����ͼ3-39��ʾ
xlabel('ʱ��');
ylabel('����ź�');
%������������
net=newlind(P,T);
%�������
a=sim(net,P);
plot(time,a,time,T,'rp')                 %Ч����ͼ3-40��ʾ
xlabel('ʱ��');
ylabel('��� - Ŀ��');
legend('�������','ʵ�����');

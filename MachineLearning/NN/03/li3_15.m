>> clear all;
%�źŵ�����
time1=0:0.05:4;
time2=4.05:0.05:6;
time=[time1 time2];
X=sin(sin(time).*time*10);
plot(time,X)                   %Ч����ͼ3-42��ʾ
xlabel('ʱ��');
ylabel('�����ź�');
%ϵͳ����ź�
figure;
steps1=length(time1);
[T1,state]=filter([1 -0.5],1,X(1:steps1));
steps2=length(time2);
T2=filter([0.9 -0.6],1,X((1:steps2)+steps1),state);
T=[T1 T2];
plot(time,T);                    %Ч����ͼ3-43��ʾ
xlabel('ʱ��');
ylabel('����ź�');
%�������ź�X��ǰֵ��ǰһʱ�̵�ֵ��Ϊ����������������� 
T=con2seq(T);
P=con2seq(X);
%����һ���������磬���������ӳ����룬�趨ѧϰ����Ϊ0.5
lr=0.5;
delays=[0 1];
net=newlin(minmax(cat(2,P{:})),1,delays,lr);
%����adapt�����������������ѵ��
[net,a,e]=adapt(net,P,T);
%��������в��ԣ������������a��ϵͳʵ�����T����
plot(time,cat(2,a{:}),time,cat(2,T{:}),'--')           %Ч����ͼ3-44��ʾ
ylabel('ʱ��');
ylabel('��� - Ŀ��');
legend('�������','ϵͳʵ�����');
%�����������a��ϵͳʵ�����T����֮������
plot(time,cat(2,e{:}),[min(time) max(time)],[0 0],':r');       %Ч����ͼ3-45��ʾ
AXIS([0 5 -2 2])
xlabel('ʱ��');
ylabel('���');

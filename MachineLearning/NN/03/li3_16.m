clear all;
% ��������������Ŀ������
time=0.5:0.5:20;          %ʱ�����
y=(rand(1,40)-0.5)*4;      %������������ź�
p=con2seq(y);            %�������������ת��Ϊ��������
delays=[1 2];             %����ADALINE��Ԫ�����ӳ���
t=p;                     %����ADALINE��Ԫ����Ŀ����
% ��������������
net=newlin(minmax(y),1,delays,0.0005);
% ���������������Ӧ����(ѵ��)
net.adaptParam.passes=70;
[net,a,output]=adapt(net,p,t);  %����ź�outputΪ������������е����
% ������������ź�\����źŵĲ���
hold on;
subplot(3,1,1);plot(time,y,'r*-'); %����ź�outputΪ������������е����
xlabel('t','position',[20.5,-1.8]);
ylabel('��������ź�s(t)');
axis([0 20 -2 2]);
subplot(3,1,2);
output=seq2con(output);
plot(time,output{1},'ko-');     %����Ԥ������źŵĲ���
xlabel('t','position',[20.5,-1.8]);
ylabel('Ԥ������ź�y(t)');
axis([0 20 -2 2]);
subplot(3,1,3);
e=output{1}-y;
plot(time,e,'k-');             %�����������
xlabel('t','position',[20.5,-1.8]);
ylabel('�������e(t)');
axis([0 20 -2 2]);
hold off;

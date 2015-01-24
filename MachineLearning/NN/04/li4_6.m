clear all;
%��������������Ŀ������
Time1=0:0.05:1.5*pi;
T1=Time1/(1.5*pi)-0.5;
Time2=1.5*pi:0.05:3*pi;
T2=1.5-Time2/(1.5*pi);
Time=[Time1 Time2];
%���ǲ���Ŀ��������
T=2*[T1 T2];
%������������������
p=(1+T).*cos(20*Time);
%����Elman����
net=newelm(minmax(p),[20 1],{'tansig','purelin'},'traingdx');
%ѵ��Elman����
Pq=con2seq(p);    %��������������ת��Ϊ��������
Tq=con2seq(T);    %��Ŀ����������ת��ΪĿ������
plot(Time,p,Time,1+T,'r--');
pause;
net.trainParam.epochs=500;
[net,tr]=train(net,Pq, Tq);
%ѡ�������ǲ������Ҳ��;��β�3�ֵ����ź��γɵ��ѵ�������Ϊ�����źţ�
%������Ƶ�Elman��������з��棬�����������£�
%�����ǲ����ƽ��з���
Time1=0:0.05:2*pi;
T1=Time1/(2*pi)-0.5;
Time2=2*pi:0.05:4*pi;
T2=1.5-Time2/(2*pi);
Time=[Time1 Time2];
%���ǲ���Ŀ��������
T=[T1 T2];
%������������������
p=(1+T).*cos(20*Time);  %�γ����ǲ����Ƶ��ѵ����ź�
subplot(321);
plot(Time,p);
Pq=con2seq(p);
A=sim(net,Pq);
Y=seq2con(A);
subplot(322);
plot(Time,Y{1},Time,T,'r--');
%�����Ҳ����ƽ��з���
T=0.5*sin(Time);
p=(1+T).*cos(20*Time);
subplot(323);
plot(Time,p);
Pq=con2seq(p);
A=sim(net,Pq);
Y=seq2con(A);
subplot(324);
plot(Time,Y{1},Time,T,'r--');
%�Ծ��β����ƽ��з���
T=0.5*sign(sin(Time));
p=(1+T).*cos(20*Time);
subplot(325);
plot(Time,p);
Pq=con2seq(p);
A=sim(net,Pq);
Y=seq2con(A);
subplot(326);
plot(Time,Y{1},Time,T,'r--');

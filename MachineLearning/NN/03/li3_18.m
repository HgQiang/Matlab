 clear all;
%����ȷ��������val 
P=[-1:0.05:1];                                  %ѵ����������������
t0=sin(3*pi*P);                                 %����ϵ����Һ���
t=sin(3*pi*P)+0.15*randn(size(P));              %ѵ��������Ŀ������
val.P=[-0.975:0.05:0.975];                      %ȷ����������������
val.T=sin(3*pi*val.P)+0.15*randn(size(val.P));  %ȷ��������Ŀ������
%��������
net=newff([-1 1],[20 1],{'tansig','purelin'},'traingdx');
net.trainParam.show=25;
net.trainParam.epochs=300;
net=init(net);                                  %�����ʼ��
%����ѵ��
[net,tr]=train(net,P,t,[],[],val);
save li317 net;                                 %�洢ѵ����


 clear all;
P=[-1:0.05:1];                                  %ѵ����������������
t0=sin(3*pi*P);                                 %����ϵ����Һ���
t=sin(3*pi*P)+0.15*randn(size(P));              %ѵ��������Ŀ������
load li317 net;                                 %��������
r=sim(net,P);
hold on;
plot(P,t0,'r-.',P,t,'g+',P,r,'k'); 
legend('����ϵ���������','�������������','�����������');


 net.trainParam.epochs=2000;
net=train(net,p,T');
clear all;
x1=rands(400)*pi;
x2=rands(300)*pi;
x3=zeros(100,1)*pi;
p1=x1;
p2=[x2;x3];
p=[p1 p2]';
delta=0.05;
T=p2+delta*(10*sin(p1)-2*p2);
net=newff(minmax(p),[9,1],{'tansig','purelin'});         %����������
net.trainParam.epochs=2000;
net=train(net,p,T');                 %Ч����ͼ6-24��ʾ
%����x2=0�Ĳ�������������ķ������
a=0:0.1:3.9;
b=zeros(1,40);
p_test=[a;b];
y=sim(net,p_test);                    %��������з���
nf=0.5*sin(a);
plot(a,y);
hold on;
plot(a,nf,'rp');
hold off;
figure;
%����x1=pi/2�Ĳ�������������ķ������
a=ones(1,40)*0.5*pi;
b=-10:0.5:9.5;
p_test=[a;b];
y=sim(net,p_test);
nf=0.5+0.9*b;
plot(b,y);
hold on;
plot(b,nf,'rp');
hold off;

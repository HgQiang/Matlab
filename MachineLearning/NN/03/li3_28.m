clear all;
%��Ҫ�ƽ��ķ����Ժ�����Ϊ���Һ�������Ƶ�ʲ��� ���Ե���
k=1;
p=[-1:.05:1];
t=sin(k*pi*p);
%����Ƶ�ʲ���Ϊ1�����ƴ˺���������
plot(p,t,':')                  %Ч����ͼ3-66
xlabel('ʱ��');
ylabel('�����Ժ���');
 %��������
n=10;
net=newff(minmax(p),[n,1],{'tansig','purelin'},'trainlm');
y1=sim(net,p);          %�������
figure;
plot(p,t,'r:',p,y1,'-')               %Ч����ͼ3-67��ʾ    
xlabel('ʱ��');
ylabel('�������--  ԭ����-')
legend('ԭ��������','BP�����������')
%����ѵ���������ü�ѵ��
net.trainParam.epochs=50;
net.trainParam.goal=0.01;
net=train(net,p,t);                %Ч����ͼ3-68��ʾ
 %�������
y2=sim(net,p);
figure;
plot(p,t,'-',p,y1,'--',p,y2,'+')           %Ч����ͼ3-69��ʾ
xlabel('ʱ��');
ylabel('�������')
legend('ԭ����','BP�����������','ѵ��������');

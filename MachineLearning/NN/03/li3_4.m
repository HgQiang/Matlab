 clear all;
%�����������������
P=[-0.5 -0.5 +0.3 -0.1 -40;-0.5 +0.5 -0.5 +1.0 50];
T=[1 1 0 0 1];
plotpv(P,T);            %Ч����ͼ3-16��ʾ
%���������ͳ�ʼ����
net=newp([-40 1;-1 50],1);
hold on
linehandle=plotpc(net.iw{1},net.b{1});    
%Ӧ�ó�ʼ�����޷����࣬����޷�����������
%��������
E=1;
net.adaptParam.passes=3;
while (sse(E))
    [net,Y,E]=adapt(net,P,T);
    linehandle=plotpc(net.IW{1},net.b{1},linehandle);  %Ч����ͼ3-17��ʾ
    drawnow;
end
%������һ���µ�����������֤���������
p=[0.7;1.2];
a=sim(net,p);
plotpv(P,T);
plotpc(net.IW{1},net.b{1});           %Ч����ͼ3-18��ʾ
hold off;
>> %Ϊ��ʹͼ���������޸�����ֵ�Ŵ󲿷�ͼ��
axis([-2 2 -2 2]);                    %Ч����ͼ3-19��ʾ

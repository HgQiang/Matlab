clear all;
%��ά�������� ���Լ�����Ӧ��������� ��
P=[-3 -2 -2 0 0 0 0 +2 +2 +3;0 +1 -1 +2 +1 -1 -2 +1 -1 0];
C=[1 1 1 2 2 2 2 1 1 1];
T=ind2vec(C);          %��Cת����������ʽT
%���Ƴ��������ݵ�
i=1;
cla
for i=1:10
    if C(i)==1
        plot(P(1,i),P(2,i),'+')          %Ч����ͼ5-41��ʾ
        hold on
    else
        plot(P(1,i),P(2,i),'o')
        hold on
    end
end
xlabel('P(1)');
ylabel('P(2)');
%��newlwq��������һ��LVQ���硣
net=newlvq(minmax(P),4,[.6 .4],0.1);
%���Ƴ�ʼ���羺����Ԫ��Ȩֵ����
hold on
W1=net.iw{1};
plot(W1(1,1),W1(1,2),'r*');          %Ч����ͼ5-42��ʾ
xlabel('P(1),W(1)');
ylabel('P(2),W(2)');
%��������ѵ��������Ӧ��train������ǰ�����������������ѵ����
net.trainParam.epochs=150;
net.trainParam.show=Inf;
net=train(net,P,T);              %Ч����ͼ5-43��ʾ
%������������ѵ���������Ȩֵ����������һ��ͼ��
cla;
plotvec(P,C);
hold on;
plotvec(net.IW{1}',vec2ind(net.LW{2}),'o');       %Ч����ͼ5-44��ʾ
xlabel('P(1),W(1)');
ylabel('P(2),W(2)')
p=[0.2;1];
a=vec2ind(sim(net,p))

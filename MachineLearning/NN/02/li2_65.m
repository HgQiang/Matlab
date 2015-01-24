 clear all;
P = [-3 -2 -2  0  0  0  0 +2 +2 +3;...   %��ʸ��
      0 +1 -1 +2 +1 -1 -2 +1 -1  0];
C = [1 1 1 2 2 2 2 1 1 1];              %��ɫ��ʸ��
T = ind2vec(C);
colormap(hsv);
plotvec(P,C);
net = newlvq(minmax(P),4,[.6 .4],0.1);   %����LVQ����
hold on
W1 = net.IW{1};                 %��ʼȨֵ
plot(W1(1,1),W1(1,2),'ow')         %��ʼȨֵ�ֲ�ͼ
title('Input/Weight Vectors');
xlabel('P(1), W(1)');
ylabel('P(2), W(3)');
net=train(net,P,T);
figure;
plotvec(P,C);
hold on;
plotvec(net.IW{1}',vec2ind(net.LW{2}),'o');
p = [0.2; 1];
a = vec2ind(net(p))


 clear all;
pi=3.1416;
angles=0:0.5*pi/90:0.5*pi;
P=[sin(angles);cos(angles)];
plot(P(1,:),P(2,:),'r.');          %�����ͼ������ʸ����ͼ5-15��ʾ
axis equal;
[R,Q]=size(P);
S=20;
W0=rands(S,R)*0.1;                %�������Ȩֵ
hold on;
plotsom(W0')               %����Ȩֵ�㼰��������Ȩֵ������ߣ���ͼ5-16��ʾ
hold off
net=newsom(minmax(P),S);          %����SOFM����
net.trainParam.epochs=400;        %���ѵ������
net.trainParam.show=5;
net=train(net,P);                 %ѵ�����磬Ч����ͼ5-17��ʾ
figure;
plot(P(1,:),P(2,:),'.g','markersize',20);  %����㣬Ч����ͼ5-18��ʾ
hold on;
%��ѵ�����Ȩֵ�㼰������Ȩֵ�������
plotsom(net.iw{1,1},net.layers{1}.distances);


 clear all;
%����Ӧ��rands�����������500���������ݵ㣬�γ���������P
P=rands(2,500);
plot(P(1,:),P(2,:),'rp')           %Ч����ͼ5-19��ʾ
axis([-1 1 -1 1]);

xlabel('P(1)');
ylabel('P(2)')
%���һ����άSOFM���磬����Ԫ����30����Ԫ�������������������
net=newsom([0 1;0 1],[5 6]);        %����SOFM����
cla
plotsom(net.IW{1,1},net.layers{1}.distances)      %���Ƴ�ʼȨֵͼ����ͼ5-20��ʾ
axis([0 1 0 1]);
xlabel('w(i,1)');
ylabel('w(i,2)');
net.trainParam.epochs=1;
net=train(net,P);             %���������ѵ����Ч����ͼ5-21��ʾ
%�������
cla
plotsom(net.iw{1,1},net.layers{1}.distances)      %Ч����ͼ5-22��ʾ
axis([-1 1 -1 1]);
xlabel('w(i,1)');
ylabel('w(i,2)');
%��������з���
p=[0.5;0.3];
a=sim(net,p)

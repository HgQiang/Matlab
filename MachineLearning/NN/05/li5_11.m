 clear all;
P=[0.5512	0.5123	0.5069	0.5001	0.6012	0.5298	0.5000	0.4964 ...
	0.5215	0.5111;  0.4488	0.4877	0.4931	0.4999	0.3988	0.4702...
	0.5000	0.5036	0.4785	0.4889];
plot(P(1,:),P(2,:),'rp');           
hold on;
%����12����Ԫ��SOFM�������������P���з���, ���紴��
net=newsom([0 1;0 1],[3,4]);

 w_init=net.IW{1,1};
figure;
plotsom(w_init,net.layers{1}.distances);            %Ч����ͼ5-24��ʾ
%����Ϊ100ʱ��Ȩֵ�ֲ���ͼ5-25��ʾ��
net=train(net,P);
w1=net.iw{1,1};
plotsom(w1,net.layers{1}.distances);
 net.trainParam.epochs=300;
net=init(net);
net=train(net,P);
figure;
w1=net.iw{1,1};
plotsom(w1,net.layers{1}.distances);
 net.trainParam.epochs=500;
net=init(net);
net=train(net,P);
figure;
w1=net.iw{1,1};
plotsom(w1,net.layers{1}.distances);
Y=sim(net,P)
 Yc=vec2ind(Y)
  p=[0.5;0.5];
y=sim(net,p);
y=vec2ind(y)

clear all;
X = [0 1; 0 1];   
clusters = 8;     % ��������8����������������
points = 10;      % ��ÿ����Ⱥ�����Ŀ
std_dev = 0.05;   % ÿ��Ⱥ���ı�׼ƫ��
P = nngenc(X,clusters,points,std_dev);
plot(P(1,:),P(2,:),'+r');
xlabel('p(1)');
ylabel('p(2)');
%������Ԫ��8������֯���������磬�������ʼȨֵ
net = newc([0 1;0 1],8,.1);
w = net.IW{1};
%ѵ�������磬���������ѵ������Ϊ7
net.trainParam.epochs = 7;
net=init(net);
net = train(net,P);
w = net.IW{1};
plot(P(1,:),P(2,:),'+r');
hold on;
circles = plot(w(:,1),w(:,2),'ob');
hold off;
P1=[0.5;0.8];
y=sim(net,P1)              %��������

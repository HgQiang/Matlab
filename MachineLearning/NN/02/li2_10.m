clear all; 
err_goal=0.0015;        %�������������Сֵ
max_epoch=9999;         %����ѵ����������
X=[0 1 0 1;0 1 1 0];    %��������
T=[0 1 1 1];            %Ŀ������
net=newp([0 1;0 1],1);  %������֪��������
net=init(net);          %��ʼ��
W=rand(1,2);
b=rand;
net.iw{1,1}=W;
net.b{1}=b;
for epoch=1:max_epoch
    y=sim(net,X);
    E=T-y;
    sse=mae(E);            %��������Ȩֵ�������ƽ���������
    if(sse<err_goal)
        break;
    end
    dW=learnp(W,X,[],[],[],[],E,[],[],[],[],[]);      %����������Ȩϵ����ƫֵ
    db=learnp(b,ones(1,4),[],[],[],[],E,[],[],[],[],[]);
    W=W+dW;
    b=b+db;
    net.iw{1,1}=W;
    net.b{1}=b;
end
epoch,W,y

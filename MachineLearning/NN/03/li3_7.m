 clear all;
P=[1 -1.1];
T=[0.5 1];
[R,Q]=size(P);
[S,Q]=size(T);
lr=0.4*maxlinlr(P);                    % ���ѧϰ����
net=newlin(minmax(P),S,[0],lr);        %������������
net.inputWeights{1,1}.initFcn='rands'; %��ʼ��Ȩֵ
net.biases{1}.initFcn='rands';         %��ʼ��ƫ��
net=init(net);                         %�ѳ�ʼ����Ȩֵ��ƫ�����������
disp('��ʾ��ʼ��Ȩֵ��')
w0=net.iw{1,1}
disp('��ʾ��ʼ��ƫ�')
b0=net.b{1}
net.trainParam.epochs=20;              %���ѭ������
net.trainParam.goal=0.001;             %�������
[net,tr]=train(net,P,T);               %������������Ȩֵѵ��
disp('��ʾ����ѵ�������Ȩֵ��')
w=net.iw{1,1}
disp('��ʾ����ѵ�������ƫ�')
b=net.b{1}

 net=newlind(P,T);
disp('����Ȩֵ��')
w=net.iw{1,1}
disp('����ƫ�')
b=net.b{1}
%��sim�����������Ƶ�����
a=sim(net,P)
%�����ƽ����
sse=sumsqr(T-a)


 clear all;
net = newp([0 1;-2 2],1);   %����һ��������
net.inputweights{1,1}.initFcn='rands';
net.biases{1}.initFcn='rands';
net=init(net);
%����Ȩֵ����ֵ
w=net.iw{1,1}
b=net.b{1}

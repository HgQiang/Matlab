 clear all;
net = newp([0 1;-2 2],1);   %����һ��������
disp('��ʼ��ǰȨֵΪ��')
w1=net.iw{1,1}                 %Ȩֵ
disp('��ʼ��ǰ��ֵΪ��')
b1=net.b{1}
disp('�ı�ȨֵΪ��')
net.iw{1,1}=[5,6];
w2=net.iw{1,1}
disp('�ı���ֵΪ��')
net.b{1}=7;
b2=net.b{1}
net = init(net);           %���������ʼ����ԭ����Ȩֵ����ֵ
disp('��ԭ��ȨֵΪ��')
w3=net.iw{1,1}
disp('��ԭ����ֵΪ��')
b3=net.b{1}

 clear all;
%���һ����5��Ԫƽ����������
T = [+1 +1 -1 +1; -1 +1 +1 -1; -1 -1 -1 +1; ...
      +1 +1 +1 +1; -1 -1 +1 +1];
%������粢��������в���
net = newhop(T);              %���罨��
P = {rands(5,4)};
[Y,Pf,Af] = net({4 50},{},P);     %����ѵ��
Y{end}
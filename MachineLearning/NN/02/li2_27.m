clear all;
net = newff([-10 10],[4 1],{'tansig','purelin'});    %����һ��BP����
p = [-10 -5 0 5 10];
t = [0 0 1 1 1];
disp('�������ֵ��')
y = sim(net,p)
disp('�������ֵ��')
e = t-y
disp('����������ܣ�')
perf = mse(e)

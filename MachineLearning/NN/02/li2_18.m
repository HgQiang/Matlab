clear all;
P = [1 2 -4 7; 0.1 3 10 6];
disp('������ֵ����Ϊ��')
lr1 = maxlinlr(P)
disp('����ֵ����Ϊ��')
lr2 = maxlinlr(P,'bias')

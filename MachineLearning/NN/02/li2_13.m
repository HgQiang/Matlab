 clear all;
n=-10:0.1:10;     %�Բ���Ϊ0.1����һ������
a=hardlim(n);
b=hardlims(n);
plot(n,a,'bv');
hold on;
plot(n,b,'rp');
hold off

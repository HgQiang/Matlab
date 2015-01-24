 clear all;
%���������ȶ�ƽ��㣬������ֵΪT
T = [+1 -1; -1 +1];
%�ڶ�άƽ���ڻ����������ȶ�ƽ���
plot(T(1,:),T(2,:),'mp')                %Ч����ͼ4-11��ʾ
axis([-1.1 1.1 -1.1 1.1])
xlabel('a(1)');
ylabel('a(2)');
%������磬��������ֵTҪ��
net = newhop(T);
a = {rands(2,1)};
[y,Pf,Af] = net({1 50},{},a);
%���Ƴ�ʼ����ƽ���ıƽ�����
record = [cell2mat(a) cell2mat(y)];      %Ч����ͼ4-12��ʾ
start = cell2mat(a);
hold on
plot(start(1,1),start(2,1),'bx',record(1,:),record(2,:))
%��ѡȡ5����ʼ����˵��αƽ����������5�����������ռ�ǡǡλ������������%�������е�λ����
plot(0,0,'ko');
P = [-1.0 -0.5 0.0 +0.5 +1.0;
     -1.0 -0.5 0.0 +0.5 +1.0];
color = 'rgbmy';
for i=1:5
   a = {P(:,i)};
   [y,Pf,Af] = net({1 50},{},a);
   record=[cell2mat(a) cell2mat(y)];
   start = cell2mat(a);
   plot(start(1,1),start(2,1),'kx',record(1,:),record(2,:),color(rem(i,5)+1))  %Ч����ͼ4-13
   drawnow
end

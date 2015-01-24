 clear all;
%����������������T
T = [+1 +1; -1 +1; -1 -1];
%����ά�ռ���Ƴ��������ȶ�ƽ���
axis([-1 1 -1 1 -1 1])
set(gca,'box','on'); axis manual; 
hold on;
plot3(T(1,:),T(2,:),T(3,:),'ro')           %Ч����ͼ4-14��ʾ
xlabel('a(1)');
ylabel('a(2)');
zlabel('a(3)');
view([37.5 30]);
%������粢��������в���
net = newhop(T);                 %����Hopfiled����
a = {rands(3,1)};
[y,Pf,Af] = net({1 10},{},a);   %�������
%���Ƴ���ʼ����ƽ���ıƽ�����
record = [cell2mat(a) cell2mat(y)];
start = cell2mat(a);
hold on
plot3(start(1,1),start(2,1),start(3,1),'bp',record(1,:),record(2,:),record(3,:)) %Ч����ͼ4-15
%�����ѡȡ25����ʼ����в���
color = 'rgbmy';
for i=1:25
   a = {rands(3,1)};
   [y,Pf,Af] = net({1 10},{},a);
   record=[cell2mat(a) cell2mat(y)];
   start=cell2mat(a);
   plot3(start(1,1),start(2,1),start(3,1),'kp', ...          %Ч����ͼ4-16��ʾ
      record(1,:),record(2,:),record(3,:),color(rem(i,5)+1))
end
%��ѡȡһЩ�㣬��Щ�㶼ǡǡλ������ƽ������е�λ���ϣ���������Щ������
P = [ 1.0  -1.0  -0.5  1.00  1.00  0.0; ...
      0.0   0.0   0.0  0.00  0.00 -0.0; ...
     -1.0   1.0   0.5 -1.01 -1.00  0.0];
cla
plot3(T(1,:),T(2,:),T(3,:),'ro')
color = 'rgbmy';
for i=1:6
   a = {P(:,i)};
   [y,Pf,Af] = net({1 10},{},a);
   record=[cell2mat(a) cell2mat(y)];
   start=cell2mat(a);
   plot3(start(1,1),start(2,1),start(3,1),'gp', ...            %Ч����ͼ4-17��ʾ
      record(1,:),record(2,:),record(3,:),color(rem(i,5)+1))
end

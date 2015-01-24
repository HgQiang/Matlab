%����һ���㷴������
net=newnarx([-1 1],0,1,1,{'purelin'}); %�������㡢����Ԫ������ӳ�Ϊ1�ķ�������
net.biasConnect=0;                        %ƫ��ֵΪ0
net.lw{1}=0.5;                            %�����Ȩ��Ϊ0.5
net.iw{1}=1;                              %�����Ȩ��Ϊ1
a=sim(net,P);                 %������һ�η���
c=cell2mat(a); 
stem(c)                   %���Ʋ㷴����������ͼ��Ч����ͼ4-4��ʾ
axis([0 12 -0.5 2.5]);
%�������缰����
net = newhop(T);              %���Hopfield����
[Y,Pf,Af] = net([],[],T);         %�������
%�����ѡȡ��ʼ�㣬��������з���
a = {rands(2,1)};
[y,Pf,Af] = net({20},{},a);
%���Ƴ�ʼ����ƽ���ƽ�����
record = [cell2mat(a) cell2mat(y)];
start = cell2mat(a);
hold on
plot(start(1,1),start(2,1),'bx',record(1,:),record(2,:))   %Ч����ͼ4-10��ʾ

%�����ѡȡ25����ʼ����в���
color = 'rgbmy';
for i=1:25
   a = {rands(2,1)};
   [y,Pf,Af] = net({20},{},a);
   record=[cell2mat(a) cell2mat(y)];
   start=cell2mat(a);
   plot(start(1,1),start(2,1),'kx',record(1,:),record(2,:),color(rem(i,5)+1))
end

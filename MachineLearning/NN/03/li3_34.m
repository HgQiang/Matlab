 clear all;
P=-1:0.05:1;
T=exp(-P);
plot(P,T);          %Ч����ͼ3-109��ʾ
xlabel('x');ylabel('y');
%���紴����ѵ��
figure;             %Ч����ͼ3-110��ʾ
for i=1:5
    net=newgrnn(P,T,i/10);         %GRNN���罨��
    y(i,:)=sim(net,P);             %GRNN�������
end
%��������ıƽ�Ч��
plot(P,T);
hold on;
plot(P,y(1,:),'rp');
hold on;
plot(P,y(2,:),'d');
hold on;
plot(P,y(3,:),':');
hold on;
plot(P,y(4,:),'m-.');
hold on;
plot(P,y(5,:),'g+');
hold off;
legend('spread=0.1ʱ����ƽ�','spread=0.2ʱ����ƽ�',...
'spread=0.3ʱ����ƽ�','spread=0.4ʱ����ƽ�','spread=0.5ʱ����ƽ�')
%�����������ѱƽ����
figure;plot(P,y(1,:)-T,'ro')             %Ч����ͼ3-111��ʾ

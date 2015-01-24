 clear all;     %�������������еı���
 %������άͼ��
[X,Y]=meshgrid(-8:0.1:8);
 Z=sinc(X);
 mesh(X,Y,Z);               %Ч����ͼ1-3��ʾ
 set(gcf,'color','w');   %����ͼ�δ��ڱ���Ϊ��ɫ
 
 [X,Y]=meshgrid(-10:0.3:10);
 R=sqrt(X.^2+Y.^2)+eps;
 Z=sin(R)./R;
 mesh(X,Y,Z);    

 surf(X,Y,Z,'FaceColor','interp','EdgeColor','none','FaceLighting','phong');
 daspect([5 5 1]);
 axis tight;
 view(-45,35);
 camlight left


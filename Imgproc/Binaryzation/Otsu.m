%% ���ɷ�����Ӧ��ֵ�ָ��
%�ο���ַ��http://blog.sina.com.cn/s/blog_6163bdeb0102e8po.html
% 
% I=imread('1.bmp');
% GrayIm=rgb2gray(I)'
% % GrayImΪ0-255�ĻҶ�ͼ
% [graydata, grayindex]=imhist(GrayIm);
% graydata = graydata(:)';
% mingray=find(graydata>0, 1, 'first');
% maxgray=find(graydata>0, 1, 'last');
% g = zeros(1, maxgray-mingray+1);
% for t=mingray:maxgray
% w0=sum(graydata(mingray:t))/sum(graydata(mingray:maxgray));
% u0=sum((mingray:t).*graydata(mingray:t))/sum(graydata(mingray:t));
% w1=1-w0;
% u1=sum((t:maxgray).*graydata(t:maxgray))/sum(graydata(t:maxgray));
% u=w0*u0+w1*u1;
% g(t)=w0*(u0-u)^2+w1*(u1-u)^2;
% end
% [C I]=max(g);
% t = mingray:maxgray;
% grayThresh=grayindex(t(I)-1);

 
% ʵ����matlab�ṩ����غ�����ʵ�֣�������graythresh�����ļ�����������Ĵ������󣬽����ο��ɣ�
%һ�����ӣ�
I = imread('binaryzaimg.bmp');
I =rgb2gray(I);
figure
imshow(I)
title('ԭʼͼ��')
figure
imhist(I)
title('�Ҷ�ͼ���ֱ��ͼ')
level = graythresh(I)
BW = im2bw(I,level);
figure
imshow(BW)
title('���ݶ�̬��ֵ����ֵ��')
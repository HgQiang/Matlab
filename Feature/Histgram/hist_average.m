%% ����ֱ��ͼ���⻯�Ĵ���
   %ֱ��ͼ���⻯��һ�ּ����ǿͼ��Աȶȵķ���
%%
A=imread('2_8bit_256.bmp');
% GrayA=rgb2gray(A);
% imhist(GrayA);
Hist=zeros(0,255);
[m,n,t]=size(A);
Cdf=zeros(1,256);
for i=1:m
    for j=1:n
        Hist(A(i,j))=Hist(A(i,j))+1;
end;
end;
Cdf(1)=Hist(1);
for i=2:255
    Cdf(i)=Hist(i)+Cdf(i-1);
end;
for i=1:m
    for j=1:n
        K=Cdf(A(i,j))*255/250000;
        A(i,j)=double(K);
end;
end;
imshow(A,[0 255]);
A=uint8(A);
imwrite(A,'test1_change.jpg');
% figure;
% imshow(A);
% imhist(A);

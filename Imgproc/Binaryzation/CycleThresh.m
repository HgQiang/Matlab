%% ѭ����ֵ����ʵ��ͼ���ֵ��
%�ο���http://blog.csdn.net/cxf7394373/article/details/5526049

clc
clear
G = imread('binaryzaimg.bmp');
I = rgb2gray(G);
%l = rgb2gray(h);%ת���ɻҶ�ͼ�񣬵õ��Ҷ�ֵ
%imhist(img);%�õ��Ҷ�ֱ��ͼ
%disp(img);%��ʾ�����صĻҶ�ֵ

%ѭ����ֵѡ�񷽷�
gray1 = 0;%һ����ͼ��ĻҶ�ֵ֮��
gray2 = 0;%��һ����ͼ��ĻҶ�ֵ֮��
u1 = 0;%һ����ͼ���ƽ���Ҷ�ֵ
u2 = 0;%��һ���ֵ�ƽ���Ҷ�ֵ
k = 0;%һ����ͼ������ظ���
r = 0;%��һ����ͼ������ظ���
x = 0;%��ֵ��
T = 0;%ͼ�����ֵ
[m,n] = size(I)%��ȡͼ���С

%��ȡƽ����ֵ
for i = 1:m
    for j = 1:n
        x = x + uint32(I(i,j));
    end
end
T = x/(m*n);%��ʼ��ֵ

T1 = 0;
while T ~= T1 
    T1 = T;
    for i = 1:m
        for j = 1:n
            if I(i,j) < T
                gray1 = gray1 + uint32(I(i,j));
                k = k + 1;
            else 
                gray2 = gray2 + uint32(I(i,j));
                r = r + 1;
            end
        end
    end
    u1 = gray1/k;
    u2 = gray2/r;    
    T = (u1 + u2)/2;%�µ���ֵ
end
%BW = im2bw(g,T);%ת���ɶ�ֵͼ��
T %������ѡ�����ֵ
%��ʾ���򣬰Ѳ�����ֵ��Χ�ڵĵ�ĻҶ�ֵ��Ϊ255
for i = 1:m
    for j = 1:n
        if I(i,j) > T 
            I(i,j) = uint32(255);
        else
            I(i,j) = uint32(0);
        end
    end
end
%se = strel('disk',1);
%h = imclose(I,se);
%h = imdilate(I,se);
%y = imerode(h,se);

%h = medfilt2(I,[3,3];
%imshow(y);
imshow(I);


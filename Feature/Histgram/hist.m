clc;
clear all;
close all;
%% ����ֱ��ͼ��ֱ��ͼ���⻯���ͼ��ĶԱȶ�
I=imread('baboon.jpg');
grayimg=rgb2gray(I);

figure;imshow(grayimg);
figure;
[counts,x]=imhist(grayimg,16); %����ֱ��ͼ
stem(x,counts);

J=histeq(grayimg); %ֱ��ͼ���⻯
figure;imshow(J);
figure;
[counts,x]=imhist(J,16); %���ƾ��⻯���ֱ��ͼ
stem(x,counts);

% �Աȶȵ���
L=imadjust(grayimg,[0.3,0.7],[]);
figure;
imshow(L);
figure;
[counts,x]=imhist(J,16); %���ƶԱȶȺ��ֱ��ͼ
stem(x,counts);

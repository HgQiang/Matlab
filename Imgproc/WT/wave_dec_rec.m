%% ��������õ�ϵͳ��С���ֽ�wavedec2()��waverec2(),û�е����Լ����,�������Լ�������滻��mywavedec2()��mywaverec2()
clc;
clear all;
%% ��һ��  sym4С���ֽ���ع�
[X,map]=imread('1.bmp');
subplot(1,2,1);
imshow(X);
[c,s]=mywavedec2(X,3,'sym4'); %��ά�źŵĶ�㣨3��С���ֽ�
Csize=size(c);
for i=1:Csize(2)
  if(c(i)>100)  %��Ƶ����----s�е�һά�ĳ���
   c(i)=1*c(i);
  else
   c(i)=0.9*c(i);  %��Ƶ����
  end
end
x1=mywaverec2(c,s,'sym4');%��ά�źŵĶ���С���ع�
im=uint8(x1);
subplot(1,2,2);
imshow(im);
 %%  �ڶ���
[c,s]=mywavedec2(X,2,'bior3.7');%��ͼ����С�����в�ֽ�
cal=appcoef2(c,s,'bior3.7',1);%��ȡС���ֽ⣨�ṹ�е�һ��ĵ�Ƶϵ�������Ʒ���
ch1=detcoef2('h',c,s,1);%��ȡ��ά�ź�С���ֽ��ˮƽ�����ϸ�ڷ��� 
cv1=detcoef2('v',c,s,1);%��ֱ����
cd1=detcoef2('d',c,s,1);%б�߷���
a1=wrcoef2('a',c,s,'bior3.7',1);%��Ƶ�ʳɷ��ع����ɶ��С���ֽ��ع�ĳһ��ķֽ��ź�

 
[c,s]=mywavedec2(X,1,'sym4');
a1=appcoef2(c,s,'sym4',1);%С���ֽ�ṹ�е�һ��ĵ�Ƶϵ����������3����Ƶϵ��
a1=2*a1;
h1=detcoef2('h',c,s,1);
v1=detcoef2('v',c,s,1);
d1=detcoef2('d',c,s,1);
h1=0.5*h1;
v1=0.5*v1;
d1=0.5*d1;
y=idwt2(a1,h1,v1,d1,'sym4');  %��ά��ɢС�����任
 
 %%  ������
load wbarb; 
X1=X;map1=map; 
figure;
subplot(2,2,1); 
image(X1);colormap(map1); 
title('ͼ��wbarb'); 

load woman; 
X2=X;map2=map; 
subplot(2,2,2); 
image(X2);colormap(map2); 
title('ͼ��woman'); 
%===================================== 
%��������ͼ����зֽ� 
[c1,l1]=mywavedec2(X1,2,'sym4'); 
[c2,l2]=mywavedec2(X2,2,'sym4'); 
c=c1+c2; %�Էֽ�ϵ�������ں� 
%===================================== 
%Ӧ���ں�ϵ������ͼ���ع�����ʾ 
XX=mywaverec2(c,l1,'sym4'); 
subplot(2,2,3); 
image(XX); 
title('�ں�ͼ��1'); 
Csize1=size(c1); 
%===================================== 
%��ͼ�������ǿ���� 
for i=1:Csize1(2) 
    c1(i)=1.2*c1(i); 
end 
Csize2=size(c2); 
for j=1:Csize2(2) 
    c2(j)=0.8*c2(j); 
end 
%===================================== 
%ͨ����С�ں�ϵ���Լ�Сͼ������� 
c=0.5*(c1+c2); 
%���ں�ϵ������ͼ���ع� 
XXX=mywaverec2(c,l2,'sym4'); 
%��ʾ�ع���� 
subplot(2,2,4); 
image(XXX); 
title('�ں�ͼ��2'); 
%%  ���Ĳ�
%������ʵ���������ܣ����ȶ���ԭʼͼ�񣬲�����ʹ��db3С������2��ֽ⣬
%Ȼ��Էֽ�ϵ�����д���ǿ�����裬��������Ҫ�Ĳ���
%װ�ز���ʾԭʼͼ��
clc;
clear all;
load flujet;
figure;
subplot(1,3,1);
image(X);colormap(map);
title('ԭʼͼ��');
%=====================================
%��ͼ��X��С��db3����2��ֽ�
[c,l]=mywavedec2(X,2,'db3');
Csize=size(c);
%�Էֽ�ϵ����������ͻ�����貿�ֲ���������Ҫ����
for i=1:Csize(2)
  if(c(i)>300)  %��Ƶ����
   c(i)=2*c(i);
  else
   c(i)=0.5*c(i);  %��Ƶ����
  end
end

%�ع�ͼ����ʾ
X1=mywaverec2(c,l,'db3');
subplot(1,3,2);
image(X1);colormap(map);
title('db3��ǿͼ��');
%=====================================
%��ͼ��X��С��sym4����2��ֽ�
[c,s]=wavedec2(X,2,'sym4');
Csize=size(c);
for i=1:Csize(2)
    if(c(i)>169)  %��Ƶ����----s�е�һά�ĳ���
        c(i)=2*c(i);
    else
        c(i)=0.3*c(i);  %��Ƶ����
    end
end
x1=waverec2(c,s,'sym4');
im=uint8(x1);
subplot(1,3,3);
imshow(im);colormap(cool);
title('sym4��ǿͼ��');

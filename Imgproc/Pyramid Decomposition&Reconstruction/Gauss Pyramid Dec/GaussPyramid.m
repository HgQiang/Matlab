%% ������ֻ�зֽ�û���ںϣ��ع������ڱ�������������matlab����

function GaussPyramid(imgname)
%��Դͼ�����Gauss�������ֽ�
imbase=imread(imgname); %����ԭʼͼ��

imsmooth=OGuassion(imbase); %��ͨ�˲�
im1=ODownSample(imsmooth);  %�²���
im1=uint8(im1);
imwrite(im1,'Gauss128.jpg');    %������д��ͼ���ļ���

%���·ֽ����Σ�ÿ�ֽ�һ�Σ�����ͬʱ��С����
imsmooth=OGuassion(im1);
im1=ODownSample(imsmooth);
im1=uint8(im1);
imwrite(im1,'Gauss64.jpg'); 

imsmooth=OGuassion(im1); %%%�����Ӻ���
im1=ODownSample(imsmooth);%%%�����Ӻ���
im1=uint8(im1);
imwrite(im1,'Gauss32.jpg');

%��Դͼ��ͷֽ����õ�ͼ����ʾ����
subplot('position',[0.05,0.2,0.4,0.6]);
image(imbase);
title('ԭʼͼ��');

subplot('position',[0.5,0.2,0.2,0.3]);
imbase1=imread('Gauss128.jpg');
image(imbase1);
title('Gauss128');

subplot('position',[0.75,0.2,0.1,0.15]);
imbase2=imread('Gauss64.jpg');
image(imbase2);
title('Gauss64');

subplot('position',[0.9,0.2,0.05,0.075]);
imbase3=imread('Gauss32.jpg');
image(imbase3);
title('Gauss32');


%------------------------------�Ӻ�����ʵ��--------------------------------
%��ͼ��im���и�˹��ͨ�˲�
function r=OGuassion(im)
radius=5;
sigma=1;
%����һ����άGaussian��ͨ�˲���������һ����СΪ2*radius+1����׼��Ϊsigma
%����ת�Գƾ���GaussianSΪ���صľ����
GaussianS=fspecial('gaussian',2*radius+1,sigma);

im=double(im);  %ǿ��ת��Ϊ˫��������
[m,n,z]=size(im);%��im��ÿ��ά�ȵĴ�С�ֱ������m,n,z
for i=1:z
    GaussianSmooth(:,:,i)=GaussianS;
end
r=zeros(m,n,z);
for i=1:m
    for j=1:n
        %�Գƹ���ͼ���С������
        row=i-radius:i+radius;
        if i-radius<1
            row(1:radius-i+1)=i+radius:-1:2*i;
        end
        if i+radius>m
            row(radius+m-i+2:2*radius+1)=i-radius:2*i-m-1;
        end
        col=j-radius:j+radius;
        if j-radius<1
            col(1:radius-j+1)=j+radius:-1:2*j;
        end
        if j+radius>n
            col(radius+n-j+2:2*radius+1)=j-radius:2*j-n-1;
        end 
        r(i,j,:)=sum(sum(im(row,col,:).*GaussianSmooth(:,:,:))); 
    end
end


%��2���²���
function r=ODownSample(im)
[m,n,z]=size(im);
r=im(2:2:m,2:2:n,:); 




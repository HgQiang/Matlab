%% ��Ե�ܶȼ����� 
% ���԰ٶ�֪����http://zhidao.baidu.com/link?url=QqviuMldTkCSmg2Fr-FOb2vnbFdCHcE6-m_xA9Q9t37yJBiK2S30XU1WL2N4we5Kq6hnnD6jcRtp307IzfoIz_

P=imread('density.png');
I=rgb2gray(P);%ת��Ϊ�Ҷ�ͼ��
I=edge(I,'robert','vertical');%��robert���Ӽ����ֱ����ı�Ե����Ե�����ͼ�Ƕ�ֵͼ
imwrite(I,'edge_robert_ver.jpg');
figure(1),subplot(1,2,1),imshow(I);title('ԭʼ����ֱ��Ե���ͼ');
[m n]=size(I);

K=I;
w=9;%���ڿ�ȣ��߶���1������
threshold=5;%ѡ���Ƿ����ӵ���ֵ�������������
left=ceil(w/2); %ceil����ʱ���������floor����С������round����������
right=n-left;

%������ڿ�ȣ�9���ڵı�Ե���س���threshold(5),���ô����ڵ����е�����Ϊ��Ե����
for i=1:m
    for j=left:right
        if sum(I(i,(j-left+1):(j+left-1)))>=threshold %���ܶȴ�����ֵ������
            K(i,(j-left+1):(j+left-1))=1;
        end
    end
end
figure(1),subplot(1,2,2),imshow(K);title('���б�Ե���Ӻ��ͼ');
% KΪ���ӱ߽���ͼ��


%% ��̬ѧ��������
%������
se=strel('rectangle',[m,n]);
I=imopen(I,se);

%������
se=strel('rectangle',[3,2]);
I=imclose(I,se);


% [m,n]Ϊѡ���m*n�������
%Ҳ����ֱ����se=[]�Լ����õ�Ԥ�����
%��[1 0 0;0 1 0;0 0 1];
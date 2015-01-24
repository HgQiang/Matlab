%----------------------------------------------------------% 
     %��άС���ֽ���� Matlab ���� - V3.0��
%----------------------------------------------------------%
 
function [coef,scf]=mywavedec2(x,N,wname)
%----------------------------------------------------------%
% ���� MYWAVEDEC2() ��������� x ���� dim ��ֽ⣬�õ���Ӧ�ķֽ�ϵ������ y
% ���������x ���� �������
%          N ���� �ֽ⼶��
%          wname ���� �ֽ����õ�С������
% ���������scf ���� �洢�����ֽ�ϵ������Ĵ�С�Լ�ԭʼ��ͼ�񣩾���Ĵ�С
%           coef ���� �ֽ�ϵ��������ṹ���£�
% coef = {cA_N;cV_N;cH_N;cD_N;cV_N-1;cH_N-1;cD_N-1;����;cV_1;cH_1;cD_1}
%
% Copyright by Zou Yuhua ( chenyusiyuan )
% Version: 3.0, Date: 2008-07-08
%----------------------------------------------------------%
 
 
% ���С���������˲�����ϵ������
[Lo_D,Hi_D] = wfilters(wname,'d'); 
lf=length(Lo_D);
% ����ԭʼͼ��
imshow(x);title('Original Image');
% ����ͼ���С
[r,c]=size(x);
xlabel(['Size : ',num2str(r),'*',num2str(c)]);
 
 
% ������x�����ݸ�ʽת��Ϊ�ʺ���ֵ�����double��ʽ
xd=double(x);               
[rx,cx]=size(x);
[o2sa,f1sa,rsx]=sizcoef([rx,cx],lf,N);  a=[o2sa,f1sa,rsx]
 
coef=[];
scf=[rx,cx];
for i=1:N
    [cA,cV,cH,cD]=mydwt2(xd,Lo_D,Hi_D);     % �� i ��С���ֽ�    
    xd=cA;              % ���� i ���ֽ�õ��ĵ�Ƶϵ��������Ϊ�� i+1 ���ֽ��Դ����
    outmp={cV;cH;cD};      % ���� i ���ֽ�õ��ĸ�Ƶϵ������cV,cH,cD����ϸ������ outmp
    
    scf=[size(cV);scf]; % �������ֽ�ϵ������Ĵ�С������� scf
    coef=[outmp;coef];       % ��ϸ������ outmp ����������� coef��coef���ɿվ����Ϊϸ������    
end
% ���������󣬾��� coef �б�����Ǹ����ֽ��еĸ�Ƶϵ������
% ���轫������õ��ľ��� cA������ dim ����Ƶ���������� coef
coef=[cA;coef];
scf=[size(cA);scf];
 
 
plotcoef(N,wname,coef);
plotcoef2one(N,wname,coef,rsx);
 
function plotcoef2one(N,wname,coef,rsx)
% ����С���ֽ�ϵ������ʽ�ṹͼ
rsx=rsx(end:-1:1,:);
tmpcoef=[];
tA=wkeep(coef{1},rsx(1,:),'c');
tmpcoef=tA; 
tA=uint8(tA); tA(end,:)=255; tA(:,end)=255;
for j=1:N
    tV=wkeep(coef{(j-1)*3+2},rsx(j,:),'c');
    tH=wkeep(coef{(j-1)*3+3},rsx(j,:),'c');
    tD=wkeep(coef{(j-1)*3+4},rsx(j,:),'c');
    tV=uint8(tV); tH=uint8(tH); tD=uint8(tD); 
    if j<N
        tV(end,:)=255; tV(:,end)=255;
        tH(end,:)=255; tH(:,end)=255;
        tD(end,:)=255; tD(:,end)=255;
    else
        tV(end,:)=255; tH(:,end)=255;
    end
    tmpcoef=[tA,tV;tH,tD];stc=size(tmpcoef);
    if stc>=rsx(j+1,:)
        tA=tmpcoef(1:rsx(j+1,1),1:rsx(j+1,2));
    else
        tmpcoef=tmpcoef([1:end-1,end-2:end-1],[1:end-1,end-2:end-1]);
        tA=tmpcoef(1:rsx(j+1,1),1:rsx(j+1,2));
    end
    tA=uint8(tA); tA(end,:)=255; tA(:,end)=255;
end
figure;
sc=tA;
[rx,cx]=size(sc);
imshow(sc);
xlabel(['Size : ',num2str(rx),'*',num2str(cx)]);
title(['Wavelet Decomposition -- Wavelet Type: ',wname,' , Levels: ',num2str(N)]);
 
 
function plotcoef(N,wname,coef)
% ����������Ƶ����Ƶϵ������Ĳ�νṹͼ
% ���Ƚ���һ����Ϊ��Wavelet Decomposition -- Wavelet Type: , Levels: ����ͼ�񴰿�
figure('Name',['Wavelet Decomposition -- Wavelet Type: ',wname,' , Levels: ',num2str(N)]);
% ͼ��ĵ�1����ʾ��Ƶϵ�������У���������subplotΪ��
subplot(N+1,3,2);
yt=uint8(coef{1});
[yrow,ycol]=size(yt);
imshow(yt);title( ['Approximation A',num2str(N)]);
xlabel(['Size : ',num2str(yrow),'*',num2str(ycol)]);
% ��2-(N+1)����ʾ������Ƶϵ��
titllist={['Vertical Detail V'];['Horizontal Detail H'];['Diagonal Detail D']};
pn=2;   % pn ����ͼ����ʾ���
for pr=1:N
    for pc=1:3
        subplot(N+1,3,pn+2);
        yt=[]; 
        yt=uint8(coef{pn});
        [yrow,ycol]=size(yt);
        imshow(yt);title([ titllist{pc},num2str(N-pr+1)]);
        xlabel(['Size : ',num2str(yrow),'*',num2str(ycol)]);
        % ÿ�еĵ�һ��ͼ���Y�ᣬ��ʾ���и�Ƶϵ����Ӧ�ķֽ⼶��
        if mod(pn+2,3)==1
            ylabel(['Level ',num2str(N-pr+1)]);
        end
        pn=pn+1;
    end
end
 
 
function [o2sa,f1sa,rsx]=sizcoef(sx,lf,N)
% ���� sizcoef ����С���ֽ�ľ�������и��ֽ⼶�ľ����С
% ���������sx ���� ԭʼ��ͼ�񣩾���Ĵ�С
%          lf ���� �˲����ĳ���
%          N ���� �ֽ⼶��
% ���������o2sa ���� ���ݹ�ʽ sigLen+filLen-1 �õ��ľ��������С
%          f1sa ���� �����³����󱾼��ֽ�ϵ������Ĵ�С
%          rsx ���� ͨ�� f1sa �����Ӧ��ԭʼ�������Ч�����С
% Copyright by Zou Yuhua ( chenyusiyuan ), Version: 1.0, Date: 2008-07-07
 
o2sa=sx;
f1sa=[0 0];
osx=sx;
for i=1:N
    ot=osx+lf-1;
    sa=floor(ot/2);
    o2sa=[o2sa;ot];
    f1sa=[f1sa;sa];
    osx=sa;
end
 
rsx=zeros(N+1,2);
rsx(1,:)=sx;
addln=0;
for j=2:N+1                     % ��ÿ����������еĳ��Ȼ����� floor(lf-1/2)��
    aln=floor((addln+lf-1)/2); % �ݴ˿��ɾ��������г������ԭ�����������г���
    tsx=f1sa(j,:)-aln;
    rsx(j,:)=tsx;
    addln=aln;
end
 
function [cA,cV,cH,cD]=mydwt2(x,Lo_D,Hi_D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���� MYDWT2() �������r*cά���� x ���ж�άС���ֽ⣬����ĸ��ֽ�ϵ���Ӿ���[LL,HL,LH,HH]
% ���������x ���� �������Ϊr*cά����
%          Lo_D,Hi_D ���� С���ֽ���˲�����ϵ������
% ���������cA,cV,cH,cD ���� ��С���ֽ�ϵ��������ĸ���ȴ�С���Ӿ���
%               cA����Ƶ���ַֽ�ϵ����    cV����ֱ����ֽ�ϵ����
%               cH��ˮƽ����ֽ�ϵ����    cD���Խ��߷���ֽ�ϵ����
%
% Copyright by Zou Yuhua ( chenyusiyuan ), Version: 3.0, Date: 2008-07-07
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
[row,col]=size(x);                      % ��ȡ�������Ĵ�С
for j=1:row                             % ���ȶ���������ÿһ�����н���һά��ɢС���ֽ�
    tmp1=x(j,:);
    [ca1,cd1]=mydwt(tmp1,Lo_D,Hi_D,1); 
    % tmp1 ����Ϊ row ���˲�������Ϊ lf 
    % �� [ca1,cd1] ���ܳ�Ϊ 2*floor(( row + lf -1 )/2)
    x1(j,:)=[ca1,cd1];                   % ���ֽ�ϵ�����д��뻺����� x1 ��
 
end
 
 
[row1,col1]=size(x1);       % row1=row + lnf -1, col1=col+lnf-1
for k=1:col1                             % �ٶԻ������ x1 ��ÿһ�����н���һά��ɢС���ֽ�
    tmp2=x1(:,k);
    [ca2,cd2]=mydwt(tmp2,Lo_D,Hi_D,1);    
    x2(:,k)=[ca2,cd2]';                   % ���ֽ�����ϵ�����뻺����� x2 ��
    % ע�ⲻҪ��©����һ�д����е�ת�÷��š� ������ Matlab 6.5 �����½ϵ͵İ汾��֧
    % ���С����������໥��ֵ����Ҫ��������[ca2,cd2]ת��Ϊ���������ٴ��� x2 ����Ӧ��
 
end
 
 
[row2,col2]=size(x2);
cA=x2(1:row2/2,1:col2/2);                  % cA�Ǿ���x2�����Ͻǲ���
cV=x2(1:row2/2,col2/2+1:col2);              % cV�Ǿ���x2�����Ͻǲ���
cH=x2(row2/2+1:row2,1:col2/2);              % cH�Ǿ���x2�����½ǲ���
cD=x2(row2/2+1:row2,col2/2+1:col2);          % cD�Ǿ���x2�����½ǲ���
 
 
function [cA,cD] = mydwt(x,lpd,hpd,dim)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���� [cA,cD]=MYDWT(X,LPD,HPD,DIM) ����������x����һά��ɢС���ֽ⣬����ֽ�����[cA,cD]
% ���������x�����������У�
%          lpd������ͨ�˲�����
%          hpd������ͨ�˲�����
%          dim����С���ֽ������
% ���������cA����ƽ�����ֵ�С���ֽ�ϵ����
%           cD����ϸ�ڲ��ֵ�С���ֽ�ϵ����
%
% Copyright by Zou Yuhua ( chenyusiyuan ), Version: 1.0, Date: 2007-11-10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
cA=x;       % ��ʼ��cA��cD
cD=[];
for i=1:dim
    cvl=conv(cA,lpd);   % ��ͨ�˲���Ϊ����������ٶȣ�����MATLAB�ṩ�ľ������conv()
    dnl=downspl(cvl);   % ͨ���³������ƽ�����ֵķֽ�ϵ��
    cvh=conv(cA,hpd);   % ��ͨ�˲�
    dnh=downspl(cvh);   % ͨ���³����������ֽ���ϸ�ڲ���ϵ��
    cA=dnl;                  % �³������ƽ������ϵ��������һ��ֽ�
    cD=[cD,dnh];         % ������ֽ����õ�ϸ�ڲ���ϵ����������cD
end
 
 
function y=downspl(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���� Y=DOWMSPL(X) ���������н����³������������ Y��
% �³����Ƕ���������ȡ��ż��λ����������λ������ x=[x1,x2,x3,x4,x5]���� y=[x2,x4].
%
% Copyright by Zou Yuhua ( chenyusiyuan ), Version: 1.0, Date: 2007-11-10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
N=length(x);         % ��ȡ�������г���
M=floor(N/2);        % ������еĳ������������г��ȵ�һ�루��С��ʱȡ�������֣�
i=1:M;
y(i)=x(2*i);


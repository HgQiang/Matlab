%----------------------------------------------------------%
      % ��άС���ع����� Matlab ���� - V3.0��
%----------------------------------------------------------%
function xrec=mywaverec2(coef,scf,recdim,wname)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���� MYWAVEREC2() ������ķֽ�ϵ������x���� recdim ���ع����õ��ع����� xrec
% ���������y ���� �ֽ�ϵ������
%          recdim ���� �ع�������
%          wname ���� �ع����õ�С������
% ���������xrec ���� �ع�����
%
% Copyright by Zou Yuhua ( chenyusiyuan ), Version: 3.0, Date: 2008-07-08
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
% ��С��������Ӧ���ع��˲�����ϵ��
[Lo_R,Hi_R] = wfilters(wname,'r');
% ͨ��С��ϵ���������ͼ��ķֽ⼶�� decdim
[yr,yc]=size(coef); % С��ϵ������ coef ��һ��ϸ������cell matrix��,������ yr ���Ӿ���yc=1
decdim=(yr-1)/3;    % ͼ��� N ���ֽ����� 1 ����Ƶ����N*3 ����Ƶ����
if decdim<recdim
    error(['Reconstruction level can not larger than decomposition level ( declev = ',num2str(decdim),' )'])
end
 
rcA=coef{1};
for i=1:recdim          % ���λ�ȡ�� decdim �����ڣ�decdim - recdim + 1�����ĸ�Ƶϵ������
    rcV=coef{(i-1)*3+2};
    rcH=coef{(i-1)*3+3};
    rcD=coef{(i-1)*3+4};            
    rcA=myidwt2(rcA,rcV,rcH,rcD,Lo_R,Hi_R,scf(i+2,:));           % �� N ���ع��õ��� N-1 ����Ƶϵ������ 
end
xrec=rcA;                    % �ع�������õ��ľ��� rcA ��Ϊ������� xrec
 
plotxrec(decdim,recdim,xrec)
 
 
function plotxrec(decdim,recdim,xrec)
figure;
xr=uint8(xrec);            % ������xrec�����ݸ�ʽת��Ϊ�ʺ���ʾͼ���uint8��ʽ
[sr,sc]=size(xr);
imshow(xr);
title(['Reconstructed Image. DecLevel = ',num2str(decdim),' , RecLevel = ',num2str(recdim)]);
xlabel(['Size : ',num2str(sr),'*',num2str(sc)]);    % ��ʾ�ع�����Ĵ�С
 
 
 
function outcA=myidwt2(rcA,rcV,rcH,rcD,Lo_R,Hi_R,scf)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���� MYIDWT2() ��������Ӿ������н�����С���任���ع������� y
% ���������rcA,rcV,rcH,rcD ���� �� N ����Ƶ����Ƶϵ������
%          Lo_R,Hi_R ���� ͼ���ع��õ��ĵ�ͨ����ͨ�˲���ϵ��
%          scf ���� ����С���ֽ�ϵ������Ĵ�С
% ���������outcA ���� �� N-1 ����Ƶϵ�����󣬵�N-1=0ʱ��Ϊ�ع�ͼ��
%
% Copyright by Zou Yuhua ( chenyusiyuan ), Version: 3.0, Date: 2008-07-08
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% ���ĸ��� N ��ϵ��������ϳ�һ������
tmp_mat=[rcA,rcV;rcH,rcD];
[row,col]=size(tmp_mat);
% ���� tmp_mat ���������ȵ� N-1 ����Ƶ���� cA(N-1) ��Ҫ�� lf-1 �У��У�
% ����˲����ĳ���
lf=length(Lo_R);
 
for k=1:col                             % ���ȶ���Ͼ���tmp_mat��ÿһ�У��ֿ�����������
    ca1=tmp_mat(1:row/2,k);             % �ֿ��������ֱַ���Ϊƽ��ϵ������ca1��ϸ��ϵ������cd1
    cd1=tmp_mat(row/2+1:row,k);         % ca1��cd1�ĳ���ǡ�õ���tmp_mat������row
    tmp1=myidwt(ca1,cd1,Lo_R,Hi_R);     % �ع����еĳ����ǣ�row+lf-1��
    % ͨ��Matlab����wkeep()��ȡ��ֽ⼶��Ӧ��ϵ�����г���
    yt1(:,k)=wkeep(tmp1,scf(1));    % ��ȡ����ع����д��뻺�����
end
[row1,col1]=size(yt1);
 
for j=1:row1                        % ��������� yt1 ��ÿһ�У��ֿ�����������
    ca2=yt1(j,1:col1/2);            % �ֿ��������ֱַ���Ϊƽ��ϵ������ca2��ϸ��ϵ������cd2
    cd2=yt1(j,col1/2+1:col1);
    tmp2=myidwt(ca2,cd2,Lo_R,Hi_R);  
    outcA(j,:)=wkeep(tmp2,scf(2));    % 2008-07-07 test
    % ͬ��ҲҪ��ȡ tmp2 �м䳤��Ϊscf(2)����һ�Σ������������ outcA
end
 
 
 
function y = myidwt(cA,cD,lpr,hpr);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���� MYIDWT() �������С���ֽ�ϵ����������ɢС���任���ع����ź����� y
% ���������cA ���� ƽ�����ֵ�С���ֽ�ϵ����
%           cD ���� ϸ�ڲ��ֵ�С���ֽ�ϵ����
%           lpr��hpr ���� �ع����õĵ�ͨ����ͨ�˲�����
%
% Copyright by Zou Yuhua ( chenyusiyuan ), Version: 1.0, Date: 2007-11-10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
lca=length(cA);             % ���ƽ����ϸ�ڲ��ַֽ�ϵ���ĳ���
lcd=length(cD);
 
while (lcd)>=(lca)          % ÿһ���ع��У�cA �� cD �ĳ���Ҫ��ȣ���ÿ���ع���
                            % ��lcdС��lca�����ع�ֹͣ����ʱ�� cA ��Ϊ�ع��ź����� y ��
    upl=upspl(cA);          % ��ƽ������ϵ�������ϳ���
    cvl=conv(upl,lpr);      % ��ͨ���
   
    cD_up=cD(lcd-lca+1:lcd);    % ȡ�������ع������ϸ�ڲ���ϵ���������뱾��ƽ������ϵ���ĳ������
    uph=upspl(cD_up);       % ��ϸ�ڲ���ϵ�������ϳ���
    cvh=conv(uph,hpr);      % ��ͨ���
   
    cA=cvl+cvh;             % �ñ����ع������и���cA���Խ�����һ���ع�
    cD=cD(1:lcd-lca);       % ���������ع��õ���ϸ�ڲ���ϵ��������cD
    lca=length(cA);         % �����һ���ع����õ�ƽ����ϸ�ڲ���ϵ���ĳ���
    lcd=length(cD);
end                         % lcd < lca���ع���ɣ�����ѭ��
y=cA;                       % ������ع����� y �����ع���ɺ��ƽ������ϵ������ cA
 
 
 
function y=upspl(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���� Y = UPSPL(X) �������һά����x�����ϳ�������������xÿ��Ԫ��֮��
% ���㣬���� x=[x1,x2,x3,x4],�ϳ�����Ϊ y=[0,x1,0,x2,0,x3,0,x4,0];
%
% Copyright by Zou Yuhua ( chenyusiyuan ), Version: 2.0, Date: 2008-07-08
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
N=length(x);        % ��ȡ�������г���
M=2*N+1;            % ������еĳ������������г��ȵ�2���ټ�һ       
y=zeros(1,M);
k=1:N;
y(2*k)=x(k); % ������е�����λΪ0��ż��λ�����������Ӧλ�õ���������Ԫ��

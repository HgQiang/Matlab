clear all;
P=[1 -1.2];
T=[0.5 1];
[R,Q]=size(P);
[W,B]=size(T);
%�����������ͼ
wrange=-2:0.2:2;            %�޶�Wֵ�����귶Χ
brange=-2:0.2:2;            %�޶�Bֵ�����귶Χ
ES=errsurf(P,T,wrange,brange,'purelin');    %����Ԫ�����ƽ��
mesh(ES,[60,30]);           %����Ԫ�����ƽ�棬Ч����ͼ3-31��ʾ
set(gcf,'color','w');           %������ͼ������Ϊ��ɫ
%�������Ȩֵ������ͶӰͼ
figure;
net=newlind(P,T);            %�������Ȩֵ��ƫ��
dw=net.iw{1,1};              %�������Ȩֵ��ƫ��
db=net.b{1};                 %�������ƫ��
%���ȸ���ͼ��ESΪ�ߣ����صȸ��߾���C��������h���߻����ľ��
[C,h]=contour(wrange,brange,ES);
clabel(C,h);                 %һ����һ���������������
colormap cool;               %�������ɫcool�������ɫ��
axis('equal');
hold on;
plot(dw,db,'rp','LineWidth',2.5);
xlabel('W'); ylabel('B');
lr=menu('ѡ��ѧϰ���ʣ�',...
    '1.2*maxlinr',...
    '2.8*maxlinr');
disp('')
%ѵ��Ȩֵ
disp_freq=1;
max_epoch=28;
err_goal=0.001;
if lr==1
    lp.lr=1.2*maxlinlr(P,'bias');
else
    lp.lr=2.8*maxlinlr(P,'bias');
end
a=W+P+B;
A=purelin(a);
E=T-A;                 %�����
sse=sumsqr(E);         %��������Ԫ�ص�ƽ����
errors=[sse];
for epoch=1:max_epoch     %ѵ��Ȩֵ
    if sse<err_goal
        epoch=epoch-1;
        break;
    end
    lw=W;     lb=B;
    dw=learnwh([],P,[],[],[],[],E,[],[],[],lp,[]);
    db=learnwh(B,ones(1,Q),[],[],[],[],E,[],[],[],lp,[]);
    W=W+dw;
    B=B+db;
    a=W*P+B;
    A=purelin(a);
    E=T-A;
    sse=sumsqr(E);
    errors=[errors sse];       %������Ϊһ��������
    if rem(epoch,disp_freq)==0
        plot([lw,W],[lb,B],'g-');   %��ʾȨֵ��ƫ������ѵ��ͼ��Ч����ͼ3-34��ʾ
        drawnow
    end
end
hold off;
>> figure;
m=W*P+B;
a=purelin(m);
plot(a);                 %��ÿ��ѵ�������ͼ��Ч����ͼ3-35��ʾ

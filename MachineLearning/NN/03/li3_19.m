 clear all;
%��ʼ��
P=[-6.0 -6.1 -4.1 -4.0 5.0 -5.1 6.0 6.1];
T=[0 0 0.97 0.99 0.01 0.03 1.0 1.0];
[R,Q]=size(P);
[S,Q]=size(T);
disp('The bias B is fixed at 300 and will not learn')
Z1=menu('Initalize Weight with:',...            %���˵�
    'W0=[-0.9];B0=3;',...                       %�������ĳ�ʼֵ
    'Pick Values with Mouse/Arrow Keys',...     %�������ͼ���ε��ʼֵ
    'Random Inital Condition[Defaut];');        %�����ʼֵ��ȱʡ�����
disp('')
B0=3;
if Z1==1
    W0=[-0.9];
elseif Z1==3
    W0=rand(S,R);
end
%��Ȩֵһ����ϵͼ����ע��ʼֵ
% �������������ͼ
error1=[];
net=newcf(minmax(P),[1],{'logsig'});             %���������Ե�������
net.b{1}=B0;
j=[-1:0.1:1];
for i=1:21
    net.iw{1,1}=j(i);
    y=sim(net,P);
    err=sumsqr(y-T);
    error1=[error1 err];
end
plot(j,error1);                                 %�����������ͼ
hold on;
Z2=menu('Use momentium constant of:',...        %���˵�
    '0.0',...
    '0.95 [Default]');
if Z1==2
    [W0,dummy]=ginput(1);
end
disp('')
%ѵ������
if Z2==1
    momentum=0;
else
    momentum=0.95;
end
ls=[];error=[];w=[];
max_epoch=500;
err_goal=0.01;
lp.lr=0.05; lp.mc=momentum;                 %����ֵ
err_ratio=1.04;
W=W0; B=B0;
A=logsig(W0*P+B0*ones(1,8));
E=T-A;
SSE=sumsqr(E);
for epoch=1:max_epoch
    if SSE<err_goal
        epoch=epoch-1;
        break;
    end
    D=A.*(1-A).*E;
    gW=D*P';
    dw=learngdm([],[],[],[],[],[],[],gW,[],[],lp,ls);         %Ȩֵ������
    ls.dw=dw;                                   %��ѧϰ״̬�е�Ȩֵ����
    TW=W+dw;                                     %�仯���Ȩֵ
    TA=logsig(TW*P+B*ones(1,8));
    TE=T-TA;
    TSSE=sumsqr(TE);
    if TSSE>SSE*err_ratio                       %�жϸ���������
        mc=0;
    elseif TSSE<SSE
        mc=momentum;
    end
    W=TW; A=TA;
    E=TE; SSE=TSSE;
    error=[error TSSE];                   %��¼���
    w=[w W];
end
hold off;
figure;plot(error);                      %ѵ�����ͼ

 clear all;
%��С������ƣ�MVC��������������ֵ
a=[1 -1.7 0.7];
b=[1 0.5];
c=[1 0.2]; 
d=4;
%na,nb,ncΪ����ʽA,B,C�״�
na=length(a)-1;
nb=length(b)-1;
nc=length(c)-1;
nf=nb+d-1;    ng=na-1;           %nf,ngΪ����ʽF��F,G�Ľ״�
L=400;                  %���Ʋ���
uk=zeros(d+nf,1);       %�����ֵ
yk=zeros(d+ng,1);         %�����ֵ
yek=zeros(nc,1);        %�������Ԥ����Ƴ�ֵ
yrk=zeros(nc,1);        %���������ֵ
xik=zeros(nc,1);        %��������ֵ
yr=10*[ones(L/4,1);-ones(L/4,1);ones(L/4,1);-ones(L/4+d,1)];   %�������
xi=sqrt(0.1)*randn(L,1);%����������
%���ƹ��Ƴ�ֵ
thetak=zeros(na+nb+d+nc,d);       
P=10^6*eye*(na+nb+d+nc);
for k=1:L
    time(k)=k;
    y(k)=-a(2:na+1)*yk(1:na)+b*uk(d:d+nb)+c*[xi(k);xik];   %�ɼ��������    
    %����������С���˷�
    phie=[yk(d:d+ng);uk(d:d+nf);-yek(1:nc)];
    K=P*phie/(1+phie'*P*phie);
    thetak(:,k)=thetak(:,1)+K*(y(k)-phie'*thetak(:,1));
    p=(eye(na+nb+d+nc)-K*phie')*P;
    ye=phie'*thetak(:,d);              %Ԥ������Ĺ���ֵ������thetak(:,k-d)��
    %��ȡ��ʶ����
    ge=thetak(1:ng+1,k)';
    fe=thetak(ng+2:ng+nf+2,k)';
    ce=[1 thetak(ng+nf+3:ng+nf+2+nc,k)'];    
    if abs(ce(2))>0.9
        ce(2)=sign(ce(2))*0.9;                     %MVC�㷨Ҫ��B�ȶ�
    end
    if fe(1)<0.1                     %��f0���½�Ϊ0.1
        fe(1)=0.1;
    end       
    u(k)=(-fe(2:nf+1)*uk(1:nf)+ce*[yr(k+d:-1:k+d-min(d,nc));yrk(1:nc-d)]-ge*[y(k);yk(1:na-1)])/fe(1);      %�������    
    %��������    
    for i=d:-1:2;
        thetak(:,i)=thetak(:,i-1);
    end
    thetak(:,1)=thetak(:,k);
    for i=d+nf:-1:2
        uk(i)=uk(i-1);
    end
    uk(1)=u(k);
    for i=d+ng:-1:2
        yk(i)=yk(i-1);
    end
    yk(1)=y(k);
    for i=nc:-1:2
        yek(i)=yek(i-1);
        yrk(i)=yrk(i-1);
        xik(i)=xik(i-1);
    end   
    if nc>0
        yek(1)=ye;
        yrk(1)=yr(k);
        xik(1)=xi(k);
    end
end
figure;
subplot(2,2,1);plot(time,yr(1:L),'r:',time,y);
xlabel('k');ylabel('yr(k),y(k)');
legend('yr(k)','y(k)');
axis([0 L -20 20]);
subplot(2,2,2);plot(time,u);
xlabel('k');ylabel('u(k)');
axis([0 L -40 40]);
subplot(2,2,3);plot([1:L],thetak(1:ng+1,:),[1:L],thetak(ng+nf+3:ng+2+nf+nc,:));
xlabel('k');ylabel('��������g,c');
legend('g_0','g_1','c_1');
axis([0 L -3 4]);
subplot(2,2,4);plot([1:L],thetak(ng+2:ng+2+nf,:));
xlabel('k');ylabel('��������f');
legend('f_0','f_1','f_2','f_4');
axis([0 L 0 4]);


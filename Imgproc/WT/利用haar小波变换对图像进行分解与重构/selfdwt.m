function out=selfdwt(in,J)
% ���J�߶�HaarС���任
% in �������ź�
% out �������С��ϵ��
%h0,h1����Ӧ��С���ͳ߶�����
h0=[1/sqrt(2),1/sqrt(2)]; 
h1=[-1/sqrt(2),1/sqrt(2)];
out=zeros(size(in));
m=size(in);%�˴���mΪһ����
x=length(in);
k=0;
l=0;
Wl=in;
for i=1:J
%=================�˴���Ӧ�ڸ�Ƶ���֣�����г�ȡż���ĵ�=====================
    Wh=conv(h1,Wl);
    for j=1:(length(h1)+length(Wl)-1)
        if mod(j,2)==0
            k=k+1;
            out(round(x/2)+k)=Wh(j);
        end
    end
 %============================================================================
 %===============�����Ӧ�ڵ�Ƶ���֣�����г�ȡż����=========================
    Wl1=conv(h0,Wl);
    for j=1:(length(h0)+length(Wl)-1)
        if mod(j,2)==0
            l=l+1;
            out(l)=Wl1(j);
        end
    end
  %===========================================================================
    x=round(x/2);
    m=round(m/2);
    Wl=zeros(m);
    for j=1:x
        Wl(j)=out(j);
    end
    k=0;
    l=0;
end

    
    
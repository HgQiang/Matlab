function [MinD,BestPath]=MainAneal(CityPosition,pn)
global path p2 D;           %����ȫ�ֱ���
[m,n]=size(CityPosition);
%���ɳ�ʼ��ռ䣬�������Ա��𲽷���ռ����п�һЩ
TracePath=zeros(1e3,m);
Distance=inf*zeros(1,1e3);
D= sqrt((CityPosition( :,  ones(1,m)) - CityPosition( :,  ones(1,m))').^2 +...
    (CityPosition( : ,2*ones(1,m)) - CityPosition( :,2*ones(1,m))').^2 );
%�����е��������ת��Ϊ�ڽӾ��󣨳��м�������
for i=1:pn
    path(i,:)=randperm(m);%����һ����ʼ���н�
end
t=zeros(1,pn);
p2=zeros(1,m);
iter_max=100;%input('������̶��¶�������������iter_max=' );
m_max=5;%input('������̶��¶���Ŀ�꺯��ֵ������������δ�Ĵ���m_nax=' ) ;
%������ǵ����³����½ⱻ���ո��ʽϴ���������ֲ�����
%�����Ž��µĽ����½ⱻ���յĸ����𽥼��٣���������������
%��Ϊ��ʹ���� iter_max,m_max ��С��Ȼ��ʹ֮���¶Ƚ��Ͷ�������,����
%���յ����ȽϺõ�Ч��
T=1e5;
N=1;
tau=1e-5;%input('����������¶�tau=' );
while  T>=tau%&m_num<m_max          
       iter_num=1;%ĳ�̶��¶��µ���������
       m_num=1;%ĳ�̶��¶���Ŀ�꺯��ֵ����δ�Ľ�����������
       while m_num<m_max&iter_num<iter_max
        %MRRTT(Metropolis, Rosenbluth, Rosenbluth, Teller, Teller)����:
             %����������ʽ�㷨��path������N(path)���ҳ��µĸ��Ž�
             for i=1:pn
                 Len1(i)=sum([D(path(i,1:m-1)+m*(path(i,2:m)-1)) ...
D(path(i,m)+m*(path(i,1)-1))]);
                  %����һ���б����г��е���·�� 
                 [path2(i,: )]=ChangePath2(path(i,: ),m);%����·��
                 Len2(i)=sum([D(path2(i,1:m-1)+m*(path2(i,2:m)-1)) ...
D(path2(i,m)+m*(path2(i,1)-1))]);
             end
             R=rand(1,pn);             
             if find((Len2-Len1<t|exp((Len1-Len2)/(T))>R)~=0)
                 path(find((Len2-Len1<t|exp((Len1-Len2)/(T))>R)~=0), : )=...
path2(find((Len2-Len1<t|exp((Len1-Len2)/(T))>R)~=0), : );
                 Len1(find((Len2-Len1<t|exp((Len1-Len2)/(T))>R)~=0))=...
Len2(find((Len2-Len1<t|exp((Len1-Len2)/(T))>R)~=0));
                 [TempMinD,TempIndex]=min(Len1);
                 TracePath(N,: )=path(TempIndex,: );
                 Distance(N,: )=TempMinD;
                 N=N+1;                 
                 m_num=0;
             else
                 m_num=m_num+1;
             end
             iter_num=iter_num+1;
         end
         T=T*0.9
end 
[MinD,Index]=min(Distance);
BestPath=TracePath(Index,: );
disp(MinD)

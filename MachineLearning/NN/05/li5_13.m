clear all;
%����������
J=rands(20)';
%����ȨֵW�ͷ���ȨֵT
W=rands(20,5);
T=rands(20,5);
%�������
threshold=0.8;
%����ģʽA1��A2
A1=[1 1 0 0 0];
A2=[1 0 0 0 1];
%��ʼ��
for i=1:20
    for j=1:5
        W(i,j)=1/6;
        T(i,j)=1;
    end
end
%�ж��Ƿ����ʶ����
normalA1=norm(A1,1);
normalTA1=T(1,:)*A1';
count=1;
if normalTA1/normalA1>threshold
    J(count)=1;
end
%Ȩֵ����
W(1,:)=[0.4 0.4 0 0 0];
T(1,:)=[1 1 0 0 0];
%Ѱ�ҿ��Լ���A2����Ԫ
for k=1:20
    s(k)=W(k,:)*A2';
    if s(k)==max(s);
        count=k;
    end
end
%�����A1����Ԫ�ظ�������Ѱ��
if J(count)==1
    newcount=count+1;
end
for i=1:(count-1)
    p(i)=s(i);
end
for i=count:19
    p(i)=s(i+1);
end
for k=newcount:20
    if s(k)==max(p)
        count=k;
    end
end
%ȷ���ҵ�����Ԫ���count���������Ӧ�����Ϊ1
J(count)=1;
%Ȩֵ����
W(count,:)=[0.4 0 0 0 0.4];
T(count,:)=[1 0 0 0 1];
J

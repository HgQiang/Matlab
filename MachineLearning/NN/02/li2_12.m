clear all;
err_goal=0.0015;        %�������������Сֵ
max_epoch=5000;         %����ѵ����������
X=[0 0 1 1;0 1 1 0];    %��������
T=[0 1 1 1];            %Ŀ������
[M,N]=size(X);
[L,N]=size(T);           %LΪ����ڵ�i��������NΪѵ����������
Wij=rand(L,M);          %�������������Ȩֵ
b1=zeros(L,1);          %���������������ֵ
for epoch=1:max_epoch
    net=netsum(Wij*X,b1);
    y=hardlim(net);
    E=T-y;
    sse=mae(E);            %��������Ȩֵ�������ƽ���������
    if(sse<err_goal)
        break;
    end
    Wij=Wij+E*X';
    b1=b1+E;
end
epoch,Wij
%��֪���ĵڶ��׶ι����ں͸���������������
X1=X;
net=netsum(Wij*X1,b1);
y=hardlim(net)

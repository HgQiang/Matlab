clear all;
%��ʼ������Ȩֵw�ͷ���Ȩֵv
w=rands(18,2)/2+0.5;
v=rands(5,18)/2+0.5;
%��������P��Ŀ������T
P=[0 0;0.5 0.5;0 0.5;1 1;0.5 1;1 0.5];
T=[1 0 0 0 0;1 0 0 0 0;0 1 0 0 0;0 0 1 0 0;0 0 0 1 0;0 0 0 0 1];
T_out=T;
%�趨ѧϰ����Ϊ1000��
epoch=1000;
%��һ����������P
for i=1:6
    if P(i,:)==[0 0];
        P(i,:)=P(i,:);
    else
        P(i,:)=P(i,:)/norm(P(i,:));
    end
end
%��ʼѵ��
while epoch>0
    for j=1:6
        %��һ������Ȩֵw
        for i=1:8
            w(i,:)=w(i,:)/norm(w(i,:));
            s(i)=P(j,:)*w(i,:)';
        end
        %�����Ϊ������Ԫ������ʤ��Ԫ
        temp=max(s);
        for i=1:8
            if temp==s(i)
                count=i;
            end
            %�����о�������Ԫ�������Ϊ0
            for i=1:8
                s(i)=0;
            end
            %����ʤ��Ԫ�������Ϊ1
            s(count)=1;
            %Ȩֵ����
            w(count,:)=w(count,:)+0.1*[P(j,:)-w(count,:)];
            w(count,:)=w(count,:)/norm(w(count,:));
            v(:,count)=v(:,count)+0.1*(T(j,:)'-T_out(j,:)');
            %�����������
            T_out(j,:)=v(:,count)';
        end
        %ѵ�������ݼ�
        epoch=epoch-1;
    end
    %ѵ������
end
T_out
    %������룬������ģʽΪPc
    Pc=[0.5 1;1 1];
    %��ʼ��Pc
    for i=1:2
        if Pc(i,:)==[0 0]
            Pc(i,:)=Pc(i,:);
        else
            Pc(i,:)=Pc(i,:)/norm(Pc(i,:));
        end
    end
    %�������
    Outc=[0 0 0 0 0;0 0 0 0 0];
    for j=1:2
        for i=1:18
            sc(i)=Pc(j,:)*w(j,:)';
        end
        tempc=max(sc);
        for i=1:18
            if tempc==sc(i)
                countp=i;
            end
            sc(i)=0;
        end
        sc(countp)=1;
        Outc(j,:)=v(:,countp)';
    end
    %�������
    Outc

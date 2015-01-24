function Iout2=imidwt2(in,J1)
% ������ͼ��in��J1�߶ȵ�С����任
K=J1;
[m,n]=size(in);
in1=double(in);
V=zeros(m/(2^(J1-1)),n/(2^(J1-1)));
Iout2=zeros(size(in));
for k=1:K
    for i=1:m/(2^(J1-1))
        for j=1:n/(2^(J1-1))
            V(i,j)=in1(i,j);
        end
    end
    for i=1:m/(2^(J1-1))
         V(i,:)=selfidwt(V(i,:),1);%���н��б任
    end
    for i=1:n/(2^(J1-1))
         V(:,i)=selfidwt(V(:,i),1);%���н��б任
    end
    for i=1:m/(2^(J1-1))
        for j=1:n/(2^(J1-1))
           in1(i,j)=V(i,j);
        end
    end
    J1=J1-1;
    V=zeros(m/(2^(J1-1)),n/(2^(J1-1)));
end 
Iout2=in1;
figure
imshow(uint8(Iout2))
end
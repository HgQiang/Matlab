clear all;
%��������
P=[0.1826 0.6325;0.3651 0.3162;0.5477 0.3162;0.7303 0.6325];
T=[1 0]
%���֪������ԭ��ͬ��learnk�Ǹ����������ֵ����ѧϰ���ȶ�������г�ʼ��
,Q]=size(T);
W=zeros(S,R);
max_epoch=10;
lp.lr=0.65;
%�Կƺ���ѧϰ�����������ѵ��
for epoch=1:max_epoch
    for q=1:Q
        A=T(:,q);
        dW=learnk(W,P(:,q),[],[],A,[],[],[],[],[],lp,[]);
        W=W+dW;
    end
end
disp('ѧϰ����Ϊ0.65ʱȨֵ������')
W
%�ı�ѧϰ��
lp.lr=0.25;
for epoch=1:max_epoch
    for q=1:Q
        A=T(:,q);
        dW=learnk(W,P(:,q),[],[],A,[],[],[],[],[],lp,[]);
        W=W+dW;
    end
end
disp('ѧϰ����Ϊ0.25ʱȨֵ������')
W

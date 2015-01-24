 clear all;
%���Բ��ɷ�����ʸ��
P=[-0.5 -0.5 0.3 0 -0.8;-0.5 0.5 -0.5 1 0];
%Ŀ��ʸ��
T=[1.0 1.0 0 0 0];
V=[-2 2 -2 2];
net=newp(minmax(P),1,'hardlim','learnp');      %����һ����֪������
net.inputweights{1,1}.initFcn='rands';         %������Ȩֵ�Ĳ�������
net.biases{1}.initFcn='rands';                 %��ƫ��Ĳ�������
net=init(net);                                 %�����ʼ��
disp('�����ʼ��Ȩֵ��')
W0=net.iw{1,1}         
disp('�����ʼ��ƫ�')                    
B0=net.b{1}
A=sim(net,P);                                  %�������
net.trainParam.epochs=40;
[net,tr]=train(net,P,T);                       %ѵ������Ȩֵ
W=net.iw{1};
B=net.b{1};
plotpv(P,T,V);  
hold on;
plotpc(W0,B0);                                 %���Ʒ���������
plotpc(W,B);
hold off;
fprintf('\n ���յ�����ֵ��\n')
W
B
fprintf('���ѵ��������')
max(tr.epoch)
fprintf('\n������ࣺ')
if all(hardlim(W*P+B)==T)
    disp('�ɷ�ģʽ');
else
    disp('���ɷ�ģʽ');
end

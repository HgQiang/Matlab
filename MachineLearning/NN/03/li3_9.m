clear all;
%���������������������
P=[1 1.5 3 -1.2];
T=[0.5 1.1 3 -1];
%����Ȩֵ����ֵ�ķ�Χ������������߼��������ȸ���
w_range=-2:0.4:2;
b_rang=-2:0.4:2;
ES=errsurf(P,T,w_range,b_rang,'purelin');
plotes(w_range,b_rang,ES);                     %Ч����ͼ3-31��ʾ
%Ѱ��ѵ����������ȶ���ѧϰ�ʣ���������һ��������Ԫ��������ѵ������
maxlr=maxlinlr(P,'bias');
net=newlin([-2 2],1,[0],maxlr);
net.trainParam.epochs=16;
%�趨ѵ�����������������ѵ����ȱʡ��ѧϰ����ΪW-H����
%Ҳ������ѵ���������޸�
net.trainParam.epochs=1;
net.trainParam.show=NaN;
h=plotep(net.IW{1},net.b{1},mse(T-sim(net,P))); 
[net,tr]=train(net,P,T);
r=tr;
epoch=1;
while epoch<5
    epoch=epoch+1;
    [net,tr]=train(net,P,T);                              %Ч����ͼ3-22��ʾ
    if length(tr.epoch)>1
        h=plotep(net.IW{1,1},net.b{1},tr.perf(2),h);        %Ч����ͼ3-23��ʾ
        r.epoch=[r.epoch epoch];
        r.perf=[r.perf tr.perf(2)];
        v.vperf=[r.vperf NaN];
        r.tperf=[r.tperf NaN];
    else
        break
    end
end
tr=r;
%ѵ�����û�дﵽ0���������ڳ���ϵͳ�ķ�������ɵ�
solvednet=newlind(P,T);
hold on;
plot(solvednet.IW{1,1},solvednet.b{1},'ro')
hold off;
subplot(1,2,2);
plotperf(tr,net.trainParam.goal);             %���Ƴ��������Ӧ������ͼ3-24��ʾ��
%�����������֤
p=-1.4;
a=sim(net,p)

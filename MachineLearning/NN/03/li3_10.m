 clear all;
%���������������������
P=[+1.0];
T=[+0.5];
%����Ȩֵ����ֵ�ķ�Χ������������߼��������ȸ���
w_range=-1:0.2:1;
b_range=-1:0.2:1;
ES=errsurf(P,T,w_range,b_range,'purelin');
plotes(w_range,b_range,ES);                  %Ч����ͼ3-25��ʾ
%Ѱ��ѵ����������ȶ���ѧϰ�ʣ���������һ��������Ԫ��������ѵ������
maxlr=maxlinlr(P,'bias');
net=newlin([-2 2],1,[0],maxlr);
net.trainParam.goal=1e-10;
%�趨ѵ�����������������ѵ����ȱʡ��ѧϰ����ΪW-H����Ҳ������ѵ���������޸�
net.trainParam.epochs=1;
net.trainParam.show=NaN;
h=plotep(net.IW{1},net.b{1},mse(T-sim(net,P)));
[net,tr]=train(net,P,T);
r=tr;
epoch=1;
while true
    epoch=epoch+1;
    [net,tr]=train(net,P,T);                      %Ч����ͼ3-26��ʾ
    if length(tr.epoch)>1
        h=plotep(net.IW{1},net.b{1},tr.perf(2),h);  %Ч����ͼ3-27��ʾ
        r.epoch=[r.epoch epoch];
        r.perf=[r.perf tr.perf(2)];
        r.vperf=[r.vperf NaN];
        r.tperf=[r.tperf NaN];
    else
        break
    end
end
tr=r;
 solvednet=newlind(P,T);
hold on;
plot(solvednet.IW{1,1},solvednet.b{1},'ro')       %Ч����ͼ3-28��ʾ
%����ѵ�������ʱ��仯�����ߣ�ѵ�������ѵ�������кܴ��ϵ
hold off;
plotperf(tr,net.trainParam.goal);             %���Ƴ��������Ӧ������ͼ3-29��ʾ��
 %�����������֤
p=1.0;
a=sim(net,p)

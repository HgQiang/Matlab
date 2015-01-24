 clear all;
load choles_all;
[pn,meanp,stdp,tn,meant,stdt]=prestd(p,t);
%ɾ��һЩ���ݣ�ֻ��������ռ99.9%����Ҫ�ɷ�����
[ptrans,transMat]=prepca(pn,0.001);
[R,Q]=size(ptrans)              %���ת�������ݾ����С
 iitst=2:4:Q;
iival=4:4:Q;
iitr=[1:4:Q 3:4:Q];
val.P=ptrans(:,iival);
val.T=tn(:,iival);
test.P=ptrans(:,iitst);
test.T=tn(:,iitst);
ptr=ptrans(:,iitr);
ttr=tn(:,iitr);
%�������磬������Ԫ�������Ϊ5������Ϊ��Ҫ�õ�3��Ŀ�꣬
%������������Ϊ3����Ԫ
net=newff(minmax(ptr),[5,3],{'tansig','purelin'},'trainlm');
%����Levenberg-Marquardt�㷨��BP��������ѵ��
%�������磬������Ԫ�������Ϊ5������Ϊ��Ҫ�õ�3��Ŀ�꣬������������Ϊ3����Ԫ
net=newff(minmax(ptr),[5,3],{'tansig','purelin'},'trainlm');    %Ч����ͼ3-70��ʾ
%������Ӧ�������ͼ
plot(tr.epoch,tr.perf,'r:',tr.epoch,tr.vperf,tr.epoch,tr.tperf,'-.');   %Ч����ͼ3-71��ʾ
legend('ѵ���������','��֤�������','�����������');    
ylabel('ƽ����');xlabel('ʱ��'); 
an=sim(net,ptrans);
a=poststd(an,meant,stdt);
for i=1:3
    figure(i);
    [m(i),b(i),r(i)]=postreg(a(i,:),t(i,:));       %Ч����ͼ3-71~ͼ3-73��ʾ
end
net=newff(minmax(ptr),[20,3],{'tansig','purelin'},'trainlm');
[net,tr]=train(net,ptr,ttr,[],[],val,test);                     %Ч����ͼ3-74
plot(tr.epoch,tr.perf,':',tr.epoch,tr.vperf,'-.',tr.epoch,tr.tperf);   %Ч����ͼ3-75��ʾ
legend('ѵ�����������','��֤�������','�����������');
ylabel('ƽ����');xlabel('ʱ��');
an=sim(net,ptrans);
a=poststd(an,meant,stdt);
for i=1:3
    figure(i);
    [m(i),b(i),r(i)]=postreg(a(i,:),t(i,:));         %Ч����ͼ3-76~ͼ3-78��ʾ
end
[m(1),b(1),r(1)]=postreg(a(1,:),t(1,:));

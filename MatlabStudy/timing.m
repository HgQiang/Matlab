% matlab�����������ʱ������ַ���
clear all;close all; clc
%% 1��tic toc
   %��������ticʱMatlab�Զ���ʼ��ʱ�����е�tocʱ�Զ������ʱ�����һ��tic֮���ʱ��
tic;%tic1
t1=clock;
for i=1:3
    tic ;%tic2
    t2=clock;
    pause(3*rand)
    %���㵽��һ������tic��ʱ�䣬���仰˵����ÿ��ѭ����ʱ��
    disp(['toc�����',num2str(i),'��ѭ������ʱ�䣺',num2str(toc)]);
    %����ÿ��ѭ����ʱ��
    disp(['etime�����',num2str(i),'��ѭ������ʱ �䣺',num2str(etime(clock,t2))]);
    %��������ܹ�������ʱ��
    disp(['etime�������ӿ�ʼ���������е�ʱ��:',num2str(etime(clock,t1))]);
    disp('======================================')
end
%�����ʱ��tic2��ʱ�䣬�������һ������tic����forѭ����i=3ʱ�����Լ���������һ��ѭ����ʱ��
disp(['toc�������һ��ѭ������ʱ��',num2str(toc)])
disp(['etime����������ʱ�䣺',num2str(etime(clock,t1))]);
%% 2 etime(t1,t2�����clockʹ��
 %ͨ������windowsϵͳ��ʱ�ӽ���ʱ������õ�����ʱ���
 t1=clock;
 %......
 t2=clock;
 etime(t2,t1)
 %% 3 cputime����
 %ʹ��CPU����Ƶ�����ǰ���ԭ��ͬ
 t0=cputime;
 %.....
 t1=cputime-t0;

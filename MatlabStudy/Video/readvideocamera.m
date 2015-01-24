% Matlab��ȡ��Ƶ�ļ�������ͷ�ķ���
%% ��1������mmreader()��ȡ��Ƶ�ļ�����ʾ
%���ԣ�http://blog.csdn.net/yanzi1225627/article/details/8273060
%��avi�ļ��������Ķ�ȡ����ʾ������wmv�ļ����ܣ���ȡ֡��ʱ�����

clc;
clear;

% this to read avi by using mmread to get every frame
video = mmreader('street.avi');
nFrames = video.NumberOfFrames;   %�õ�֡��
H = video.Height;     %�õ��߶�
W = video.Width;      %�õ����
Rate = video.FrameRate;
% Preallocate movie structure.
mov(1:nFrames) = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]);

%read one frame every time
for i = 1:nFrames
    mov(i).cdata = read(video,i);
    P = mov(i).cdata;
     %disp('��ǰ��֡����'),disp(i);
     imshow(P),title('ԭʼͼƬ');
     
%     P2=rgb2gray(P);
end

%% ��2����VideoReader�������Ƶ��ȡ����ʾ
%���ԣ�http://blog.163.com/yuyang_tech/blog/static/2160500832013989110899/

fileName='square_track.AVI';
obj = VideoReader(fileName);
numFrames = obj.NumberOfFrames;% ֡������
 for k = 1 : numFrames  % ��ȡ����
     frame = read(obj,k);
     imshow(frame);%��ʾ֡
     imwrite(frame,strcat('_input/track/',num2str(k),'.jpg'),'jpg');% ����֡
end


%% ��3�� videoinput()������ȡ����ͷ
%���ԣ�http://blog.csdn.net/sxjk1987/article/details/8819186
close all  
  
vidobj = videoinput('winvideo',1,'YUY2_320x240');  
triggerconfig(vidobj,'manual');  
start(vidobj);  
tic   
for i = 1:1000  
     snapshot = getsnapshot(vidobj);  %getsnapshot����ץȡһ֡ͼ��
     frame = ycbcr2rgb(snapshot);  %YUV��ʽRGB��ʽ
     
     %���������ͼ�������
     
     imshow(frame);  
%    pause(0.033);  
end  
elapsedTime = toc  
timePerFrame = elapsedTime/1000  %��ʵ֡��
effectiveFrameRate = 1/timePerFrame    %��ʾ֡��
  
stop(vidobj);  
delete(vidobj);  
disp('end');
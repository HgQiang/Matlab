Fs=10000;N=1024;n=0:1/Fs:1;  %Fs����Ƶ�ʣ�N����������nʱ���
xn=sin(400*pi*n)+cos(600*pi*n)+4*n+0.2*randn(size(n)); %�任ԭ����,f1=200Hz,f2=300Hz
figure(1);
plot(n,xn); %����ԭ����ͼ��
title('Original Signal');
xlabel('Time-n'); ylabel('Amplitude-xn');%��ע��������
%%  ����FTͼ
y=fft(xn,N)/(N/2); %��ԭ�������и���Ҷ�仯����������ΪN,�����з�ֵ�Ĺ�һ������
Y=abs(y); 
w=(0:length(Y)-1)*Fs/length(Y);%�������Ƶ�ʣ������ο�˹�ز�������
figure(2);
plot(w,Y);%����FTͼ��
xlabel('Frequency-w'); ylabel('Amplitude-Y');
title('FT figure');
%%  ����SIFTͼ
[S,F,T,P] = spectrogram(xn,1024,512,1024,10000);%��ԭ��������STFT�任������hamming��
figure(3);
surf(T,F,10*log10(P),'edgecolor','none'); %���3DʱƵͼ�����
axis tight;set(gca,'YLim',[0 5000]);%����������
colorbar;%��ʾ��ɫ��
xlabel('Time (Seconds)'); ylabel('Frequence(Hz)');zlabel('STFT');
title('STFT figure')
%% ���HaarС����ԭ�źž�HarrС���任���ͼ
i=20;wav='haar';
[phi,g1,xval]=wavefun(wav,i);
figure(4);subplot(1,2,1);
plot(xval,g1,'-r','LineWidth',1.5); 
xlabel('t');title('haar ʱ��ͼ'); 
g2=fft(g1);g3=abs(g2);subplot(1,2,2);plot(g3); 
xlabel('f');title('haar Ƶ��ͼ')
figure(5);
c=cwt(xn,1:512,'haar','plot');%����һά����С���任������ͼ��С������haar����
title('WT figure');
colorbar;%��ʾ��ɫ��
%% ����Hamming��ʱƵͼ
figure(6);
B=ceil(8/0.15); 
p=hamming(B);%��������ΪB��Hamming��
subplot(1,2,1);plot(p);%��ͼ
title('Hamming ʱ��ͼ');xlabel('t'); 
[h1,h2]=freqz(p,1); 
subplot(1,2,2);
plot(h2/pi,20*log(abs(h1)/abs(h1(1))));  %��Hamming��Ƶ��ͼ
title('Hamming Ƶ��ͼ');xlabel('f');

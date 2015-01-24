clc;  
clear all;  
  
M = 5; %����ÿ��������ά��
N = 3; %��������������Ҳ��ÿ�д���һ������
  
% ����һ��M*N�����ԭʼ����  
OriginMatrix = rand( M, N );  
disp(OriginMatrix)

% ʹ���Դ���cov����������ؾ���  
CovMatrix = cov( OriginMatrix ); 
disp(CovMatrix)
 
%�Լ�������Э�������
MeanArray = mean( OriginMatrix ); %��������������ʱ��������ÿ������������ά�ȵľ�ֵ�����������������ľ�ֵ
MeanMatrix = ones( M, 1 ) * MeanArray;

OriginSubMean = OriginMatrix - MeanMatrix;  % ԭʼ����ÿ�м�ȥÿ�еľ�ֵ�ĵľ���  
  
% �������ؾ���  
if M == 1  
    CovMatrixComputed = OriginSubMean' * OriginSubMean / M;  
else  
    CovMatrixComputed = OriginSubMean' * OriginSubMean / ( M-1 );  
end  
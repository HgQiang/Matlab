% ͼ��ֱ��ͼ�ֲ���ǿ��
% Igray:�Ҷ�ͼ��
% k0,k1���ɵ�����
% Ibw����ȡ�õ���������
function Ibw = LocalEnhance(Igray, k0, k1)
masksize = 3; % ����Χ������
exsize = floor(masksize/2); % ԭͼƬ��Ҫ��������
Iex = padarray(Igray, [exsize exsize], 'replicate', 'both'); % ͼƬ���
Is = zeros(size(Igray)); % �ֲ���׼��
for i = 1:size(Igray, 1)
for j = 1:size(Igray, 2)
subdomain = Iex(i:i+2*exsize, j:j+2*exsize);
localmean = sum(subdomain(:))/masksize^2;
Is(i, j) = sqrt(sum((subdomain(:)-localmean).^2))/masksize;
end
end
% ȷ����ͬ����ķŴ�ϵ��
meanIm = mean(Igray(:));
minIm = min(Igray(:));
meanIs = mean(Is(:));
maxIs = max(Is(:));
Im1 = Igray<(minIm+k0*(meanIm-minIm)); % ��ֵ��ֵ��ȡ
Is1 = Is>(meanIs + k1*(maxIs-meanIs)); % ��׼����ֵ��ȡ
s = strel('disk',8); % 8��Ҫ����ʵ��ͼƬ��С����
Is1 = imclose(Is1, s); % ��׼����ֵ��ȡ������
Ibw = Im1 & Is1; % �ֲ���ǿ
end
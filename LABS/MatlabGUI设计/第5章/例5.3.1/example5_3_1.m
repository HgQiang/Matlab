[fname pname index] = uigetfile({'*.jpg'; '*.bmp'}, 'ѡ��ͼƬ');  %�ļ�ѡ��Ի���
if index                   %��ѡ����ͼƬ
    str = [pname fname];   %��ȡͼƬ·����ͼƬ��
    M = imread(str);       %��ȡͼƬ
    imshow(M);             %��ʾͼƬ
end

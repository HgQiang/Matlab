clc
char set utf-8
fid=fopen('test.txt','r');
data=fread(fid)  %���ص����ı������ַ���asciiֵ
data_txt=char(data') %asciiת��Ϊ�ַ�
data_num=str2num(data_txt)  %��Ҫ�������ַ�ת��Ϊ��ֵ
fclose(fid);

 clear all;
for i=1:10
    a{i}=89+i;
    b{i}=79+i;
    c{i}=69+i;
    d{i}=59+i;
end
c=[d,c];
Name={'zhang','Li','huang','chen','zhu'};  %Ԫ������
Score={82,91,89,40,100};
Rank=cell(1,5);
%����һ������5��Ԫ�صĽṹ������S������������Name��Score��Rank��
 S=struct('Name',Name,'Score',Score,'Rank',Rank);
%����ѧ���ķ����������Ӧ�ĵȼ���
%��ѧ�����������÷֡��Ǽǵ���Ϣ��ӡ������
 disp(['ѧ������   ','�÷�   ','�ȼ�']);
for i=1:5
    disp([S(i).Name,blanks(6),num2str(S(i).Score),blanks(6),S(i).Rank]);
end

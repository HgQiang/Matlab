s = {'��ĳ','7','80','90','78'};
xlswrite('chengji.xls',s,1,'A8:E8')   %����ĳ��Ϣд��Excel
while 1
    str = input('\n������ѧ��������ѧ�ţ�(����quitʱ�˳�)\n','s'); 
    %ע������ʵ�����ޡ�(����quitʱ�˳�)����ʾ
    if isequal(str,'quit')    %����quitʱ�˳�ѭ��
        break
    end
    str2 = str2num(str);
    [num txt] = xlsread('chengji.xls');
    if isempty(str2)  %��������
        n = find(strcmp(txt(2 : end,1),{str}));   %�ҳ��ǵڼ���ѧ��
    else    %����ѧ��
        n = str2;
    end
    fprintf(1,'����:%s  ѧ�ţ�%d  ���ģ�%d  ��ѧ��%d  Ӣ�%d\n',txt{n+1},num(n,:));
end

h = waitbar(0, '��ȴ�...', 'Name', '������', 'CreateCancelBtn', ...
    'state = 1; delete(h); clear h');       %����������
h1 = findall(h, 'style', 'pushbutton');     %���ҡ�ȡ������ť
set(h1, 'string', 'ȡ��', 'fontsize', 10)   %���á�ȡ������ť��StringΪ��ȡ����
try
    for i = 1 : 100                         %���½���
        waitbar(i / 100, h, ['�������' num2str(i) '%']);
        pause(0.1)
end
delete(h);                                  %���ȴﵽ100%���жϺ󣬹رս�����
clear h
end

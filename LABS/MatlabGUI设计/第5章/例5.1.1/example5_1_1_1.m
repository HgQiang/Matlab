state = 0;                                  %�жϱ�־
h = waitbar(0, '��ȴ�...', 'Name', '������', 'CreateCancelBtn', ...
    'state = 1; delete(h); clear h');       %����������
h1 = findall(h, 'style', 'pushbutton');     %���ҡ�ȡ������ť
set(h1, 'string', 'ȡ��', 'fontsize', 10)   %���á�ȡ������ť��StringΪ��ȡ����
for i = 1 : 100                             %���½���
    waitbar(i / 100, h, ['�������' num2str(i) '%']);
    pause(0.1)
    if state                                %�жϽ��ȸ���
        break
    end
end
if exist('h') == 1     %���ȴﵽ100%�󣬹رս�����
    delete(h); 
end

close all
clear all
clc
%ѵ�������Ͳ�������������
Obj1.NTrain = 100;
Obj1.mean = 0.5 * [3; 5];%������
Obj1.SampTrain = randn(2, Obj1.NTrain) + kron(Obj1.mean, ones(1, Obj1.NTrain));

Obj1.NTest = 100;
Obj1.SampTest = randn(2, Obj1.NTest) + kron(Obj1.mean, ones(1, Obj1.NTest));
 
Obj2.NTrain = 100;
Obj2.mean = -0.5 * [3; 5];%������
Obj2.SampTrain = randn(2, Obj2.NTrain) + kron(Obj2.mean, ones(1, Obj2.NTrain));

Obj2.NTest = 100;
Obj2.SampTest = randn(2, Obj2.NTest) + kron(Obj2.mean, ones(1, Obj2.NTest));
 
% LMS
TestMatrix = zeros(2);
cnt_c1 = 1;
cnt_c2 = 1;
 
tt = 1 : 1000;
tt = (tt - 500) * 0.01;
%����ѵ������
figure('Name','ѵ������');
plot(Obj1.SampTrain(1, :), Obj1.SampTrain(2, :), 'ro', 'linewidth', 2, 'markersize', 10)
hold on;
plot(Obj2.SampTrain(1, :), Obj2.SampTrain(2, :), 'bo', 'linewidth', 2, 'markersize', 10)

%%%%%%% ���Ͼ����������� 

cnt = 1;
X = zeros(Obj1.NTrain + Obj1.NTrain, 3);
for iii = 1 : Obj1.NTrain
    X(cnt, 1 : 2) = Obj1.SampTrain(:, iii);
    X(cnt, 3) = 1;
    y(cnt, 1) = 1;
    cnt = cnt + 1;
end
for iii = 1 : Obj2.NTrain
    X(cnt, 1 : 2) = Obj2.SampTrain(:, iii);
    X(cnt, 3) = 1;
    y(cnt, 1) = -1;
    cnt = cnt + 1;
end
R = X.' * X;
g = X.' * y;
Wmse = inv(R) * g;

% �������������ȨֵW
 
cnt = 1;
Xsvm = zeros(Obj1.NTrain + Obj1.NTrain, 3);
for iii = 1 : Obj1.NTrain
    Xsvm(cnt, 1 : 2) = -1 * Obj1.SampTrain(:, iii);
    Xsvm(cnt, 3) = -1 * 1;
    ysvm(cnt, 1) = -1;
    cnt = cnt + 1;
end
for iii = 1 : Obj2.NTrain
    Xsvm(cnt, 1 : 2) = Obj2.SampTrain(:, iii);
    Xsvm(cnt, 3) = 1;
    ysvm(cnt, 1) = -1;
    cnt = cnt + 1;
end
fmincon_options = optimset('Algorithm','interior-point','MaxIter', 50);
 
[W, val, exflag, output] = fmincon(@(x)(norm(x(1 : 2), 2)),[0; 0; 1], Xsvm, ysvm,[],[],[],[], [], fmincon_options);
 
W.' * Wmse / norm(W) / norm(Wmse)
% ���˲�ѵ�����
 
%��ʼ����
% W = Wmse
for kkk = 1 : Obj1.NTest
    TMP_Tr(1:2, 1) = Obj1.SampTest(:, kkk);
    TMP_Tr(3, 1) = 1;
    yy = W.' * TMP_Tr; %�����еĺ���
    if (yy > 0)
        Result_c1(:, cnt_c1) = Obj1.SampTest(:, kkk);
        cnt_c1 = cnt_c1 + 1;
        TestMatrix(1, 1) = TestMatrix(1, 1) + 1;
    else
        Result_c2(:, cnt_c2) = Obj1.SampTest(:, kkk);
        cnt_c2 = cnt_c2 + 1;
        TestMatrix(1, 2) = TestMatrix(1, 2) + 1;
    end
end
    
for kkk = 1 : Obj2.NTest
    TMP_Tr(1:2, 1) = Obj2.SampTest(:, kkk);
    TMP_Tr(3, 1) = 1;
    yy = W.' * TMP_Tr;
    if (yy > 0)    
        Result_c1(:, cnt_c1) = Obj2.SampTest(:, kkk);
        cnt_c1 = cnt_c1 + 1;
        TestMatrix(2, 1) = TestMatrix(2, 1) + 1;
    else
        Result_c2(:, cnt_c2) = Obj2.SampTest(:, kkk);
        cnt_c2 = cnt_c2 + 1;
        TestMatrix(2, 2) = TestMatrix(2, 2) + 1;
    end
end
 
TestMatrix(1, :) = TestMatrix(1, :) / Obj1.NTest;
TestMatrix(2, :) = TestMatrix(2, :) / Obj2.NTest;
 
TestMatrix
 
figure('Name','SVM�㷨������');
try
    plot(Result_c1(1, :), Result_c1(2, :), 'ro', 'linewidth', 2, 'markersize', 10)
end
hold on
try
    plot(Result_c2(1, :), Result_c2(2, :), 'bo', 'linewidth', 2, 'markersize', 10)
end
 
plot(Obj1.SampTrain(1, :), Obj1.SampTrain(2, :), 'r+', 'linewidth', 2, 'markersize', 10)
plot(Obj2.SampTrain(1, :), Obj2.SampTrain(2, :), 'b+', 'linewidth', 2, 'markersize', 10)

%���Ʒ������
WW = W;
WW = WW / norm(WW);
plot(tt , -1 * (WW(1) / WW(2) * tt + WW(3) / WW(2)), 'linewidth', 3)

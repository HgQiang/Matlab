m = input('������һ������2��������\n');
f = zeros(m);
f([1,2]) = [1,2];
if (m > 2) && (m == floor(m))
    for i = 3 : m
        f(i) = f(i - 1) + f(i - 2);
    end
end
disp(sprintf('f(%d)=%d',[m f(m)]))

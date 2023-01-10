%guss
clear all 
close all 
clc
x = [5 2 -3 1 5; 4 3 -1 1 -7 ; 5 6 3 8 4; 5 3 7 -4 7];
n = 3;
for k = 1:n-1
    for m = k+1:n
        x(m,:) = x(m,:)-(x(m,k)*x(k,:))/x(k,k);
    end
end

for k = n:-1:1
    if k ~= n 
        sum = 0;
        for m = k+1:n
            sum = sum + x(k,m)*s(m)
        end
        s(k) = (x(k, n+1)-sum)/x(k,k)
    else 
        s(k) = x(k,n+1)/x(n, n)
    end
end

polyval(x(1,:), s(1))
x4 = x(4,n+1)/x(4, n)

x3 = (x(3, n+1)-x(3,n)*x4)/x(3, n-1)

x2 = (x(2, n+1)-x(2,n)*x4-x(2,n-1)*x3)/x(2, n-2)

x1 = ((x(1, n+1)-x(1,n)*x4-x(1,n-1)*x3-x(1,n-2)*x2))/x(1, n-3)
    
     
     

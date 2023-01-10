clear all 
close all
clc

syms t w

X = 1/(1i*w+3); 
x = ifourier(X,t); %Transformée de Fourier Inverser de X(f)
disp('x =') , pretty(x);
t1 = 0:0.01:4;
x = subs(x,t,t1); %Calcul de les valeurs de  x(t1)

for k = 1: length(x) 
    if x(k) == inf 
        x(k) = 1; %Où x(t) = infini de 1  
    end
end

plot(t1, x) % Tracer de la courbe de  x(t) 
title(['TFI : ',char(X)]) 
grid on 
clear all  
close all 
clc 
t1 = 0:0.1:1;

%1ere Méthode
syms t w x
int(1/x^4, x)
x = heaviside(t)-heaviside(t-3);
h = exp(-t)*heaviside(t);

X = fourier(x,w) %Transformée de Fourier de x(t)
H = fourier(h,w);%Transformée de Fourier de h(t)

Y = X*H %Calcule la convolution de x(t) et h(t)

y = ifourier(Y,t)%Transformée de Fourier inversée de Y(w)
y = subs(y,t,t1);%Remplacée les valeurs de t par t1

subplot(2,1,2)
plot(t1,y) % Tracer le Graph y(t)
title('Y = X.H')

%2eme Méthode
inline(x) % Transform le Fonction x(t) de Matlab Fonction 
x = ans(t1); %Remplacée les valeurs de t par t1
inline(h) % Transform le Fonction h(t) de Matlab Fonction 
h = ans(t1);%Remplacée les valeurs de t par t1
y = conv(x, h); %Calcule la convolution de x(t) et h(t)

subplot(2,1,1)
plot(t1, y([1:length(t1)])) % Tracer y(t)
title('y = conv(x,h)')
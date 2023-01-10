clear all 
close all 
clc
%Methode 1ere
syms t w r
x1 = (5^-t)*heaviside(t);
x_2 = subs(x1, t, t-r);
x2 = conj(x_2) %Calcul la conjogué de x1(t)
R = int(x1*x2, t, -inf, inf); %Calcul la fonction de autocorrection de x(t)
r1 =-8:0.1:8;
R = subs(R, r, r1); % Calcul le R(r1)
Ex =R(r1==0) %Calcul de l'énergie de x(t) ( R(0) = Ex ) 

figure(1)
plot(r1,R) %Tracer la courbe de la fonction de d'autocorretion 
title('R(t)')

%Methode 2eme 
x1 =@(t) (5.^(-t)).*heaviside(t);
t1= -4:0.1:4;
x = x1(t1);  %Calcul le vecteur de x(t1)
R = xcorr(x,x); %Calculez la fonction de autocorrection de x(t) 

t =-8:0.1:8; %L'intervale de temps  doit etre double de intervale de temps de x(t) 
table = [R', t'];
Ex =table(t==0) % Choisir le R où t = 0 (R(0) )

figure(2)
plot(t, R) %Traer la courbe de la fonction d'autocorrelation de x(t)  
title('R(t)')

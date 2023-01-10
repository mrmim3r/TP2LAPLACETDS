clear all 
close all 
clc

syms w t T 
x =t*exp(-t)*heaviside(t) ; 

%Calcul de Energie de signal dans le domaine temporel
Ex1 = int(abs(x)^2, t, -inf,inf)

%Calcul de Energie de signal dans le domaine frequentiel
X = fourier(x,w)% transformée de Fourier de signal x(t) 
X =abs(X)^2/(2*pi)<
inline(X)
Ex2 = int(abs(X)^2/(2*pi), w, -inf,inf) 



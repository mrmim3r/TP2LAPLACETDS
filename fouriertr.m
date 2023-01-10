clear all 
close all
clc

syms t w
x = sin(2*pi*t); %Fonction x(t)
k = 1000; % le precision de calcul ( Il doit tant vers infni )  
X = int(x*exp(-1i*w*t),t, -k,k); %Transformée de Fourier de x(t) 
disp('X =') , pretty(X); %Afficher X(f) 
% Tracer le graph de X(f) 
w1 = -10:0.01:10; % intervalle de calcul  
 %Transform X(f) de fonction sur Symbolic de Fonction sur MATLAB
inline(X)
X = ans(w1); % X en Fonction de w1
% pour negligable  les petites implutions   
maximum = max(imag(X));
mini = min(imag(X));
for m = 1:length(X) 
    if imag(X(m)) < maximum && imag(X(m)) > mini  % où X(f) < maximum remplacer par 0  
        X(m) = 0 ;
    end
end
plot(w1, imag(X)); %Tracer le Graph  
grid on 
legend('FT{sin2pt}')




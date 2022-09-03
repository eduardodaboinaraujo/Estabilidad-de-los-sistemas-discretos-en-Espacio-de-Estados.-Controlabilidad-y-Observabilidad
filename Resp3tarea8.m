clc 
clear all

syms k1 k2 k3 

%----   Sistema a evaluar ----% 
%               2
%G =   ----------------------
%       s^3 + 13 s^2 - 6 s + 5

num=[2];
den=[1 13 -6 5];
G=tf(num,den);

[A B C D]=tf2ss(num,den);


%---  funcion de transferencia deseada con el usuario ----%
% las cual tiene una especificacion de:
% tiempo de subida de 9s y un tiempo de acentamiento de 15s %

numi=[2];
deni=[1 4 3 1];
Gdi=tf(numi,deni);

%---polinomio caracteristico deseado---%
%      s^3 + 4 s^2 + 3 s + 1

%----- Ubicacion de polos variando la ganancia k para que el sistema tenga el comportamiento deseado ----% 
k1=-(-4+(13)); % aqui igualamos variables de estado en lazo cerrado a 
k2=-(-3+(-6)); % coeficientes de nuestro poliomio caracteristico
k3=-(-1+(5));  % ejemplo: -k1b-(13)=-4 despejamos nuestra ganacia

%---- Ganancia de realimentacion de estados en lazo cerrado-----%

K=[k1 k2 k3];
Kp=B*K;
Ac=A-Kp;

Gc=ss(Ac,B,C,D);
Gcf=tf(Gc);

figure(2)
subplot(2,1,1),step(G),legend('Sis. de Estudio')
grid on
subplot(2,1,2),step(Gdi,'r'),hold on,step(Gcf,'g'),legend('Ft. deseada','Sis. con la ganacia k estable');
grid on
title('Ganancia de realimentacion de estados');

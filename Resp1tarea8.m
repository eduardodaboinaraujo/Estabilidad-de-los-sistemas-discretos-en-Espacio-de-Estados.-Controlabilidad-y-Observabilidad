clc 
clear all

syms k p11 p12 p13 p22 p23 p33 x1 x2 x3

Phi=[0.1 1 0;1 k 0;2 -0.1 -0.2];
M=[p11 p12 p13;p12 p22 p23;p13 p23 p33]
I=-eye(3);

Sys=transpose(Phi)*M*Phi-M;
disp('Matriz de las ecuaciones direfenciales:')
Sys

%---  ecuaciones diferenciales ---%
Ec=[-99/100 1/5 k/5 1 2*k k*k;1/10 1/20 (-1/100+k) 1/2 (k/2-1/10) -k/10;0 0 -51/50 0 -1/5 -k/5;1 1 -1/5 -3/4 -1/10 1/100;0 0 -1/5 0 -11/10 1/50;0 0 0 0 0 -24/25];
Ecb=[-1;0;0;-1;0;-1];
V=inv(Ec)*Ecb;
disp('Valor de las variable de estado:')
V

P=[V(1,1) V(2,1) V(3,1);V(2,1) V(4,1) V(5,1);V(3,1) V(5,1) V(6,1)];
disp('Matriz P:')
P
%--- demostracion de si P es definida positiva ---%
P1=det(P(1:1 ,1:1));
disp('Primera Sub matriz:')
P1
P2=det(P(1:2 ,1:2));
disp('Segunda Sub matriz:')
P2
P3=det(P(1:3 ,1:3));
disp('Tercera Sub matriz:')
P3
%------------------------------------------------%

X=[x1 x2 x3];
L=X*P*transpose(X);
disp('Funcion de lyapunov:')
L

Ld=diff(L);
disp('Funcion de lyapunov derivada:')
Ld



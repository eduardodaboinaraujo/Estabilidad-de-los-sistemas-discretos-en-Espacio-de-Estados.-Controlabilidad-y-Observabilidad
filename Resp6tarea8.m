clc 
clear all

syms  L t

m1=1;%Kg
m2=2;%Kg
k1=13;%N
k2=6;%N
b1=5;%N

A=[0 1 0 0;0 -((k1-k2)/m1) -(b1/m1) -(k2/m1);0 0 0 1;-(k2/m2) 0 -(k2/m2) 0];
B=[0;1;0;0];
C=[0 1 0 0];
D=0;

To=0.01553;

suma=0;
M=rank(A);
i=A*inv(A);

for n=1:1:M 
    s = (A^n*t^n)/n + suma;
    suma=s;
    Phi=i+s;
    Bi=Phi*B;
    gamma=int(Bi,0,t);
end

Ad=double(subs(Phi,t,To));
Bd=double(subs(gamma,t,To));

%--- matriz de controlabilidad ---%
Co=[Bd Ad*Bd (Ad*Ad)*Bd (Ad*Ad*Ad)*Bd];
disp('La matriz de controlabilidad:')
Co
R=rank(Co);
disp('Rango de la matriz de controlabilidad:')
R

%--- Calculo de autovalores ---%
I=eye(4);
Ac=inv(L*I-Co);
disp('La matriz de controlabilidad con autovalores:')
Ac
P=det(Ac);
disp('Polinomio caracteristico:')
P

sys=[1 -75.458 -2.4682e+05 -9.5511e+09 1.6813e+17];
Au=roots(sys);
disp('Autovalores del sistema:')
Au




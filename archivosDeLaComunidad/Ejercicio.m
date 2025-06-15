%        10                10    
%FT= ------------- = ---------------
%    S(S+5)(S+1)     s^3+6*s^2+5*s
%Determinar la matriz de realimentación de estado K, para obtener un sistema que
%ubique los polos de lazo cerrado en s1 = -4.6, s2= -0.707-1.224j y s3=-0.707+1.224j, sin
%que exista ess para una entrada escalón unitario.

%Metodo 1:
A=[-6 1 0;-5 0 1;0 0 0];% Obtenemos la representacion en VE por medio del metodo de sacar factor comun de S con mayor exponente
B=[0;0;10];%
C=[1 0 0 ];%
D=[0];%

s=sym('s');
I=[1 0 0;0 1 0;0 0 1];%
k1=sym('k1'); k3=sym('k3'); k2=sym('k2');%
K=[k1 k2 k3];%
s*I-A+B*K;%
det(ans);%  s^3+10*s^2*k3+10*s*k2+6*s^2+60*s*k3+60*k2+5*s+50*k3+10*k1

([10 60 50;0 10 60;0 0 10])^-1*([9.2;8.5;6.014]-[0;5;6]);%Del polinomio obtenido en el paso anterior calculo los tres elementos de K
K=transpose(ans);

AA=A-B*K;% Calculo las matrices para el nuevo sistema teniendo en cuenta como va a ser la realimentacion
BB=B*K(1);%
CC=C;%
DD=D;%
[n1,d1]=ss2tf(AA,BB,CC,DD)% Calculamos como sera la nueva FT

%             -11.3660
%------------------------------------------
%    S^3 + 6.0140*S^2 + 8.5000*S + 9.2000

step(n1,d1)% Comprobamos la respuesta poniendo como entrada una funcion escalon.

disp('Presione una tecla para continuar');
pause;


%
%Metodo 2: (Extraido del Capitulo 3 del Ogata 3ra edicion)
%        10                10    
%FT= ------------- = ---------------
%    S(S+5)(S+1)     s^3+6*s^2+5*s%
a1=6;%
a2=5;%
a3=0;%
b0=0;%
b1=0;%
b2=0;%
b3=10;%

B0=b0;% 
B1=b1-a1*B0;%
B2=b2-a1*B1-a2*B0;%
B3=b3-a1*B2-a2*B1-a3*B0;%
B=[B1;B2;B3];%
A=[0 1 0;0 0 1;0 -5 -6]; 
C=[1 0 0];

s=sym('s');
I=[1 0 0;0 1 0;0 0 1];%
k1=sym('k1'); k3=sym('k3'); k2=sym('k2');%
K=[k1 k2 k3];%
s*I-A+B*K;%
det(ans);%  s^3+6*s^2+10*s^2*k3+5*s+10*s*k2+10*k1
([0 0 10;0 10 0;10 0 0])^-1*([6.014;8.5;9.2]-[6;5;0]);
K=transpose(ans);

AA=A-B*K;% Calculo las matrices para el nuevo sistema teniendo en cuenta como va a ser la realimentacion
BB=B*K(1);%
CC=C;%
DD=D;%
[n1,d1]=ss2tf(AA,BB,CC,DD)% Calculamos como sera la nueva FT

  %                 9.2
  %FT= ------------------------------------
  %     S^3 + 6.0140*S^2 + 8.5*S + 9.2


step(n1,d1)% Comprobamos la respuesta poniendo como entrada una funcion escalon.

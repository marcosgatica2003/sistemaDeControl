%La funcion de transferencia tiene el numerador
%igual a (s+15) y lo resuelvo mediante la forma que dice 
%el ogata en el punto 3.5 del capitulo 3, que es el que 
%aparentemente hay que usar cuando el numerador es diferente de 1. 

s= sym ('s');
SI=[s 0 0;0 s 0; 0 0 s];
A=[0 1 0; 0 0 1; 0 -8 -6]
B=[1;9;0]
C=[1 0 0]
F=C*inv(SI-A)*B         %funcion de transf. a lazo cerrado
K=[18 6 1]  

AA=A-B*K
BB=B*18                
CC=[1 0 0];
DD=[0];
FF=C*inv(SI-AA)*BB      %funcion de transf. a lazo cerrado compensada
step (AA,BB,CC,DD)
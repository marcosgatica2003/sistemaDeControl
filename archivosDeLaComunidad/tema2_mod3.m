%La funcion de transferencia tiene el numerador
%igual a 10 y lo resuelvo mediante la forma que dice 
%el ogata en el punto 3.5 del capitulo 3, que es el que 
%aparentemente hay que usar cuando el numerador es diferente de 1. 

s= sym ('s');
SI=[s 0 0;0 s 0; 0 0 s];
A=[0 1 0 ;0 0 1; 0 -5 -6]
B=[0;0;10]
C=[1 0 0]
F=C*inv(SI-A)*B         %funcion de transf. a lazo cerrado
K=[0.92 0.35 0]          
AA=A-B*K
BB=B*0.92                
CC=[1 0 0];
DD=[0];
FF=C*inv(SI-AA)*BB      %funcion de transf. a lazo cerrado compensada
step (AA,BB,CC,DD)
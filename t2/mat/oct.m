close all
clear all

%%EXAMPLE SYMBOLIC COMPUTATIONS

pkg load symbolic

fid=fopen("../data.txt","r")
gid=fopen("../sim/datang.txt","w")

data=fscanf(fid,"%f")

R1=data(1)*1000
R2=data(2)*1000
R3=data(3)*1000
R4=data(4)*1000
R5=data(5)*1000
R6=data(6)*1000
R7=data(7)*1000
Vs=data(8)
C =data(9)/1000000
Kb=data(10)/1000
Kd=data(11)*1000

fprintf(gid,"R1 1 2 %f\n", R1)
fprintf(gid,"R2 2 3 %f\n", R2)
fprintf(gid,"R3 2 5 %f\n", R3)
fprintf(gid,"R4 gnd 5 %f\n", R4)
fprintf(gid,"R5 5 6 %f\n", R5)
fprintf(gid,"R6 gnd 71 %f\n", R6)
fprintf(gid,"R7 72 8 %f\n", R7)
fprintf(gid,"Vs 1 gnd %f AC 1 sin(0 1 100k)\n", Vs)
fprintf(gid,"Vaux 71 72 DC 0\n")
fprintf(gid,"Hd 5 8 Vaux %f\n", Kd)
fprintf(gid,"Gb 6 3 2 5 %f\n", Kb)
fprintf(gid,"Ca 6 8 %f", C)

%%    Aquela hmhm dos nós
output_precision(12)
G1=1/R1
G2=1/R2
G3=1/R3
G4=1/R4
G5=1/R5
G6=1/R6
G7=1/R7
A = [-G1,G1+G2+G3,-G2,0,-G3,0,0,0;
0,-G2-Kb,G2,0,Kb,0,0,0;
0,Kb,0,0,-G5-Kb,G5,0,0;
0,0,0,-G6,0,0,G6+G7,-G7;
1,0,0,-1,0,0,0,0;
0,0,0,1,0,0,0,0;
0,0,0,-KcG6,1,0,KcG6,-1;
0,-G3,0,-G4,G4+G3+G5,-G5,-G7,G7]
B=[0;0;0;0;Va;0.0;0;0]V = A\B
%%%%%%%%%%%%%%%%%%%%%%%%%MEXXXXXXXXXXXXAs
VTESTE=10.
A = [R7+R6+R4+R5, -R3, -R5;
R4, R1-R3-R4, R3;
R5,-R3,-R5+R3+R2]
B = [VTESTE; 0; 0]
D = A\B
REQUIV = VTESTE/D(1)
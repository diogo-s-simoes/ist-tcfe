close all
clear all

%%EXAMPLE SYMBOLIC COMPUTATIONS

pkg load symbolic

output_precision(12)

fdata=fopen("../data.txt","r")
f1=fopen("../sim/data1.txt","w")
f2=fopen("../sim/data2.txt","w")
f3=fopen("../sim/data3.txt","w")
f4=fopen("../sim/data4.txt","w")
f5=fopen("../sim/data5.txt","w")

data=fscanf(fdata,"%f")

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

fprintf(f1,"R1 1 2 %.15f\n", R1)
fprintf(f1,"R2 2 3 %.15f\n", R2)
fprintf(f1,"R3 2 5 %.15f\n", R3)
fprintf(f1,"R4 gnd 5 %.15f\n", R4)
fprintf(f1,"R5 5 6 %.15f\n", R5)
fprintf(f1,"R6 gnd 71 %.15f\n", R6)
fprintf(f1,"R7 72 8 %.15f\n", R7)
fprintf(f1,"Vs 1 gnd %.15f AC 1 sin(0 1 100k)\n", Vs)
fprintf(f1,"Vaux 71 72 DC 0\n")
fprintf(f1,"Hd 5 8 Vaux %.15f\n", Kd)
fprintf(f1,"Gb 6 3 2 5 %.15f\n", Kb)
fprintf(f1,"Ca 6 8 %.15f", C)

fprintf(f2,"R1 1 2 %.15f\n", R1)
fprintf(f2,"R2 2 3 %.15f\n", R2)
fprintf(f2,"R3 2 5 %.15f\n", R3)
fprintf(f2,"R4 gnd 5 %.15f\n", R4)
fprintf(f2,"R5 5 6 %.15f\n", R5)
fprintf(f2,"R6 gnd 71 %.15f\n", R6)
fprintf(f2,"R7 72 8 %.15f\n", R7)
fprintf(f2,"Vs 1 gnd 0 AC 1 sin(0 1 100k)\n")
fprintf(f2,"Vaux 71 72 DC 0\n")
fprintf(f2,"Hd 5 8 Vaux %.15f\n", Kd)
fprintf(f2,"Gb 6 3 2 5 %.15f\n", Kb)
fprintf(f2,"Va 6 8 DC %.15f", 8.63481)

fprintf(f3,"R1 1 2 %.15f\n", R1)
fprintf(f3,"R2 2 3 %.15f\n", R2)
fprintf(f3,"R3 2 5 %.15f\n", R3)
fprintf(f3,"R4 gnd 5 %.15f\n", R4)
fprintf(f3,"R5 5 6 %.15f\n", R5)
fprintf(f3,"R6 gnd 71 %.15f\n", R6)
fprintf(f3,"R7 72 8 %.15f\n", R7)
fprintf(f3,"Vs 1 gnd 0 AC 1 sin(0 1 100k)\n")
fprintf(f3,"Vaux 71 72 DC 0\n")
fprintf(f3,"Hd 5 8 Vaux %.15f\n", Kd)
fprintf(f3,"Gb 6 3 2 5 %.15f\n", Kb)
fprintf(f3,"Va 6 8 DC %.15f", 8.63481)

fprintf(f4,"R1 1 2 %.15f\n", R1)
fprintf(f4,"R2 2 3 %.15f\n", R2)
fprintf(f4,"R3 2 5 %.15f\n", R3)
fprintf(f4,"R4 gnd 5 %.15f\n", R4)
fprintf(f4,"R5 5 6 %.15f\n", R5)
fprintf(f4,"R6 gnd 71 %.15f\n", R6)
fprintf(f4,"R7 72 8 %.15f\n", R7)
fprintf(f4,"Vs 1 gnd 0 AC 1 sin(0 1 100k)\n")
fprintf(f4,"Vaux 71 72 DC 0\n")
fprintf(f4,"Hd 5 8 Vaux %.15f\n", Kd)
fprintf(f4,"Gb 6 3 2 5 %.15f\n", Kb)
fprintf(f4,"Va 6 8 DC %.15f", 8.63481)

fprintf(f5,"R1 1 2 %.15f\n", R1)
fprintf(f5,"R2 2 3 %.15f\n", R2)
fprintf(f5,"R3 2 5 %.15f\n", R3)
fprintf(f5,"R4 gnd 5 %.15f\n", R4)
fprintf(f5,"R5 5 6 %.15f\n", R5)
fprintf(f5,"R6 gnd 71 %.15f\n", R6)
fprintf(f5,"R7 72 8 %.15f\n", R7)
fprintf(f5,"Vs 1 gnd 0 AC 1 sin(0 1 100k)\n")
fprintf(f5,"Vaux 71 72 DC 0\n")
fprintf(f5,"Hd 5 8 Vaux %.15f\n", Kd)
fprintf(f5,"Gb 6 3 2 5 %.15f\n", Kb)
fprintf(f5,"Va 6 8 DC %.15f", 8.63481)

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
<<<<<<< HEAD
0,0,0,1,0,0,0,0;
0,0,0,-Kd*G6,1,0,Kd*G6,-1;
0,-G3,0,-G4,G4+G3+G5,-G5,-G7,G7]

B=[0;0;0;0;Vs;0.0;0;0]

V = A\B

=======
0,0,0,1,0,0,0,0; 
0,0,0,-Kd*G6,1,0,Kd*G6,-1;
0,-G3,0,-G4,G4+G3+G5,-G5,-G7,G7]
B=[0;0;0;0;Vs;0.0;0;0]
V = A\B
>>>>>>> ccff7faf91e36f8addbdf19f5a2f7731831e6072
%%%%%%%%%%%%%%%%%%%%%%%%%MEXXXXXXXXXXXXAs

VTESTE=V(6)-V(8)

A = [R7+R6+R4+R5, -R3, -R5;
R4, R1-R3-R4, R3;
R5,-R3,-R5+R3+R2]

B = [VTESTE; 0; 0]

D = A\B
REQUIV = VTESTE/D(1)

fprintf(gid,"%f\n",REQUIV)


%%%SOLUÇÂO FORÇADA


x=0:.1:20;
plot(x, (V(6)-V(8))*exp(-x/1000/REQUIV/C))

title("Capacitor natural solution")

xlabel("t(ms)")

ylabel("V_{6n}(V)")




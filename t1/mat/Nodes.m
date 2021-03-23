close all
clear all

output_precision(12)

R1 = 1.04140403815e3
R2 = 2.06425750627e3 
R3 = 3.01346586287e3
R4 = 4.09638762559e3 
R5 = 3.04195770117e3 
R6 = 2.04936997612e3 
R7 = 1.01919058582e3 
Va = 5.1361224873 
Id = 1.03201034448e-3 
Kb = 7.16043663039e-3 
Kc = 8.19579707039e3

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
    0,0,0,0,0,0,0,1;
    0,0,0,-Kc*G6,1,0,Kc*G6,-1;
    0,-G3,0,-G4,G4+G3+G5,-G5,-G7,G7]
    
B=[0;0;Id;0;Va;0.0;0;-Id]

V = A\B

printf("\n\n***********************************\n\n")

VA=V(1)
VB=V(2)
VC=V(3)
VD=V(4)
VE=V(5)
VF=V(6)
VG=V(7)
VH=V(8)

I1=(V(1)-V(2))*G1
I2=(V(2)-V(3))*G2
I3=(V(2)-V(5))*G3
I4=(V(4)-V(5))*G4
I5=(V(5)-V(6))*G5
I6=(V(4)-V(7))*G6
I7=(V(7)-V(8))*G7
IA=I1
ID=Id
IC=I7-ID
IB=Kb*R3*I3

filename="nodes.tex"
fid=fopen(filename,"w")

fprintf(fid, "VA & %.11fV \\\\ \\hline \n", VA)
fprintf(fid, "VB & %.11fV \\\\ \\hline \n", VB)
fprintf(fid, "VC & %.11fV \\\\ \\hline \n", VC)
fprintf(fid, "VD & %.11fV \\\\ \\hline \n", VD)
fprintf(fid, "VE & %.11fV \\\\ \\hline \n", VE)
fprintf(fid, "VF & %.11fV \\\\ \\hline \n", VF)
fprintf(fid, "VG & %.11fV \\\\ \\hline \n", VG)
fprintf(fid, "VH & %.11fV \\\\ \\hline \n", VH)

fprintf(fid, "I1 & %.11fA \\\\ \\hline \n", I1)
fprintf(fid, "I2 & %.11fA \\\\ \\hline \n", I2)
fprintf(fid, "I3 & %.11fA \\\\ \\hline \n", I3)
fprintf(fid, "I4 & %.11fA \\\\ \\hline \n", I4)
fprintf(fid, "I5 & %.11fA \\\\ \\hline \n", I5)
fprintf(fid, "I6 & %.11fA \\\\ \\hline \n", I6)
fprintf(fid, "I7 & %.11fA \\\\ \\hline \n", I7)
fprintf(fid, "Ia & %.11fA \\\\ \\hline \n", IA)
fprintf(fid, "Ib & %.11fA \\\\ \\hline \n", IB)
fprintf(fid, "Ic & %.11fA \\\\ \\hline \n", IC)
fprintf(fid, "Id & %.11fA \\\\ \\hline \n", ID)
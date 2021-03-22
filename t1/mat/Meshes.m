close all
clear all

output_precision(12)

Va = 5.1361224873

Kb = 7.16043663039e-3
Kc = 8.19579707039e3
Id = 1.03201034448e-3

R1 = 1.04140403815e3
R2 = 2.06425750627e3 
R3 = 3.01346586287e3
R4 = 4.09638762559e3
R5 = 3.04195770117e3
R6 = 2.04936997612e3
R7 = 1.01919058582e3


A = [R1+R3+R4, -R3, -R4, 0; 
    -Kb*R3, Kb*R3-1,0,0; 
    -R4,0,R4+R6+R7-Kc,0;
    0, 0, 0,1]
B = [Va; 0; 0; -Id]

D = A\B 

V7 = R7* D(3)
VG = -V7
V6 = R6* D(3)
VD= VG- V6

VA= VD+ Va
V1= R1* D(1)
VB= VA- V1
V2= R2* D(2)
VC= VB- V2

VE= -Kc* D(3)

V5= R5*(D(4)-D(2))
VF= VE-V5

printf("\n\n***********************************\n\n")

VA
VB
VC
VD
VE
VF
VG
VH=0.0

I1=D(1)
I2=D(2)
I3=D(1)-D(2)
I4=D(3)-D(1)
I5=D(4)-D(2)
I6=-D(3)
I7=I6
IA=D(1)
ID=-D(4)
IC=-D(3)+D(4)
IB=-D(2)
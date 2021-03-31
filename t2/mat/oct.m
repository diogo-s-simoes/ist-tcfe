close all
clear all

%%EXAMPLE SYMBOLIC COMPUTATIONS

pkg load symbolic

fid=fopen("../data.txt","r")
gid=fopen("../sim/datang.txt","w")

data=fscanf(fid,"%f")

R1=data(1)
R2=data(2)
R3=data(3)
R4=data(4)
R5=data(5)
R6=data(6)
R7=data(7)
Vs=data(8)
C =data(9)
Kb=data(10)
Kd=data(11)

fprintf(gid,"R1 1 2 %f", R1)
fprintf(gid,"R2 2 3 %f", R2)
fprintf(gid,"R3 2 5 %f", R3)
fprintf(gid,"R4 gnd 5 %f", R4)
fprintf(gid,"R5 5 6 %f", R5)
fprintf(gid,"R6 gnd 7 %f", R6)
fprintf(gid,"R7 7 8 %f", R7)
fprintf(gid,"Vs 1 gnd %f", R1)

*Voltage Sources
Vaux G1 G2 DC 0
Va A D DC 5.1361224873
Hc E gnd Vaux 8.19579707039k

*Current Sources
Id gnd F DC 1.03201034448m
Gb F C B E 7.16043663039m

syms t
syms R
syms C
syms vi(t)
syms vo(t)
syms i(t)

i(t)=C*diff(vo,t)

printf("\n\nKVL equation:\n");

vi(t) = R*i(t)+vo(t)

syms vo_n(t) %natural solution
syms vo_f(t) %forced solution

printf("\n\nSolution is of the form");

v(t) = vo_n(t) + vo_f(t)

printf("\n\nNatural solution:\n");
syms A
syms wn

vi(t) = 0 %no excitation
i_n(t) = C*diff(vo_n, t)


printf("\n\n Natural solution is of the form");
vo_n(t) = A*exp(wn*t)

R*i_n(t)+vo_n(t) == 0

R*C*wn*vo_n(t)+vo_n(t) == 0

R*C*wn+1==0

solve(ans, wn)


%%EXAMPLE NUMERIC COMPUTATIONS

printf("AAAAA")

R=1e3 %Ohm
C=100e-9 %F

f = 1000 %Hz
w = 2*pi*f; %rad/s

%time axis: 0 to 10ms with 1us steps
t=0:1e-6:10e-3; %s

Zc = 1/(j*w*C)
Cgain = Zc/(R+Zc)
Gain = abs(Cgain)
Phase = angle(Cgain)

vi = 1*cos(w*t);
vo = Gain*cos(w*t+Phase);

hf = figure ();
plot (t*1000, vi, "g");
hold on;
plot (t*1000, vo, "b");

xlabel ("t[ms]");
ylabel ("vi(t), vo(t) [V]");
print (hf, "forced.eps", "-depsc");

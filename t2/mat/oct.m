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
fprintf(f3,"Vs 1 gnd DC 0\n")
fprintf(f3,"Vaux 71 72 DC 0\n")
fprintf(f3,"Hd 5 8 Vaux %.15f\n", Kd)
fprintf(f3,"Gb 6 3 2 5 %.15f\n", Kb)
fprintf(f3,"Ca 6 8 %.15f", C)

fprintf(f4,"R1 1 2 %.15f\n", R1)
fprintf(f4,"R2 2 3 %.15f\n", R2)
fprintf(f4,"R3 2 5 %.15f\n", R3)
fprintf(f4,"R4 gnd 5 %.15f\n", R4)
fprintf(f4,"R5 5 6 %.15f\n", R5)
fprintf(f4,"R6 gnd 71 %.15f\n", R6)
fprintf(f4,"R7 72 8 %.15f\n", R7)
fprintf(f4,"Vs 1 gnd %.15f AC 1 sin(0 1 1k)\n", Vs)
fprintf(f4,"Vaux 71 72 DC 0\n")
fprintf(f4,"Hd 5 8 Vaux %.15f\n", Kd)
fprintf(f4,"Gb 6 3 2 5 %.15f\n", Kb)
fprintf(f4,"Ca 6 8 %.15f", C)

fprintf(f5,"R1 1 2 %.15f\n", R1)
fprintf(f5,"R2 2 3 %.15f\n", R2)
fprintf(f5,"R3 2 5 %.15f\n", R3)
fprintf(f5,"R4 gnd 5 %.15f\n", R4)
fprintf(f5,"R5 5 6 %.15f\n", R5)
fprintf(f5,"R6 gnd 71 %.15f\n", R6)
fprintf(f5,"R7 72 8 %.15f\n", R7)
fprintf(f5,"Vs 1 gnd %.15f AC 1 sin(0 1 1k)\n", Vs)
fprintf(f5,"Vaux 71 72 DC 0\n")
fprintf(f5,"Hd 5 8 Vaux %.15f\n", Kd)
fprintf(f5,"Gb 6 3 2 5 %.15f\n", Kb)
fprintf(f5,"Ca 6 8 %.15f", C)

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
0,0,0,-Kd*G6,1,0,Kd*G6,-1;
0,-G3,0,-G4,G4+G3+G5,-G5,-G7,G7]

B=[0;0;0;0;Vs;0.0;0;0]

V = A\B







%%%%%%%%%%%%%%%%%%%%%%%%%MEXXXXXXXXXXXXAs

VTESTE=V(6)-V(8)

Ae = [R1+R3+R4, -R3, -R4, 0; 
    -Kb*R3, Kb*R3-1,0,0; 
    -R4,0,R4+R6+R7-Kd,0;
    0, -R5, Kd,R5]
    
Be = [0; 0; 0; V(6)-V(8)]

De = Ae\Be
REQUIV = VTESTE/De(4)

filename="Tnegative.tex"
fid=fopen(filename,"w")

fprintf(fid, "V_1 & %.11fV \\\\ \\hline \n", V(1))
fprintf(fid, "V_2 & %.11fV \\\\ \\hline \n", V(2))
fprintf(fid, "V_3 & %.11fV \\\\ \\hline \n", V(3))
fprintf(fid, "V_4 & %.11fV \\\\ \\hline \n", V(4))
fprintf(fid, "V_5 & %.11fV \\\\ \\hline \n", V(5))
fprintf(fid, "V_6 & %.11fV \\\\ \\hline \n", V(6))
fprintf(fid, "V_7 & %.11fV \\\\ \\hline \n", V(7))
fprintf(fid, "V_8 & %.11fV \\\\ \\hline \n", V(8))


Id=-((V(5)-V(4))/R4+(V(5)-V(2))/R3+(V(5)-V(6))/R5)

fprintf(fid, "I_1 & %.11fV \\\\ \\hline \n", (V(1)-V(2))/R1)
fprintf(fid, "I_2 & %.11fV \\\\ \\hline \n", (V(2)-V(3))/R2)
fprintf(fid, "I_3 & %.11fV \\\\ \\hline \n", (V(2)-V(5))/R3)
fprintf(fid, "I_4 & %.11fV \\\\ \\hline \n", (V(4)-V(5))/R4)
fprintf(fid, "I_5 & %.11fV \\\\ \\hline \n", (V(5)-V(6))/R5)
fprintf(fid, "I_6 & %.11fV \\\\ \\hline \n", (V(4)-V(7))/R6)
fprintf(fid, "I_7 & %.11fV \\\\ \\hline \n", (V(7)-V(8))/R7)
fprintf(fid, "I_S & %.11fV \\\\ \\hline \n", -(V(1)-V(2))/R1)
fprintf(fid, "I_b & %.11fV \\\\ \\hline \n", Kb*(V(2)-V(5)))
fprintf(fid, "I_c & %.11fV \\\\ \\hline \n", -((V(8)-V(7))/R7-Id))
fprintf(fid, "I_e & %.11fV \\\\ \\hline \n", Id)







filename2="EQUIV.tex"
fid2=fopen(filename2,"w")

fprintf(fid2, "V_x & %.11fV \\\\ \\hline \n", V(6)-V(8))
fprintf(fid2, "I_x & %.11fV \\\\ \\hline \n", De(4))
fprintf(fid2, "R_{equiv} & %.11fV \\\\ \\hline \n", REQUIV)





%%%SOLUÇÂO NATURAL


x=0:.1:20;
plot(x, (V(6)-V(8))*exp(-x/1000/R5/C))

title("Capacitor natural solution")

xlabel("t(ms)")

ylabel("V_{6n}(V)")

print -color -depsc natural.eps

close

teste=V(6)*exp(-7.028/1000/R5/C)

%%%SOLUÇÃO FORCADA

OMEGA=2*pi*1000

Af = [-G1,G1+G2+G3,-G2,0,-G3,0,0,0;
0,-G2-Kb,G2,0,Kb,0,0,0;
0,Kb,0,0,-G5-Kb,G5+(C*OMEGA*i),0,-(C*OMEGA*i);
0,0,0,-G6,0,0,G6+G7,-G7;
1,0,0,-1,0,0,0,0;
0,0,0,1,0,0,0,0;
0,0,0,-Kd*G6,1,0,Kd*G6,-1;
0,-G3,0,-G4,G4+G3+G5,-G5-(C*OMEGA*i),-G7,G7+(C*OMEGA*i)]

Bf=[0;0;0;0;i;0.0;0;0]

Vf = Af\Bf



filename1="Phasors.tex"
fid1=fopen(filename1,"w")

fprintf(fid1, "Z1 & %.11fV \\\\ \\hline \n", Vf(1))
fprintf(fid1, "Z2 & %.11fV \\\\ \\hline \n", Vf(2))
fprintf(fid1, "Z3 & %.11fV \\\\ \\hline \n", Vf(3))
fprintf(fid1, "Z4 & %.11fV \\\\ \\hline \n", Vf(4))
fprintf(fid1, "Z5 & %.11fV \\\\ \\hline \n", Vf(5))
fprintf(fid1, "Z6 & %.11fV \\\\ \\hline \n", Vf(6))
fprintf(fid1, "Z7 & %.11fV \\\\ \\hline \n", Vf(7))
fprintf(fid1, "Z8 & %.11fV \\\\ \\hline \n", Vf(8))




%%  T H E   F I N A L   S O L U T I O N

x1=-5:.01:0;

x2=0:.01:20;

y1=Vs+x1*0

y2=V(6)+x1*0

y3=-real(Vf(6)*exp((x2*OMEGA/1000)*i))+(V(6)-V(8))*exp(-x2/1000/R5/C)

y4=sin(OMEGA*x2/1000)

plot(x2,y3,"color", 'r')
hold on
plot(x2,y4,"color",'b')
hold on
plot(x1,y1,"color",'b')
hold on
plot(x1,y2,"color",'r')

title("Capacitor total forced solution")

xlabel("t(ms)")

ylabel("V_{6n}(V)")

print -color -depsc forced.eps

close

%% Frequency Response

v6mag = ones(1,100)
vcmag = ones(1,100)
v6phase = ones(1,100)
vcphase = ones(1,100)

logvec=logspace(-1,6,100)

for f = 1:100

ofreq = 2*pi*logvec(f)

Afreq = [-G1,G1+G2+G3,-G2,0,-G3,0,0,0;
0,-G2-Kb,G2,0,Kb,0,0,0;
0,Kb,0,0,-G5-Kb,G5+(C*ofreq*i),0,-(C*ofreq*i);
0,0,0,-G6,0,0,G6+G7,-G7;
1,0,0,-1,0,0,0,0;
0,0,0,1,0,0,0,0;
0,0,0,-Kd*G6,1,0,Kd*G6,-1;
0,-G3,0,-G4,G4+G3+G5,-G5-(C*ofreq*i),-G7,G7+(C*ofreq*i)]

Bfreq=[0;0;0;0;i;0.0;0;0]

Vfreq = Afreq\Bfreq

v6mag(f)=abs(Vfreq(6))
vcmag(f)=abs(Vfreq(6)-Vfreq(8))
v6phase(f)=arg(Vfreq(6))
vcphase(f)=arg(Vfreq(6)-Vfreq(8))
endfor

vsfreq=ones(1,100)
semilogx(logspace(-1,6,100), 20*log(v6mag)/log(10), "color", 'r')
hold on
semilogx(logspace(-1,6,100), 20*log(vcmag)/log(10), "color", 'g')
hold on
semilogx(logspace(-1,6,100), 20*log(vsfreq)/log(10), "color", 'b')

title("Frequency Response (magnitude)")

xlabel("f(Hz)")

ylabel("V_{6}(dB)")

print -color -depsc dB.eps

close

semilogx(logspace(-1,6,100), v6phase*180/pi, "color", 'r')
hold on
semilogx(logspace(-1,6,100), vcphase*180/pi, "color", 'g')
hold on
semilogx(logspace(-1,6,100), vsfreq-1, "color", 'b')

title("Frequency Response (phase)")

xlabel("f(Hz)")

ylabel("Phase (º)")

print -color -depsc degree.eps

close



asdfg=abs(Vf(6))
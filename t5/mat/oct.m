R1=1000
R2=500
R3=100000
R4=1000
C1=220e-9
C2=220e-9

#T=R1*C1*i*w/(1+R1*C1*i*w)*(1+R3/R4)*1/(1+R2*C2*i*w)

wl=1/(R1*C1)
wh=1/(R2*C2)
wo=sqrt(wh*wl)

# 2nd part

w=wo
Zo=75
Zi=2e6
Ao=10
Vi=1

f=logspace(1,8,70)
res = zeros(1,length(f))
teo = zeros(1,length(f))



for i=1:length(f)
w=2*pi*f(i)

A = [C1*w*i+1/R1+1/Zi,0,0,-1/Zi,0;
-Ao,1,0,Ao,0;
0,-1/Zo,1/R2+1/Zo+1/R3,-1/R3,-1/R2;
-1/Zi,0,-1/R3,1/R3+1/R4+1/Zi,0;
0,0,-1/R2,0,1/R2+C2*w*i]
    
B=[Vi*C1*w*i;0;0;0;0]

V=A\B

res(i)=V(5)

teo(i)=(R1*C1*i*w)/(1+R1*C1*i*w)*(1+R3/R4)/(1+R2*C2*i*w)

endfor

semilogx(f, 20*log(abs(res)), "color", 'b')
title("Gain (dB)")
xlabel("f(Hz)")
ylabel("V(dB)")
print -color -depsc t5dB.eps

close

semilogx(f, 20*log(abs(teo)), "color", 'r')
title("Gain (dB)")
xlabel("f(Hz)")
ylabel("V(dB)")
print -color -depsc teodB.eps

w=sqrt(wh*wl)
E = [C1*w*i+1/R1+1/Zi,0,0,-1/Zi,0;
-Ao,1,0,Ao,0;
0,-1/Zo,1/R2+1/Zo+1/R3,-1/R3,-1/R2;
-1/Zi,0,-1/R3,1/R3+1/R4+1/Zi,0;
0,0,-1/R2,0,1/R2+C2*w*i]
    
F=[Vi*C1*w*i;0;0;0;0]

VHELP=E\F

I1=(Vi-VHELP(1))*C1*w*i

Zin=Vi/I1

printf("%d",Zin)

C=[0;0;0;Vi*C2*w*i]



D = [C1*w*i+1/R1+1/Zi,0,0,-1/Zi;
-Ao,1,0,Ao;
0,-1/Zo,1/R2+1/Zo+1/R3,-1/R3;
-1/Zi,0,-1/R3,1/R3+1/R4+1/Zi]

Vio=D\C

I2=(Vi-Vio(4))*R2

Zio=Vi/I2

aux=1

[nome,cent]=max(res)

maxim = 20*log(abs(max(res)))

for i=1:length(f)
  
if(20*log(abs(res(i)))>maxim-3)
if(aux<2)
 aux=20
 limm=f(i)
endif
endif

aux
20*log(abs(res(i)))

if(20*log(abs(res(i)))<maxim-3)
if(aux>10)
 aux=5
 limM=f(i)
endif
endif

endfor

bandwidth=limM-limm
wo
f(cent)
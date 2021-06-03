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

endfor

semilogx(f, 20*log(abs(res)), "color", 'b')
title("Gain (dB)")
xlabel("f(Hz)")
ylabel("V(dB)")

print -color -depsc t5dB.eps
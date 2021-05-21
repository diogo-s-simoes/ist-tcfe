Vc = 12.0
f=1e3
Vs = 1
Rs = 100
Ci = 1e-3
Rb1 = 80e3
Rb2 =20e3
Rc = 1e3
Re =100
Ce = 1e-3

%Q1
Von=0.7
Vt=25e-3
Bf1=178.7
Va1=69.7

%Q2
Bf2=227.3
Va2=37.2

Rd = 100
Co = 1e-6
Rl = 8

Rb=(Rb1*Rb2)/(Rb1+Rb2)
Veq=Rb2/(Rb1+Rb2)*Vc
Ib1=(Veq-Von)/(Rb+(1+Bf1)*Re)
Ie1=(1+Bf1)*Ib1
Ic1=Bf1*Ib1
Vo1=Vc-Rc*Ic1
Ve=Re*Ie1
Vce=Vo1-Ve

Gm1=Ic1/Vt
Rp1=Bf1/Gm1
Ro1=Va1/Ic1

Gain1=-Gm1*Rc*Rp1*Ro1/((Ro1+Rc)*(Rb+Rp1))

Zi1=((Ro1+Rc+Re)*(Rb+Rp1+Re)+Gm1*Re*Ro1*Rp1-Re*Re)/(Ro1+Rc+Re)
Zo1 = 1/(1/(Ro1*((Rb+Rp1)*Re/(Rb+Rp1+Re))/(1/(1/Ro1+1/(Rp1+Rb)+1/Re+Gm1*Rp1/(Rp1+Rb))))+1/Rc)

Vi=Vo1
Ie2=(Vc-Von-Vi)/Rd
Vo2=Vc-Rd*Ie2
Ic2 = Bf2/(Bf2+1)*Ie2
Gm2=Ic2/Vt
Rp2=Bf2/Gm2
Ro2=Va2/Ic2
Gp2=1/Rp2
Ge2=1/Rd
Go2=1/Ro2

Zi2=(Gp2+Ge2+Go2+Gm2)/(Gp2*(Gp2+Ge2+Go2))
Zo2=1/(Gp2+Ge2+Go2+Gm2)

Gain2 = Gm2/(Gp2+Ge2+Go2+Gm2)

GainT=Gain1*Gain2

%Frequency analysis
Vix=complex(Vs)
f=logspace(1,8,70)
res = zeros(1,length(f))

for i=1:length(f)
w=2*pi*f(i)
Z1=Rs+Rb+1/(i*w*Ci)

M=[Z1+Re,-Re,0,0;
    -Re,Re+1/(i*w*Ce),-1/(i*w*Ce),0;
    0,-1/(i*w*Ce),1/(i*w*Ce)+Ro1+Rc,-Ro1;
    Gm1*Rp1,0,0,1]

b=[Vix;0;0;0]
A=M\B

res(i)=A(3)*Rc
endfor

semilogx(f, 20*log(res)/log(10), "color", 'b')
title("Gain in stage 1 (dB)")
xlabel("f(Hz)")
ylabel("V(2)(dB)")
legend ({"dB(V(6))","dB(V(6)-V(8))", "dB(V(1))"}, "location", "east")


print -color -depsc vo1.eps

close

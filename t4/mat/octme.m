Vc = 12.0
f=1e3
Vs = 10e-3
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
Veq=-Rb2/(Rb1+Rb2)
Ib1=(Veq-Von)/(Rb+(1+Bf1)*Re)
Ie1=(1+Bf1)*Ib1
Ic1=Bf1*Ib1
Vo1=Vc-Rc*Ic1
Ve=Re*Ie1
Vce=Vo1-Ve

Gm1=Ic1/Vt
Rp1=Bf1/Gm1
Ro1=Va1/Ic1

Gain1=-Gm*Rc*Rp*Ro/((Ro+Rc)*(Rb+Rp))

Zi1=((Ro1+Rc+Re)*(Rb+Rp1+Re)+Gm1*Re*Ro1*Rp1-Re*Re)/(Ro1+Rc+Re)
Zo1=1/(1/Rc+(1/(1/Ro1+1/Rp1)+1/(1/Rb+1/Re+(Gm1*Rp1)/(Rp1+Rb)))/(Ro1*(1/(1/(Rb+Rp1)+1/Re))))

Vi=Vo1
Ie2=(Vc-Von-Vi)/Rd
Vo2=Vc-Rd*Ie2

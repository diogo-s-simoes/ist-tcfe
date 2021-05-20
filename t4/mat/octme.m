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
Bf=178.7
Va=69.7

%Q2

Rd = 100
Co = 1e-6
Rl = 8

Rb=(Rb1*Rb2)/(Rb1+Rb2)
Veq=-Rb2/(Rb1+Rb2)
Ib=(Veq-Von)/(Rb+(1+Bf)*Re)
Ie=(1+Bf)*Ib
Ic=Bf*Ib
Vo=Vc-Rc*Ic
Ve=Re*Ie
Vce=Vo-Ve

Gm=Ic/Vt
Rp=Bf/Gm
Ro=Va/Ic

Gain1=-Gm*Rc*Rp*Ro/((Ro+Rc)*(Rb+Rp))


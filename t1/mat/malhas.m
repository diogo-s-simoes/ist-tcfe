pkg load symbolic

syms Va
syms IB
syms Vc
syms VD
syms R1
syms R2
syms R3
syms R4
syms R5
syms R6
syms R7
Z = vpa(0.0)

A = [R1+R3+R4, Z, Z, R3+R4; Z,1,0,0; R4,Z,R4+R6+R7,Z;Z, Z, Z,1]
B = [Va; IB; Vc; ID]

A\B

print(A\B)
close all 
clear all
f=50;
w=2*pi*f;
R1=3.7224e3
C1=3.7224e-6
R2=15e3
C2=15e-6
R3=10e3
C3=10e-6

%print("AAAAAAAAA")

%envelope detector
A=20
t=linspace(0, 0.1, 1000);
vS = A * cos(w*t);
vOhr = zeros(1, length(t));
vO = zeros(1, length(t));
vLpf = zeros(1, length(t));
vEn = zeros(1, length(t));
vF = zeros(1, length(t));
vF2 = zeros(1, length(t));

vOFF=12.03;
vOnexp = A*cos(w*vOFF)*exp(-(t-vOFF)/R1/C1);

figure
for i=1:length(t)
  if (vS(i) > 0 || -vS(i)<0)
    vOhr(i) = vS(i);
  else
    vOhr(i) = -vS(i);
  endif
endfor

#plot(t*1000, vOhr)
hold

%print("AAAAAAAAA")

for i=1:length(t)
  for k=1:100
  #vO = A/sqrt(1+w^2*R^2*C^2) * cos(w*t - atan(w*R*C));
    vLpf(i)=vLpf(i)+1/(4*k*k-1)/sqrt(1+(2*k*w)^2*R1^2*C1^2)*cos(2*k*w*t(i)-atan(2*k*w*R1*C1));
  endfor
  vLpf(i)=A*2/pi-A*4/pi*vLpf(i)
  #vLpf(i)*=vS(1)
endfor

for i=1:length(t)
  if vLpf(i) < vOFF
    vO(i) = vLpf(i)
  #elseif vOnexp(i) > vOhr(i)
  #  vO(i) = 0;
  else 
    vO(i) = vOFF;
  endif
endfor

boo=1
tOFF=0
vHold=0
#envelope
for i=1:(length(t)-1)
  if ((boo==1)&&((vO(i+1)-vO(i))/(t(i+1)-t(i)) < -vO(i)/C2/R2))
    boo=0;
    tOFF=t(i)
    vHold=vO(i)
  endif
  if boo==0
    vEn(i)=vHold*exp(-(t(i)-tOFF)/R2/C2)
  else
    vEn(i)=vO(i)
  endif  
  if ((boo==0)&&(vEn(i)<vO(i)))
    boo=1
  endif
endfor
vEn(length(t))=vEn(length(t)-1)

vF(1)=12
h=0.1/1000
for i=1:(length(t)-1)
  vF(i+1)=vF(i)+h*(vEn(i)/R3/C3-vF(i)/R3/C3)
endfor

max=0
min=20
avg=0
for i=1:length(t)
  avg+=vF(i)
  if(vF(i)>max)
    max=vF(i)
  endif
  if(vF(i)<min)
    min=vF(i)
  endif
endfor
avg/=length(t)

printf("Ripple=%f\nAverage=%f\n", max-min, avg)

plot(t*1000, vO, "b")
title("Envelope detector voltage")
xlabel ("t[ms]")
ylabel ("V[V]")
hold on;
plot(t*1000, vEn, "r")
legend("rectified","envelope")
print ("venvelope.eps", "-depsc");

plot(t*1000, vO, "b")
title("Output voltage v_o(t)")
xlabel ("t[ms]")
ylabel ("V[V]")
hold on;
plot(t*1000, vEn, "r")
hold on;
plot(t*1000, vF, "g")
legend("rectified","envelope", "output")
print ("voutput.eps", "-depsc");

vF(1)=0
h=0.1/1000
for i=1:(length(t)-1)
  vF(i+1)=vF(i)+h*(vEn(i)/R3/C3-vF(i)/R3/C3)
endfor

plot(t*1000, vO, "b")
title("Output voltage v_o(t)")
xlabel ("t[ms]")
ylabel ("V[V]")
hold on;
plot(t*1000, vEn, "r")
hold on;
plot(t*1000, vF, "g")
legend("rectified","envelope", "output")
print ("voutput_init.eps", "-depsc");
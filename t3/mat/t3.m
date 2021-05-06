close all 
clear all
f=50;
w=2*pi*f;
R=1e3
C=1e-6

%print("AAAAAAAAA")

%envelope detector
A=30
t=linspace(0, 20e-3, 1000);
vS = A * cos(w*t);
vOhr = zeros(1, length(t));
vO = zeros(1, length(t));
vLpf = zeros(1, length(t));

%tOFF = 1/w * atan(1/w/R/C);
tOFF=20;
vOnexp = A*cos(w*tOFF)*exp(-(t-tOFF)/R/C);

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
    vLpf(i)=vLpf(i)+1/(4*k*k-1)/sqrt(1+(2*k*w)^2*R^2*C^2)*cos(2*k*w*t(i)-atan(2*k*w*R*C));
  endfor
  vLpf(i)=A*2/pi-A*4/pi*vLpf(i)
  #vLpf(i)*=vS(1)
endfor

for i=1:length(t)
  if vLpf(i) < tOFF
    vO(i) = vLpf(i)
  #elseif vOnexp(i) > vOhr(i)
  #  vO(i) = 0;
  else 
    vO(i) = tOFF;
  endif
endfor

plot(t*1000, vO)
title("Output voltage v_o(t)")
xlabel ("t[ms]")
legend("rectified","envelope")
print ("venvlope.eps", "-depsc");

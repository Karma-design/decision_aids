function [ y ] = f1(pv,c,t,q,pa)
%Calcul du b�n�fice total
y = (pv-pa*q-c*(t/60).');
end


function [ y ] = f1(pv,c,t,q,pa)
%Calcul du bénéfice total
y = (pv-pa*q-c*(t/60).');
end


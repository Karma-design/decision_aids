function [ X ] = respPersonnel(t,A,b,lb,bene )

m = [1; 0; 0; 0; 1; 0; 0];
f = t*m;

A = [A;];
b = [b;bene];

X = linprog(f,A,b,[],[],lb,[]);

end


function [ X ] = f5(t,A,b,lb,vectBene,coeffBene)

	m = [1; 0; 0; 0; 1; 0; 0];
	f = t*m;

	A = [A;-vectBene];
	b = [b;-coeffBene];

	X = linprog(f,A,b,[],[],lb,[]);

end

function [ X ] = f4(A,b,lb,vectBenef)

	tempA = [A;1 ,1 ,1 ,-1 ,-1 ,-1];

	tempb = [b;0]; %le chiffre indiqué ici représente l'écart entre les deux familles

	X = linprog(-vectBenef,tempA,tempb,[],[],lb,[]);

end

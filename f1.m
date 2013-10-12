function [ X ] = f1(vectBenef,A,b,lb)

	X = linprog(-vectBenef,A,b,[],[],lb,[]);

end


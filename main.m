[ A,b,lb,t,q,pv,pa,c ] = contraintes();
% Calcul du vecteur que Ahmed voulait
vectBenef = -f1(pv,c,t,q,pa);
% Q1. Calcul du nombre de produits finis
X1 = linprog(vectBenef,A,b,[],[],lb,[]);
% Q4. Calcul du nombre de produits créés en minimisant l'écart de production
%entre les familles de produit (arbitrairement, écart limité à 3).
tempA = [A;1 ,1 ,1 ,-1 ,-1 ,-1];
tempb = [b;0]; %le chiffre indiqué ici représente l'écart entre les deux familles
X4 = linprog(vectBenef,tempA,tempb,[],[],lb,[]);
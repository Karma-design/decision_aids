%AIDE A LA DECISION: programmation lin�aire
%Choix du plan de production de l'entreprise AD�cision
close all;
clear;

% d�finition des param�tres du probl�me � mod�liser

% Q : quantit� maximum de mati�res premi�re dans le stock
% Colonnes : Mati�res premi�res (MP1, MP2, MP3)
% Ligne : unit�s
Q = [650 820 585];

% t : temps unitaire d'usinage d'un produit sur une machine(en mn)
% Colonnes : Machines (1, 2,... 7)
% Lignes : Produits (A, B,... F)
t = [11 0 12 2 15 5 5;
     15 1 1 10 0 5 3;
     0 2 11 5 0 13 5;
     5 8 0 4 0 12 28;
     0 7 10 13 10 8 0;
     10 12 15 7 25 0 7];

% q : quantit� de mati�res premi�res par produit
% Colonnes : Produits (A, B,... F)
% Lignes : Mati�res premi�res (MP1, MP2, MP3)
q = [1 1 1 5 0 2;
     2 2 1 0 2 1;
     1 0 3 2 6 0];

% pv : prix de vente des produits finis
% Colonnes : Produits (A, B,... F)
% Ligne : prix
pv = [28 20 30 37 45 22];

% pa : prix d'achat des mati�res premi�res
% Colonnes : Mati�res premi�res (MP1, MP2, MP3)
% Ligne : prix
pa = [3 4 2];

% t : cout horaire des machines
% Colonnes : Machines (1, 2,... 7)
% Ligne : couts
c = [2 2 1 1 2 3 1];

% vectStockTotal : donne le stock total occup� par la production (mati�res premi�res + produits eux m�mes)
vectStockTotal = [5 4 6 8 9 4];

% D�finition des matrices et vecteurs de contraintes A, b et lb

% A : matrice de contraintes
% Colonnes : Produits (A, B,... F)
% Lignes : Machines (1, 2,... 7) puis Mati�res premi�res (MP1, MP2, MP3)
A = [transpose(t);q];

% b : contraintes � respecter (m�me sens que les lignes de A)
b = [ones(7,1)*4800;transpose(Q)]; 

% lb : contraintes de positivit� des variables de d�cision
lb = zeros(6,1);


% Recherche de solutions admissibles pour la variable de d�cision
% X = [x_a,x_b,x_c,x_d,x_e,x_f] correspondant � la quantit� de biens
% cr��s pour chaque type de produit  

% vectBenef : vecteur des coefficients de la fonction du b�n�fice
vectBenef = (pv-pa*q-c*(t/60).');

% Q1. Comptable : maximiser le b�n�fice, en tenant compte des couts de
% fonctionnement des couts de fonctionnement des machines et du cout
% d'achat des mati�res premi�res
[X1,beneficeMax] = f1(vectBenef,A,b,lb);

% Q2. Responsable d'atelier : maximiser le nombre de produits cr��s
[X2,productionMax] = f2(A, b,lb);

% Q3. Responsable des stocks : minimiser le nombre de produits dans le
% stock
X3 = f3(A, b, lb, X2,vectStockTotal);

% Q4. Responsable commercial : minimiser l'�cart de production
% entre les familles de produit (arbitrairement, �cart limit� � 3).
X4 = f4(A,b,lb,vectBenef);

% Q5. Calcul du nombre de produits finis en minimisant l'utilisation des
% machines 1 et 5
X5 = f5(t,A,b,lb,vectBenef);

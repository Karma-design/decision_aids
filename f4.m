function [ X ] = f4(A,b,lb,vectBenef)

    tempA = [A;1 ,1 ,1 ,-1 ,-1 ,-1];
  
    iterations = 20;
    pas = 100;
    diff = -pas*iterations/2:pas:pas*(iterations-1)/2;    
    X = zeros(6,iterations);
    benef = zeros(1,iterations);
      
    figure('Name','Responsable Commercial','NumberTitle','off');
    xlabel('Ecart entre les quantités de produits par famille (Xa+Xb+Xc-Xd-Xe-Xf)');
    ylabel('Bénéfice par semaine');
    hold on;
    
    for i = 1:iterations 
        tempb = [b;diff(1,i)]; %le chiffre indiqué ici représente l'écart entre les deux familles
        [X(:,i),benef(1,i)] = linprog(-vectBenef,tempA,tempb,[],[],lb,[]);
    end
    
    plot(diff,-benef);
    -benef
    hold off;
end
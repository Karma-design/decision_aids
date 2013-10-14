function [ X ] = f5(t,A,b,lb,vectBene)
    
    m = [1; 0; 0; 0; 1; 0; 0];
    f = t*m;
    
    iterations = 13;
    pas = 1000;
    coeffBene = 0:pas:pas*(iterations-1);    
    X = zeros(6,iterations);
    temps = zeros(1,iterations);
    
    
    figure('Name','Responsable Personnel','NumberTitle','off');
    xlabel('Bénéfice par semaine');
    ylabel('Temps d''utilisation des machines 1 et 5 (en mn) par semaine');
    hold on;
    
    for i = 1:iterations
        [X(:,i),temps(1,i)] = linprog(f,A,b,vectBene,coeffBene(1,i),lb,[]);      
    end
    
    plot(temps,coeffBene);
    temps
    hold off;
end
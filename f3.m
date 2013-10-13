function [ R ] = f3( A, b, lb, X,stockTotal)
%   minimiser les produits et matières premières en stock
    
    Aeq = ones(1,6);
    ProdMax = ones(1, 6) * X;
    
    iterations = 10;
    pas = 0.1;
    Ratio = 0:pas:pas*(iterations-1);    
    R = zeros(6,iterations);
    stock = zeros(1,iterations);
      
    figure('Name','Responsable Stocks','NumberTitle','off');
    xlabel('X');
    ylabel('unités');
    hold on;
    set(gca,'XTick',[1 2 3 4 5 6]);
    
    for i = 1:iterations
        [R(:,i),stock(1,i)] = linprog(stockTotal, A, b, Aeq, Ratio(1,i)*ProdMax,lb, []);      
    end
    
    plot(R);
    hold off;
end


%input (C1,C2) daset of two classes of points(coloumn components)

function [a,b,c]=fisherClassification(C1,C2)
    
    X1=C1(1:2,:);%coloumn coordinates of first class data
    X2=C2(1:2,:);%coloumn coordinates of second class data
    %gettin info from datasets
    [d1,N1]=size(C1);
    [d2,N2]=size(C2);
    
    %error control
    if(d1~=d2)
        error('Datasets in different domains.');
    end
    
    %calculating classes centroids    
    m1=sum(X1,2)/N1;   
    m2=sum(X2,2)/N2;
    m=sum([X1 X2],2)/(N1+N2);

    Sw = zeros(2,2);
    for i=1:N1
        Sw=Sw+(X1(:,i)-m1)*(X1(:,i)-m1)';        
    end
    for i=1:N2
        Sw=Sw+(X2(:,i)-m2)*(X2(:,i)-m2)';        
    end       
    
    w=Sw\(m2-m1);
    w=w/norm(w);
    
    a=w(1);b=w(2);
    c=-w'*m;
end
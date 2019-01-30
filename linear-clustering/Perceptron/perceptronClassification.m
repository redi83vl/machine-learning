%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Dec. 2009

%input--> data, dataset to be classified, data(last,:) desired class value
%input--> ita, learning rate
function [a,b,c]=perceptronClassification(C1,C2)
    ita=1;%learning rate
    maxiter=50;%maximum number of iterations
    data=[C1 C2];
    [dim,ndat]=size(data);
    unit=perceptron(dim-1);%initializing perceptron unit
    error=[];    
    i=0;
    while(1)
        %fprintf('\nItration %i\n',i);
        targets=data(dim,:);
        unitout=output(unit,data(1:dim-1,:));
        e=sum((targets-unitout).^2);
  
        error=[error,e];
        
        if(e<=0)
            break;
        end
        
        %updating weights one by one
        for j=1:ndat
            x=data(1:dim-1,j);%j-th input vector
            t=data(dim,j);%j-th target value
            o=output(unit,x);%actual unit output
            
            %calculating bias and weights variations
            db=ita*(t-o);%bias variation
            
            dw=zeros(dim-1,1);%weights variation
            for k=1:dim-1
                dw(k,:)=ita*(t-o)*x(k,:);%k-th weight variation
            end
            
            %updating bias and weights
            unit.bias=unit.bias+db;%bias update
            unit.weights=unit.weights+dw;%weights update           
        end
        i=i+1;
        if(i>=maxiter)
            warning('Maximum number of iterations reached.\n');
            break;
        end
    end
    
    c=unit.bias;
    a=unit.weights(1);
    b=unit.weights(2);
    normal=max([a b c]);
    a=a/normal;b=b/normal;c=c/normal;
    fprintf('Iterations required: %i\n',i);
    %figure, plot(error);
end
%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Dec. 2009

%input-->training_data, matrix 3-by-d where the j-th coloumn is the j-th
%training example
%input-->unit, object type linunit2in to measure the error

function error=squared_error(training_data,unit)
    x1=training_data(1,:);%first inputs from training data
    x2=training_data(2,:);%second inputs from training data
    yd=training_data(3,:);%desired outputs from training data
    
    y=output(unit,x1,x2);
    error=0.5*sum((yd-y).^2);
end
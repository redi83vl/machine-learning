%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

%Back Propagation algorithm for a two layer feed-forward neural network

%-->input D, training set D=[ ... [x' t']' ...] where is x is a input
%vector and t is the desired output over that input
%-->input e, learning rate parameter(~0.05)
%-->input m, number of network inputs
%-->input n, number of network outputs
%-->input h, number of hidden units, each hidden layer will have n/2 units

%-->output Wh, weight matrix of hidden layer
%-->output bh, vector bias of hidden layer
%-->output Wo, weight matrix of output layer
%-->output bo, vector bias of output layer

function [Wh,bh,Wo,bo,er]=backPropagationAlgorithm(Wh,bh,Wo,bo,XD,YD,eta,alpha,miter)
    [rXD,cXD]=size(XD);
    [rYD,cYD]=size(YD);
    if(cXD~=cYD)
        error('Input dataset and Output datatset may have the same number of entries.');
    end
    
    d=cXD;%number of examples
    m=rXD;%network input size
    n=rYD;%network output size
    
    %******NETWORK TRAINING******
    fprintf('Backpropagation Algorithm initialized with:\n')
    fprintf('\tlearning rate: %.3f\n',eta);
    fprintf('\tmomentum :%.3f\n',alpha);
	if(miter==0)
		miter=10000;
	end
    fprintf('\tmaximum num. of iterations: %i\n',miter)

    er=[];
    er_s=0;
    iter=1;%iteration counter
	delta_bo_prev=0;
	delta_wo_prev=0;
	delta_bh_prev=0;
	delta_wh_prev=0;
    while(1)
        Y=[];
        for k=1:d%looping over examples
            xd=XD(:,k);%k-th input from examples
            yd=YD(:,k);%desired output for xd

            [yh,yo]=network2(Wh,bh,Wo,bo,xd,'sigmoid');
            Y=[Y yo];
			
			% updating weights in the output layer
			err_o = yo.*(1-yo).*(yd-yo);%error on output layer		
			bo = bo + eta*err_o + alpha*delta_bo_prev;%updating biases
			delta_bo_prev=eta*err_o ;%setting actual bias update
            Wo = Wo + eta*(err_o*yh')' + alpha*delta_wo_prev;%updating weights
            delta_wo_prev=eta*(err_o*yh')' ;%setting actual update
            
			%updating weights in the hidden layer
            err_h = yh.*(1-yh).*(Wo*err_o);%error on hidden layer
			bh = bh + eta*err_h + alpha*delta_bh_prev;%updating biases
			delta_bh_prev=eta*err_h ;%setting actual bias update
            Wh = Wh + eta*(err_h*xd')' + alpha*delta_wh_prev;%updating weights
            delta_wh_prev=eta*(err_h*xd')';%setting actual update
		
		end
        
        er_s=sum(sum(YD-Y).^2);%squared error
        er=[er er_s];%capturing the squared error
        
        %checking for termiantion condition
        if(iter>=miter)
            break;
		end
		if(er_s<0.1)
			break;
        end
        iter=iter+1;%counter incrementation
    end
	
	fprintf('Back-Propagation terminated with squared error minimized to %.3f.\n',er_s);
end













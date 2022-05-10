function [dw, db] = gradient(x,fx,currentW, currentB)
	predictions = x * currentW + currentB
	
	dw = 2.0 * x .* (predictions .- fx);
	db = 2.0 * (predictions .- fx);

	dw = mean(dw);
	db = mean(db);

endfunction 

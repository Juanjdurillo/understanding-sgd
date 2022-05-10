function l = loss(x, fx, w, b)
    l = 0;
    for i = 1:size(x,2)
        solution   = fx(i) * ones(size(w));
        prediction = w * x(i) + b;
        l = l + power(prediction-solution,2.0);
    endfor
	l = l / size(x,2);
endfunction

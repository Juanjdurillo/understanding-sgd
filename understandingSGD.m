1; 

function [w, b, ww, bb] = generate_search_space(min, max, number_of_points)
    w = b = linspace(min,max,number_of_points);
    [ww, bb] = meshgrid(w,b); 
endfunction

function [x, fx] = easy_dataset()
    x  = [1, 2, 3, 4,  5,  6];
    fx = [2, 5, 6, 9, 10, 13];
endfunction

function [odd_x, even_x, odd_fx, even_fx] = separate_odd_and_even(x, fx)
    odd_x   = x(1:2:size(x)(2));
    even_x  = x(2:2:size(x)(2));

    odd_fx   = fx(1:2:size(x)(2));
    even_fx  = fx(2:2:size(x)(2));
endfunction

function l = loss(x, fx, w, b)
    l = 0;
    for i = 1:size(x,2)
        solution   = fx(i) * ones(size(w));
        prediction = w * x(i) + b;
        l = l + power(solution-prediction,2.0);
    endfor
endfunction 


function [odd_x, even_x, odd_fx, even_fx] = separateOddEven(x, fx)
    odd_x   = x(1:2:size(x)(2));
    even_x  = x(2:2:size(x)(2));

    odd_fx   = fx(1:2:size(x)(2));
    even_fx  = fx(2:2:size(x)(2));
endfunction

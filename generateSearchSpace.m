function [w, b, ww, bb] = generateSearchSpace(min, max, number_of_points)
    w = b = linspace(min,max,number_of_points);
    [ww, bb] = meshgrid(w,b);
endfunction

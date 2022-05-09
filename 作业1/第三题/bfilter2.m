function B = bfilter2(A, w, sigma)
    B = bfltGray(A, w, sigma(1), sigma(2));
end
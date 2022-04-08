clc;
clear;

I = imread('test.png'); 
I = rgb2gray(I);
I = im2double(I);
I2 = I;% + 0.01*randn(size(I));

I2_SWBF = SideWindowBoxFilter(I2, 0, 1);

w = 5;
sigma = [3, 0.1];
I2_BF = bfilter2(I2, w, sigma);

figure(1);
subplot(1, 2, 1); 
imshow(I2_SWBF);
title('边窗滤波结果');

subplot(1, 2, 2); 
imshow(I2_BF);
title('双边滤波结果');
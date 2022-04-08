clc;
clear;

I = imread('dog.jpg'); 
I = rgb2gray(I);
I = im2double(I);

LEN = 21;
Theta = 11;
PSF = fspecial('motion', LEN, Theta);
I2 = imfilter(I, PSF, 'conv', 'circular');

noise_var1 = 0.01;
noise_var2 = 0.1;
I3 = imnoise(I2,"gaussian",0, noise_var1);
I4 = imnoise(I2,"gaussian",0, noise_var2);

signal_var = var(I(:));

I3_WF = deconvwnr(I3, PSF, noise_var1/signal_var);
I4_WF = deconvwnr(I4, PSF, noise_var1/signal_var);
I4_2_WF = deconvwnr(I4, PSF, noise_var2/signal_var);


figure(1);
subplot(2, 3, 1); 
imshow(I3);
title('退化图像(低噪点)');

subplot(2, 3, 2); 
imshow(I4);
title('退化图像(高噪点)');

subplot(2, 3, 3); 
imshow(I4);
title('退化图像(高噪点)');

subplot(2, 3, 4); 
imshow(I3_WF);
title('维纳滤波结果');

subplot(2, 3, 5); 
imshow(I4_WF);
title('维纳滤波结果(信噪比未知)');

subplot(2, 3, 6); 
imshow(I4_2_WF);
title('维纳滤波结果(信噪比已知)');
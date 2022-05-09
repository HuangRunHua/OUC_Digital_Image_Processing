clc;
clear;
I = imread('dog.jpg'); 
I = rgb2gray(I);
I = im2double(I);

I2 = imnoise(I,"gaussian");
I3 = imnoise(I,"gaussian",0, 0.5);

w = 5;
sigma = [3, 0.1];
B1 = bfilter2(I2, w, sigma);
B2 = bfilter2(I3, w, sigma);

figure(1);
subplot(2, 2, 1); 
imshow(I2);
title('加部分高斯噪声后图像');

subplot(2, 2, 2); 
imshow(B1);
title('双边滤波结果');

subplot(2, 2, 3); 
imshow(I3);
title('加大量高斯噪声后图像');

subplot(2, 2, 4); 
imshow(B2);
title('双边滤波结果');
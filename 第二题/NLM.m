clc;
clear;
I = imread('dog.jpg'); 
I = rgb2gray(I);
I = im2double(I);

I2 = imnoise(I,"gaussian");
I3 = imnoise(I,"gaussian",0, 1);

[I2_NLM, ~] = imnlmfilt(I2);
[I3_NLM, ~] = imnlmfilt(I3);

figure(1);

subplot(2, 2, 1); 
imshow(I2);
title('加部分高斯噪声后图像');

subplot(2, 2, 2); 
imshow(I2_NLM);
title('非局部均值滤波结果');

subplot(2, 2, 3)
imshow(I3);
title('加大量高斯噪声后图像');

subplot(2, 2, 4); 
imshow(I3_NLM);
title('非局部均值滤波结果');
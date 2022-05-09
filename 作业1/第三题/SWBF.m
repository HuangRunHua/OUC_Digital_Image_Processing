clc;
clear;

I = imread('test.png'); 
I = rgb2gray(I);
I = im2double(I);
I2 = I + 0.1*randn(size(I));
% I2 = imnoise(I,"gaussian", 0, 0.001);
% I3 = imnoise(I,"gaussian",0, 0.5);

I2_SWBF = SideWindowBoxFilter(I2, 0, 1);

I2_LW = LW_Filter(I2);

[I2_NLM, ~] = imnlmfilt(I2);

I2_GL = GL_Filter(I2);

figure(1);
subplot(2, 2, 1); 
imshow(I2);
title('含有噪声的图片');

subplot(2, 2, 2); 
imshow(I2_LW);
title('小波去噪后图像');

subplot(2, 2, 3); 
imshow(I2_SWBF);
title('边窗滤波结果');

subplot(2, 2, 4)
imshow(I2_NLM);
title('非局部均值滤波结果');
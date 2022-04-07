clc;
clear;
I = imread('dog.jpg'); 
I = rgb2gray(I);
I = im2double(I);
I2 = I + 0.5*randn(size(I));
I3 = I + 1*randn(size(I));

I2_LW = LW_Filter(I2);
I3_LW = LW_Filter(I3);

figure(1);
subplot(2, 2, 1); 
imshow(I2);
title('加部分高斯噪声后图像');

subplot(2, 2, 2); 
imshow(I2_LW);
title('小波去噪结果');

subplot(2, 2, 3); 
imshow(I3);
title('加大量高斯噪声后图像');

subplot(2, 2, 4); 
imshow(I3_LW);
title('小波去噪结果');

function I_LW = LW_Filter(image)
    [thr, sorh, keepapp] = ddencmp('den', 'wv', image);
    I_LW = wdencmp('gbl', image, 'sym4', 2, thr, sorh, keepapp);
end
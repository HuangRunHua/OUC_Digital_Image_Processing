clear;
clc;

I = imread('dog.jpg'); 
I = rgb2gray(I);
g1 = adapthisteq(I);
g2 = adapthisteq(I, "NumTiles", [16, 16]);
g3 = adapthisteq(I, "NumTiles", [24, 24]);

subplot(2, 2, 1); 
imshow(I);
title('原始图像');
subplot(2, 2, 2); 
imshow(g1);
title('局部图像块的大小为8x8');
subplot(2, 2, 3); 
imshow(g2);
title('局部图像块的大小为16x16');
subplot(2, 2, 4); 
imshow(g3);
title('局部图像块的大小为24x24');

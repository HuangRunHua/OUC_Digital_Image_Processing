clc;
clear;

I = imread('dog.jpg'); 
I = rgb2gray(I);
I2 = imnoise(I,"gaussian");
I3 = imnoise(I,"gaussian",0, 1);

% 高斯低通滤波器处理
I2_GL = GL_Filter(I2);
I3_GL = GL_Filter(I3);

figure(1);
imshow(I);
title('原始图像');

figure(2);
subplot(2, 2, 1); 
imshow(I2);
title('加部分高斯噪声后图像');

subplot(2, 2, 2); 
imshow(I2_GL);
title('高斯低通滤波结果');

subplot(2, 2, 3)
imshow(I3);
title('加大量高斯噪声后图像');

subplot(2, 2, 4); 
imshow(I3_GL);
title('高斯低通滤波结果');


function img_lpf = GL_Filter(image)
    d0 = 50;
    [M ,N] = size(image);

    img_f = fft2(double(image));%傅里叶变换得到频谱
    img_f = fftshift(img_f);  %移到中间

    m_mid = floor(M/2);%中心点坐标
    n_mid = floor(N/2);  

    h = zeros(M,N);%高斯低通滤波器构造
    for i = 1:M
        for j = 1:N
            d = ((i-m_mid)^2+(j-n_mid)^2);
            h(i,j) = exp(-(d)/(2*(d0^2)));      
        end
    end

    img_lpf = h.*img_f;

    img_lpf = ifftshift(img_lpf);    %中心平移回原来状态
    img_lpf = uint8(real(ifft2(img_lpf)));  %反傅里叶变换,取实数部分
end

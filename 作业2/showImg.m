function showImg(Orig_Img, filter_img)
    figure(1);
    subplot(211);
    imshow(Orig_Img);
    title("原始图像");
    subplot(212);
    imshow(filter_img);
    title("去除噪声后的图像");
end
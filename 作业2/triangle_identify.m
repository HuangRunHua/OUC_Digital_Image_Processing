clear;
clc;
Orig_Img = imread('test.png'); 
Orig_Img = im2gray(Orig_Img);

% 去除椒盐噪声
% filter_img= medfilt2(Orig_Img);
filter_img = Orig_Img;

imshow(filter_img);

% 确定搜索圆的半径范围
d = drawline;
pos = d.Position;
diffPos = diff(pos);
diameter = hypot(diffPos(1),diffPos(2));
% 搜索半径在[diameter/2-5 diameter/2+5]左右的圆
% [centers,radii] = imfindcircles(filter_img,[int8(diameter/2)-5 int8(diameter/2)+5],'ObjectPolarity','bright', 'Sensitivity',0.97);
[centers,radii] = imfindcircles(filter_img,[int8(diameter/2)-5 int8(diameter/2)+5],'ObjectPolarity','dark', 'Sensitivity',0.96);
imshow(filter_img);
h = viscircles(centers,radii);
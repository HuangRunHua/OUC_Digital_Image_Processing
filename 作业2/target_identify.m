clear;
clc;
Orig_Img = imread('test.png'); 
Orig_Img = im2gray(Orig_Img);

% 去除椒盐噪声
filter_img= medfilt2(Orig_Img, [5,5]);

% 提取边界
BW = edge(filter_img, "canny");
% 进行霍夫变换
[H, T, R] = hough(BW, 'RhoResolution', 3.2, 'Theta', -90:89);
P = houghpeaks(H, 5, 'threshold', ceil(0.3*max(H(:))));
lines = houghlines(BW, T, R, P, 'FillGap', 5, 'MinLength', 7);

% 储存所有直线的长度
len_all = zeros(1, length(lines));

max_len = 0;
for k=1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    % 计算线段的长度
    len = norm(lines(k).point1 - lines(k).point2);
    len_all(:,k) = len;
end

% 找到前几条最长的线段长度
target_len = maxk(len_all, 5);

% 寻找对应的三条线段
for k=1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    % 计算线段的长度
    len = norm(lines(k).point1 - lines(k).point2);
    for i = 1: length(target_len)
        if target_len(i) == len
            target_lines(:,i) = lines(k);
        end
    end
end

figure(2);
imshow(BW);
hold on;
for k = 1: length(target_lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');
end

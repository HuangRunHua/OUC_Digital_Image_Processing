clear;
clc;
Orig_Img = imread('test.png'); 
Orig_Img = im2gray(Orig_Img);

% 去除椒盐噪声
filter_img= medfilt2(Orig_Img, [5,5]);

% 提取边界
BW = edge(filter_img, "canny");
% 进行霍夫变换
[H, T, R, lines] = GetLinesResult(BW, 1.5563, -48:0.5:-26);
[H1, T1, R1, lines1] = GetLinesResult(BW, 1.55, 47:0.5:60);

[target_lines] = GetTargetLines(lines, 2);
[target_lines1] = GetTargetLines(lines1, 3);
target_lines1 = target_lines1(:,2:3);

figure(2);
imshow(BW);
hold on;
for k = 1: length(target_lines1)
    xy = [target_lines(k).point1; target_lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');

    xy1 = [target_lines1(k).point1; target_lines1(k).point2];
    plot(xy1(:,1), xy1(:,2), 'LineWidth', 2, 'Color', 'green');
end

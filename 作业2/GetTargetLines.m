function [target_lines] = GetTargetLines(lines, num)
    % 储存所有直线的长度
    len_all = zeros(1, length(lines));

    for k=1:length(lines)
        % 计算线段的长度
        len = norm(lines(k).point1 - lines(k).point2);
        len_all(:,k) = len;
    end

    % 找到2条最长的线段长度
    target_len = maxk(len_all, num);

    % 寻找对应的2条线段
    for k=1:length(lines)
        % 计算线段的长度
        len = norm(lines(k).point1 - lines(k).point2);
        for i = 1: length(target_len)
            if target_len(i) == len
                target_lines(:,i) = lines(k);
            end
        end
    end
end
function [H, T, R, lines] = GetLinesResult(BW, RhoResolution, Theta)
    [H, T, R] = hough(BW, 'RhoResolution', RhoResolution, 'Theta', Theta);
    P = houghpeaks(H, 5, 'threshold', ceil(0.3*max(H(:))));
    lines = houghlines(BW, T, R, P, 'FillGap', 5, 'MinLength', 7);
end
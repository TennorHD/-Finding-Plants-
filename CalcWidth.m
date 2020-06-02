% this function calculates the width of the needed area
% from picture.
function [x y] = CalcWidth(b)
    flag = 0;
    count = length(b);
    for i = 1:count
        if b(1,i) == 0 && b(1,i+1) > 0
            x = i; % set width
            flag = 1; % set flag
        end
        if flag == 1 && b(1,i) > 1*10^4
            flag = 0; % reset flag
        end
        if flag == 1 && b(1,i-1) > 0 && b(1,i) == 0
            y = i;
            break;
        end
    end
end
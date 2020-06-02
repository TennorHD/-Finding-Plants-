% calculate the intensity of white pixel along the width
function [x] = CalcBin(im)
    [r c] = size(im);
    x = zeros(1,c);
    for i = 1:c
        for j = 1:r
            x(1,i)=x(1,i)+im(j,i);
        end
    end
end
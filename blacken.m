% blacken the part of image other than area within width x and y
function [im] = blacken(im,x,y)

    [r,c]=size(im);
    for i = 1:c
        if i < x || i>y
            for j = 1:r
                im(j,i)=0;
            end
        end
    end
    
end
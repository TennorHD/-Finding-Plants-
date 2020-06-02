function [plant] = findPlant(im_b)

seed = zeros(1,2);
[r c] = size(im_b); %#ok<*NCOMMA>
% disp(r+" "+c);
y = floor(r/2);
x = floor(c/2);

for i = 1 : y-1
    if im_b(y,x) ==1
        seed = [y,x];
        break;
    end
    if i < c/2-1
        if im_b(y+i,x) ==1
            seed = [y+i,x];
            break;
        elseif im_b(y,x+i) ==1
            seed = [y,x+i];
            break;
        elseif im_b(y-i,x) ==1
            seed = [y-i,x];
            break;
        elseif im_b(y,x-i) ==1
            seed = [y,x-i];
            break;
        elseif im_b(y+i,x+i) ==1
            seed = [y+i,x+i];
            break;
        elseif im_b(y+i,x-i) ==1
            seed = [y+i,x-i];
            break;
        elseif im_b(y-i,x+i) ==1
            seed = [y-i,x+i];
            break;
        elseif im_b(y-i,x-i) ==1
            seed = [y-i,x-i];
            break;
        end
    end
end

seedI = false(size(im_b));
seedI(seed(1),seed(2)) = true;

plant = imreconstruct(seedI,im_b);

end
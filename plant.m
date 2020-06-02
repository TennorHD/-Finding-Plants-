clear;

i = 1;
testNum = 3;

for x = 1:testNum
    
    switch(x)
    case(1)
        im_rgb = imread('plant223_rgb.png');
    case(2)
        im_rgb = imread('plant017_rgb.png');
    case(3)
        im_rgb = imread('plant001_rgb.png');
    end
    
    i = searchplant(im_rgb, i);
    
end
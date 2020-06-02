clear;

% im_rgb = imread('plant223_rgb.png');
im_rgb = imread('plant017_rgb.png');
% im_rgb = imread('plant001_rgb.png');
im_g = rgb2gray(im_rgb);

figure(1)
imshowpair(im_g,im_rgb);
impixelinfo;
% parameters
S = 195; % 195
T = 120; % 120
% S = 120; % 195
% T = 50; % 120

% SI = seed image
% g = region grow image
% TI = threshold image
% NR = number of region
[g, NR, SI, TI] = regiongrow(im_g, S, T);

se = strel('disk',6);
Io = imopen(g,se);
figure(2);
imshow(g);
bin = CalcBin(Io);
[a,b]=CalcWidth(bin);
Iob = blacken(Io,a,b);

I2 = labeloverlay(im_g,Iob);

% shrink shadow size
se2 = strel('disk',20);%6
Iob2 = imclose(Iob,se2);
% Iob3 = imerode(Iob2,se2);
Iob3 = imclose(Iob2,se2);

I3 = labeloverlay(im_g,Iob3);


figure(2);
plot(bin);

figure(3);
imshow(I2)
title('Regional Maxima Superimposed on Original Image')

figure(4);
imshow(Iob3)
title('Modified RMS')

figure(5);
imshowpair(im_rgb,I3,'Montage')
title('Modified Regional Maxima Superimposed on Original Image')
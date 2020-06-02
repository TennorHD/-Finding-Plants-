% Function to search for plant
function [i] = searchplant(im_rgb, i)

im_g = rgb2gray(im_rgb);
im_g = histeq(im_g);
[a b] = size(im_rgb);

% maxSize=900000;
% if (a*b>maxSize)
%     im_g = imresize(im_g,round((maxSize/a*b)*100)/100);
% end

im_mask = adapthisteq(im_g,'clipLimit',0.00001,'Distribution','rayleigh'); %0.001
se = strel('disk',22); %20
marker = imerode(im_mask,se);

figure(i);
imshow(marker);
title('marker');
i = i+1;

im_re = imreconstruct(marker,im_mask);

figure(i);
imshow(im_re);
title('reconstructed');
i = i+1;

im_b = imbinarize(im_re);

figure(i);
imshow(im_b);
title('before findplant');
i = i+1;

im_re2 = findPlant(im_b);
figure(i);
imshow(im_re2);
title('after findPlant');
i = i+1;

% ==============================
% !!
% im_re2 = imopen(im_re2,strel('disk',floor(mod(a*b,1000)/20)));
% % im_re2 = imclose(im_re2,strel('disk',floor(mod(a*b,1000)/20)));
% 
% figure(i);
% imshow(im_re2);
% title('after opening');
% i = i+1;
% ==============================

Io = labeloverlay(im_g,im_re2);

figure(i);
imshow(Io);
i = i+1;

% ================================
% 
% im_d = bwdist(im_b);
% im_ws = watershed(im_d);
% bgm = im_ws == 0;
% 
% figure(i);
% imshowpair(im_d,im_ws,'montage');
% title('distorted and watershed');
% i = i+1;
% 
% gmag = imgradient(im_mask);
% 
% figure(i);
% imshow(gmag,[]);
% title('Gradient Magnitude')
% i = i+1;
% 
% gmag2 = imimposemin(gmag, bgm | im_re2);
% L = watershed(gmag2);
% 
% figure(i)
% imshow(gmag2);
% title('gmag2');
% i = i+1;
% 
% ratio = floor(a/100);
% labels = ratio*imdilate(L==0,ones(3,3)) + 2*ratio*bgm + 3*ratio*im_re2;
% I4 = labeloverlay(im_rgb,labels);
% 
% figure(i)
% imshow(I4)
% title('Markers and Object Boundaries Superimposed on Original Image')
% i = i+1;

end
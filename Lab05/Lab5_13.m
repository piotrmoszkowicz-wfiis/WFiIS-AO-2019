cclear;clc;

im = rgb2gray(double(imread('kaczki.jpg'))/255);

avgIm = .55;
bim = ~imbinarize(im, avgIm);
bim = imclose(bim, ones(8));
bim([1, end], :) = 1;
bim(:,[1, end]) = 1;

% metryki - Chebysheva - chessboard
%         - Manhattan  - cityblock

d = bwdist(bim, 'chessboard'); 
l = watershed(d);
imshow(label2rgb(l));
figure;
d1 = bwdist(bim, 'cityblock');
l1 = watershed(d1);
imshow(label2rgb(l1));
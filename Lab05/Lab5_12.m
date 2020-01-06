clear;clc;

im = rgb2gray(double(imread('kaczki.jpg'))/255);

avgIm = .55;
bim = ~imbinarize(im, avgIm);
bim = imclose(bim, ones(8));
bim([1, end], :) = 1;
bim(:,[1, end]) = 1;

% segmentacja wododzialowa - bardziej czytelna, gdyz dodajemy teraz ramke

d = bwdist(bim); 
l = watershed(d);
imshow(label2rgb(l));
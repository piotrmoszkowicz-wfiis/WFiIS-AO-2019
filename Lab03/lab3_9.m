clear;clc;

im = rgb2gray(double(imread('zubr.jpg'))/255);

avgIm = .55;
bim = imbinarize(im, avgIm);
bim = ~bim;

fim = bim - imerode(bim, ones(3)); % krawedzie zewnetrzne
% same krawedzie
fim2 = imdilate(bim, ones(3)) - bim; % krawedzie wewnetrzne

f = -ones(3);
f(5) = 8;

fim = imfilter(bim, f); % tez znalezienie krawedzi - wyglada tak jak erode

imshow(bim);
figure;
imshow(fim);
figure;
imshow(fim2);

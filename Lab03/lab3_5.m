clear;clc;

im = rgb2gray(double(imread('zubr.jpg'))/255);
flt = fspecial('prewitt');
flt2 = fspecial('sobel');
fim = imfilter(im, flt);
fim2 = imfilter(im, flt2);

imshow(im);
figure;
imshow(fim);
figure;
imshow(fim2);

% filter prewitt
% filter sobel
% wykrywanie krawedzi - glownie poziomych
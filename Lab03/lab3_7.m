clear;clc;

im = rgb2gray(double(imread('zubr.jpg'))/255);

avgIm = .55;
bim = imbinarize(im, avgIm);
bim = ~bim;

fim = medfilt2(bim, [3, 3]);
% moda i mediana robia to samo => dlatego, ze mediana musi byc i tak
% powyzej sredniej, a moda to najczestsza wartosc - tez musi byc ponad
% srednia

imshow(bim);
figure;
imshow(fim);

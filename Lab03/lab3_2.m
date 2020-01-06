clear;clc;

im = rgb2gray(double(imread('zubr.jpg'))/255);

k = 50;
f = ones(1, k) / k;

fim = imfilter(im, f);

imshow(im);
figure;
imshow(fim);

% motion blur
% filtr dolnoprzepustowy - wagi dodatnie
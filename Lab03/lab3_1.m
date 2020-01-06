clear;clc;

im = rgb2gray(double(imread('zubr.jpg'))/255);

k = 5;
f = ones(k) / k ^ 2;

fim = imfilter(im, f);

imshow(im);
figure;
imshow(fim);

% average blur
% filtr dolnoprzepustowy - wagi dodatnie
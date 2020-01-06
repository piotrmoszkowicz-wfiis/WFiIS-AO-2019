clear;clc;

im = rgb2gray(double(imread('zubr.jpg'))/255);
fim = medfilt2(im, [3, 3]);

imshow(im);
figure;
imshow(fim);

% filtr medianowy - rozmycie
% krawedzie powinny zostac bardziej ostre niz przy filtrze
% dolnoprzepustowym
% jedynie odszumi co trzeba, nie zaburzy reszty sygnalu
clear;clc;

im = rgb2gray(double(imread('kaczki.jpg'))/255);

avgIm = .55;
bim = ~imbinarize(im, avgIm);
fim = imclose(bim, ones(8));

fim = bwmorph(fim, 'shrink', inf);

% realizuje erozje - finalnie zostanie nam jeden punkt
% zachowuje liczbe Euler'a
% liczba Euler'a - ilosc obiektow na obrazie odjac ilosc dziur z nich
% upewnia sie, ze jesli punkt jest samodzielny to nie zostanie usuniety

imshow(fim);

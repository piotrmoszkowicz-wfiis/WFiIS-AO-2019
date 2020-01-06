clear;clc;

im = rgb2gray(double(imread('zubr.jpg'))/255);

avgIm = .55;
bim = imbinarize(im, avgIm);
bim = ~bim;

fim = imerode(bim, ones(3));
fim2 = imdilate(bim, ones(3));
%fim3 = imerode(fim2, ones(3));

% operacje morfologiczne:

% min -> cos sie bedzie zmieniac tylko na krawedziach -> gdyz bialy pixel
% musi miec otoczenie czarnych  ( 1 otoczona 0 ) -> conajmiej jedno 0
% pomniejszy krawedzie - erozja

% max -> cos sie bedzie zmieniac tylko na krawedziach -> gdyz czarny pixel
% musi miec otoczenie bialych  ( 0 otoczona 1 ) -> conajmiej jedna 1
% powiekszy krawedzie - dylatacja

% wielkosc efektu - ones(do wiekszej liczby)

% erozja + dylatacja -> male biele punkty znikaja, czarne sa podobne ->
% otwarcie
%fim3 = imopen(bim, ones(3));

% dylatacja + erozja -> male cimne punkty znikaja, biale sa podobne ->
% zamkniecie
fim3 = imclose(bim, ones(3));

% WYWOLANIE EROZJI/DYLATACJI KILKA RAZY DA TAKICH SAM EFEKT JAK WIEKSZY
% SEGMNET (ARGUMENT ones) -> ALE JUZ NIE PRZY IMOPEN/IMCLOSE

imshow(bim);
figure;
imshow(fim);
figure;
imshow(fim2);
figure;
imshow(fim3);

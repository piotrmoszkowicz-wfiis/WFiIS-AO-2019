clear;clc;

im = rgb2gray(double(imread('zubr.jpg'))/255);
fim = im;

avgIm = .55;

fim(fim >= avgIm) = 1;
fim(fim < avgIm) = 0; % wynik -> macierz double

% druga metoda ponizej - robi to samo
%fim = im > avgIm; % wynik -> macierz logiczna

%trzecia metoda ponizej
%fim = imbinarize(im, avgIm);
%fim = ~fim;
% wynik -> macierz logiczna
% moze byc bez wspolczynnika - w dokumentacji opisane zasady jak wyznacza -
% metoda Otsu - to samo robi funkcja:
% avgIm = graythresh(im);
% rozniez jest argument 'adaptive' zamiast progu
% robi podobnie jak filtry - sprawdza jasnosc sasiedztwa punktu

imshow(im);
figure;
imhist(im);
figure;
imshow(fim);
figure;
imhist(fim);

% binaryzacja obrazow - avgIm -> wspolczynnik binaryzacji, ktory bierzemy
% na podstawie analizy obrazu - chcemy oddzielic zubra od tla

% co jesli chcemy, zeby zubr byl bialy
% robimy to samo, tylko inwersja potem:
% - na liczbach: fim = 1 - fim
% - na logiznych: fim = ~fim

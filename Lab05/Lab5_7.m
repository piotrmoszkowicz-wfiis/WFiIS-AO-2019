clear;clc;

im = rgb2gray(double(imread('kaczki.jpg'))/255);

avgIm = .55;
bim = ~imbinarize(im, avgIm);
bim = imclose(bim, ones(8));

% segmentacja obrazu - chcemu wszystkie obiekty (kaczki) miec osobno
% nadajemy etykiety bialym pikselom - ich sasiedzi beda miec te same
% etykiety

% tlo - zawsze wart 0
% kaczka pierwsza - wart 1
% kaczka druga - wart 2
% kaczka trzy - wart 3
% wtedy jestesmy w stanie podzielic na osobne kaczki

l = bwlabel(bim);

imshow(l == 2); % wyswietlamy kaczke nr. 2 -> gdy l == 2 bedziemy dostawac true wiec bedzie tylko jedna na ekranie
figure;
% wyswietlamy obraz kolorowy (czy tam odcienie szarosci)
imshow(im .* (l == 2));
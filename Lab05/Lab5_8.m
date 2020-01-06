clear;clc;

im = rgb2gray(double(imread('kaczki.jpg'))/255);

avgIm = .55;
bim = ~imbinarize(im, avgIm);
bim = imclose(bim, ones(8));
bim = bwmorph(bim, 'thicken', inf);
l = bwlabel(bim);

% wyswietlamy obraz kolorowy (czy tam odcienie szarosci) wraz z otoczeniem
% wybrana czesc obrazu wraz z kaczka
imshow(im .* (l == 2));
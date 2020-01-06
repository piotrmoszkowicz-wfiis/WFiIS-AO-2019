sclear;clc;

im = rgb2gray(double(imread('kaczki.jpg'))/255);

avgIm = .55;
bim = ~imbinarize(im, avgIm);
fim = imclose(bim, ones(8));

fim = bwmorph(fim, 'thicken', 15);

% robi dylatacje obiektow upewniajac sie, ze dwa obiekty NIGDY sie nie soba
% nie polacza - rowniez zachowuje liczbe Euler'a
% kazdy bialy obszar NA PEWNO zawiera kaczke i NA PEWNO zawiera JEDNA
% kaczke

imshow(fim);

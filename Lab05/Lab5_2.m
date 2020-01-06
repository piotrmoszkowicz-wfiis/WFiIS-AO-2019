clear;clc;

im = rgb2gray(double(imread('kaczki.jpg'))/255);

avgIm = .55;
bim = ~imbinarize(im, avgIm);
fim = imclose(bim, ones(8));

fim = bwmorph(fim, 'skel', inf);

% ^szkielet obrazu - mowi o orientacji obiektu (w jakiej pozycji sa obiekty
% - co robia etc.)

eim = bwmorph(fim, 'endpoints');
w
% ^punkty koncowe szkieletu obrazu

bbim = bwmorph(fim, 'branchpoints');

% ^punkty rozgalezien szkieletu - wystarczy do oceny orientacji

imshow(eim);

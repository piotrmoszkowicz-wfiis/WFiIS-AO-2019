clear;clc;

im = rgb2gray(double(imread('kaczki.jpg'))/255);

avgIm = .55;
bim = ~imbinarize(im, avgIm);
bim = imclose(bim, ones(8));
bim = bwmorph(bim, 'thicken', inf);
l = bwlabel(bim);

% osobny kolor dla kazdej segmentacji - mozna sprawdzic jakos segmentacji

imshow(label2rgb(l));
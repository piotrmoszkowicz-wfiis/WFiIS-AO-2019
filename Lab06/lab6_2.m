clear;clc;

im = double(imread('ptaki.jpg'))/255;
gim = rgb2gray(im);

r = im(:, :, 1);
b = im(:, :, 3);

b = ~imbinarize(b, .6);

r(r < .15) = 1;
r = imbinarize(r, .3);
bim = b | r;
bim = imclose(bim, ones(5));
bim = imopen(bim, ones(5));

% poni�ej segmentacja

l = bwlabel(bim);
n = max(l(:));

% poni�ej wyci�gamy propsy obrazka
prop = regionprops(l == 4, 'all');

% area - pole, liczymy jako suma pikseli
% centroid - uog�lnienie �redniej - �rednia wszystkich wsp�rz�dnych
% boundingbox - prostok�t, w kt�rych zawiera si� obiekt (x1, x2,
% y1, y2)
% gdy zrobimy imshow - mamy sam boundingbox, a nie ca�y obrazek
% solidity - stosunek wype�nionych pikseli do czarnych
% perimeter - obw�d, mo�na policzy� jako suma pikseli, kt�re s�siaduj� z
% jednym czarnym (czyli s� na kraw�dzi)

% wsp�czynniki geometryczne
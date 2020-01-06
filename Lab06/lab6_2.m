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

% poni¿ej segmentacja

l = bwlabel(bim);
n = max(l(:));

% poni¿ej wyci±gamy propsy obrazka
prop = regionprops(l == 4, 'all');

% area - pole, liczymy jako suma pikseli
% centroid - uogólnienie ¶redniej - ¶rednia wszystkich wspó³rzêdnych
% boundingbox - prostok±t, w których zawiera siê obiekt (x1, x2,
% y1, y2)
% gdy zrobimy imshow - mamy sam boundingbox, a nie ca³y obrazek
% solidity - stosunek wype³nionych pikseli do czarnych
% perimeter - obwód, mo¿na policzyæ jako suma pikseli, które s±siaduj± z
% jednym czarnym (czyli s± na krawêdzi)

% wspó³czynniki geometryczne
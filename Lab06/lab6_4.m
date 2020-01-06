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

% macierz wspó³czynników dla ka¿dej kaczki - kaczki w wierszach,
% wspó³czynniki w kolumnach - implementacja poni¿ej

for i = (1 : n)
    prop = regionprops(l == i, 'all');

    d = AO5RMalinowska(prop.Image);
    dD = AO5RDanielsson(prop.Image);
    dBB = AO5RBlairBliss(prop.Image);
    dH = AO5RHaralick(prop.Image);
    dF = AO5RFeret(prop.Image);
    
    wspl(i, :) = [d, dD, dBB, dH, dF];
end

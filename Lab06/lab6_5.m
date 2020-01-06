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

% metoda 3 sigm - sprawdzamy, kt�re kaczki si� wyr�niaj� na podstawie
% wsp�czynnik�w

for i = (1 : n)
    prop = regionprops(l == i, 'all');

    d = AO5RMalinowska(prop.Image);
    dD = AO5RDanielsson(prop.Image);
    dBB = AO5RBlairBliss(prop.Image);
    dH = AO5RHaralick(prop.Image);
    dF = AO5RFeret(prop.Image);
    
    wspl(i, :) = [d, dD, dBB, dH, dF];
end

avg_malin = mean(wspl);
std_malin = std(wspl);

err = abs(wspl - avg_malin) ./ std_malin;

% 8 kaczka si� r�ni o prawie 3 odchylenia standardowe - jest inna

err_margin = 2; % pr�g "nietypowo�ci" wsp�czynnika

is_typical_wspl = err < err_margin; % czy dany wsp�czynnik jest typowy, czy nie

is_typical = sum(is_typical_wspl, 2) > 3; % 4 warto�ci MUSZ� by� typowe

prop = regionprops(l == 8, 'all'); % "nietypowa" kaczka - kawa�ek skrzyd�a w tym wypadku
imshow(prop.Image);

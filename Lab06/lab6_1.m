clear;clc;

im = double(imread('ptaki.jpg'))/255;
gim = rgb2gray(im);

% rozbicie na kanaly R, G, B

%for i = 1:3 
%    subplot(3, 2, 2 * i - 1);
%    imshow(im(:, :, i));
%    subplot(3, 2, 2 * i);
%    imhist(im(:, :, i));
%end

r = im(:, :, 1);
b = im(:, :, 3);

% .6 - prog kt�ry nas interesuje - na podstawie histogramu z g�ry
b = ~imbinarize(b, .6);

r(r < .15) = 1;
r = imbinarize(r, .3);

% zielony kana� porzucamy - dlatego i� ma tak� charakterystyk�, �e nie
% pozwala nam analizowa�

bim = b | r;
%imshow(bim);

% ^ wyodr�bnili�my ptaki od t�a z du�o lepszym efektem, jednak mamy dalej
% du�o szum�w - mo�emy zrobi� close

bim = imclose(bim, ones(5));
bim = imopen(bim, ones(5));

% ^ domkni�cie i otwarcie, aby pozby� si� szum�w

imshow(bim);
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

% .6 - prog który nas interesuje - na podstawie histogramu z góry
b = ~imbinarize(b, .6);

r(r < .15) = 1;
r = imbinarize(r, .3);

% zielony kana³ porzucamy - dlatego i¿ ma tak± charakterystykê, ¿e nie
% pozwala nam analizowaæ

bim = b | r;
%imshow(bim);

% ^ wyodrêbnili¶my ptaki od t³a z du¿o lepszym efektem, jednak mamy dalej
% du¿o szumów - mo¿emy zrobiæ close

bim = imclose(bim, ones(5));
bim = imopen(bim, ones(5));

% ^ domkniêcie i otwarcie, aby pozbyæ siê szumów

imshow(bim);
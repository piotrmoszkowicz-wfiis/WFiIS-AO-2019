clear;clc;

% wczytaj z pliku
im = imread('zubr.jpg');

% convert to double
im = double(im)/255;

% obvious
im = rgb2gray(im);

% plutujemy
subplot(3, 3, 1);
imhist(im);

% plotujemy
subplot(3, 3, 2);
imshow(im);

%zmieniamy jasnosc
% 0.2 -> parametr zmiany jasnosci -> miedzy (-1, 1)
im_b = im + 0.2;
% zeby nie wyszlo poza zakres
im_b(im_b > 1) = 1;
im_b(im_b < 0) = 0;

%plotujemy drugi obrazek
subplot(2, 2, 3);
imhist(im_b);

subplot(2, 2, 4);
imshow(im_b);

% zmieniamy kontrast
% .5 -> parametr zmiany kontrastu -> miedzy (0, +inf)
%im_c = im * .5;

% plutujemy
%subplot(2, 2, 3);
%imhist(im_c);

% plotujemy
%subplot(2, 2, 4);
%imshow(im_c);

% przesuwamy wybrany punkt "do 0" -> przemnozony przez kazda stala bedzie
% dalej 0

%im_c_2 = .5 * (im - .5) + .5;
%im_c_2(im_c_2 > 1) = 1;
%im_c_2(im_c_2 < 0) = 0;

% plutujemy
%subplot(2, 2, 3);
%imhist(im_c_2);

% plotujemy
%subplot(2, 2, 4);
%imshow(im_c_2);

% potegowanie - zmiana gamma
% zwykle stosuje sie jako odwrotnosc - wtedy jest intuicyjne - mniejsze G
% (parametr) to jasniejszy obraz
% wartosci - (0, +inf)
%im_d = im .^ 2;

% plutujemy
%subplot(3, 3, 4);
%imhist(im_d);

% plotujemy
%subplot(3, 3, 5);
%imshow(im_d);

% gdy plotujemy wykres nowy/stary -> gdy robimy zmiane B to wykres
% przesunie sie do gory / w dol (punkt K stanie sie punkten K + b)

% plotowanie wykresy nowy/stary - zmiana jasnosci
x = 0: 1/255 : 1;
y = x;

subplot(3, 3, 3); % wykres bez zmian
plot(x, y);
xlim([0. 1]);
ylim([0, 1]);
axis equal;

y = x + .1;

y(y > 1) = 1;
y(y < 0) = 0;

subplot(3, 3, 6); % wykres z y przesunietym - zmiana jasnosci
plot(x, y);
xlim([0. 1]);
ylim([0, 1]);
axis equal;

% plotowanie wykresy nowy/stary - zmiana kontrastu
%x_c = 0 : 1/255 : 1;
%y_c = x_c;

%subplot(3, 3, 3); % wykres bez zmian
%plot(x_c, y_c);

%y_c = x_c .* 0.1;

%y_c(y_c > 1) = 1;
%y_c(y_c < 0) = 0;

%subplot(3, 3, 6); % wykres z y przemnozonym - zmiana kontrastu
%plot(x_c, y_c);
%xlim([0. 1]);
%ylim([0, 1]);
%axis equal;

%x_g = 0 : 1/255 : 1;
%y_g = x_g;

%subplot(3, 3, 3); % wykres bez zmian
%plot(x_g, y_g);

%y_g = x_g .^ 4;

%subplot(3, 3, 6); % wykres z y przemnozonym - zmiana kontrastu
%plot(x_g, y_g);
%xlim([0. 1]);
%ylim([0, 1]);
%axis equal;

% gamma - ciemne tlo/jasny sygnal -> wyeksponujemy jasny sygnal (gdy gamma
% > 1), gdy gamma (< 1) -> jasne tlo/ciemny sygnal
% gamma i zmiane kontrastu przedstawiamy zwykle na skali logarytmicznej ->
% po prostu inny zakres mozliwych wartosci

%im_all = 2 .* im .^ 4 + 0.3;
% plutujemy
%subplot(3, 3, 4);
%imhist(im_all);

% plotujemy
%subplot(3, 3, 5);
%imshow(im_all);

%x_all = 0 : 1/255 : 1;
%y_all = x_all;

%subplot(3, 3, 3); % wykres bez zmian
%plot(x_all, y_all);

%y_all = 2 .* x_all .^ 4 + 0.3;

%subplot(3, 3, 6); % wykres z y przemnozonym - zmiana kontrastu
%plot(x_all, y_all);
%xlim([0. 1]);
%ylim([0, 1]);
%axis equal;

% gdy chcemy inwersje -> b = 1, c = -1, y = 1

% wyrownanie histogramu - ten sam ksztalt wykresu dla zbioru obrazkow
%eq_im = histeq(im);
%subplot(3, 3, 3);
%imhist(eq_im);

%subplot(3, 3, 6);
%imshow(eq_im);
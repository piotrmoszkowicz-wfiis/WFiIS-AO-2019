clear;clc;

im = rgb2gray(double(imread('opera.jpg'))/255);

% widmo - reprezentacja danych - w naszym wypadku jaka wartosc przyjmuje
% amplituda dla danych czestotliwosci

t = fft2(im); % tez reprezentuje czestotliwosci - obraz powielany wielokrotnie
% widmo mozna poszerzyc i dorysowac okresowo
A = abs(t); % reprezentuje czestotliwosci
A(200, 200) = 10^5;

% tworzymy maske wycinajac prostokat
[h, w] = size(im);

m = zeros(h, w);

m(400 : end - 400, 600 : end - 600) = 1; % przy takiej masce obraz bedzie rozmyty
%m(200 : end - 200, 300 : end - 300) = 1; % wycinamy tylko to co istotne - kompresja

A = A .* fftshift(m);

% najwiekcej funkcji, ktore maja maksymalne i minimalne czestotliwosci
lA = log(A);
maxA = log(max(A(:)));

phi = angle(t);

% zmieniamy faze
%phi(1, 1) = phi(1, 1) - pi;
% zrobila sie inwersja - funkcja w (1, 1) porwonuje sie do siebie
% faza przeciwno - inwersja

% zmianiemy faze 2
%phi = fftshift(phi); % wszystkie fazy zostaly zmienione na inne

% zmieniamy amplitudy

imshow(im);
figure;
imshow(phi, [-pi, pi]); % rozpoznanie przeksztalcen obrazow za pomoca widma fazowego - tego phi

% aby lepiej bylo widac amplitude dzielimy na obraz na 4 czesci i zamienia
% je miejscami - to wlasnie robi fftshit

lA = fftshift(lA); % ten sam obraz - tylko zamiana cwiartek - lepiej widac
% reprezentuje jak bardzo punkty sa podobne do sasiadow

% pionowa kreska reprezentacji lA symbolizuje poziome kreski na obrazie
% oryginalnym

% pozioma kreska reprezentacji lA symbolizuje pionowe kreski na obrazie oryginalnym 

% pozostale kreski pod roznychmi katami odpowiadaja za krawedzie na
% oryginalnym obrazie pod kolejnymi katami

figure;
imshow(lA, [0, maxA]);

im_back = abs(ifft2(A .* exp(1i * phi)));

figure;
imshow(im_back);

% uwagi do sprawka:
% - podpis pod obrazkiem
% - jak wykres - legenda dla kazdej kreski
% - tresc nawiazuje do obrazkow
% - bez wstepu teoretycznego, podstawowe info np o filtrach, a nie kopiowac
% z wiki
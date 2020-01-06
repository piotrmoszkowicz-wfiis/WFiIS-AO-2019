clear;clc;

im = rgb2gray(double(imread('kaczki.jpg'))/255);

avgIm = .55;
bim = ~imbinarize(im, avgIm);
bim = imclose(bim, ones(8));

d = bwdist(~bim); % mozemy zanegowac, wtedy "kaczki staja sie tlem", dostajemy wododzial - granice segmentacji

% transformata odleglosciowa obrazu
% wpisujemy wartosci, jak daleko sie cos znajduje od obiektu (np jednostka
% - piksele)

% obiekty wtedy sa wpisane jako 0, no a reszta to te odleglosci
% im jasniejsze tym dalej od obiektu
imshow(d / max(d(:)));
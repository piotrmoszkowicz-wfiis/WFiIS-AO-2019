clear; clc;

im = double(imread('ptaki2.jpg'))/255;

gim = rgb2gray(im);


bim = ~imbinarize(gim, .5);


%figure;
%imshow(bim);


bim = imclose(bim, ones(5));
%bim = imopen(bim, ones(5));

%figure;
%imshow(bim);

% segmentacja
l = bwlabel(bim);

n = max(l(:));

for i = 1:n
    if length(l(l==i)) < 1000
       l(l==i) = 0; 
    end
end

l = bwlabel(l > 0);
n = max(l(:));

%figure;
%imshow(label2rgb(l));

fun = {@AO5RMalinowska, @AO5RDanielsson, @AO5RBlairBliss, @AO5RHaralick, @AO5RFeret};
Nfun = length(fun);

wsp2 = zeros(n, Nfun);

for i=1:n
    k = regionprops(l == i, 'all');
    for j=1:Nfun
        wsp2(i, j) = fun{j}(k.Image);
    end
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = double(imread('ptaki.jpg'))/255;
r = im(:,:,1);
b = im(:,:,3);

b = ~imbinarize(b, 0.6);

r(r < 0.15) = 1;
r = imbinarize(r, 0.3);

bim = b | r;

bim = imclose(bim, ones(5));
bim = imopen(bim, ones(5));

l = bwlabel(bim);

n = max(l(:));

%figure;
%imshow(label2gray(l));

wsp = zeros(n, Nfun);

for i=1:n
    k = regionprops(l == i, 'all');
    for j=1:Nfun
        wsp(i, j) = fun{j}(k.Image);
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = double(imread('kaczki.jpg'))/255;
gim = rgb2gray(im);

bim = ~imbinarize(gim, 0.6);
bim = imclose(bim, ones(6));

%figure;
%imshow(bim);

l = bwlabel(bim);
n = max(l(:));

%figure;
%imshow(label2rgb(l));

wsp3 = zeros(n, Nfun);

for i=1:n
    k = regionprops(l == i, 'all');
    for j=1:Nfun
        wsp3(i, j) = fun{j}(k.Image);
    end
    
end

% sieæ neuronowa

ucz = [wsp; wsp2]';
uczout = [ones(1, size(wsp, 1)), 2 * ones(1, size(wsp2, 1))];

% nauka sieci neuronowej

nn = feedforwardnet;
nn = train(nn, ucz, uczout);

x = nn(wsp(1, :)');
y = nn(ucz);
res = round(y) == uczout; % jak bardzo pokrywaja nam sie rezultaty z sieci neuronowej z oryginalem

nieznane_dane_res = nn(wsp3'); % wartosci blisko 1 - wsp3 bardziej podobne do wsp


% SPRAWKO:
% - Morfologia, segmentacja l5
% 




% - Wspó³czynniki geometryczne l6




% - Klasyfikacja l7
% funkcja save - mo¿na zapisywaæ dane, min. sieæ neuronow±

% PROJEKT:
% - dokumentacja - co za projekt, do czego s³u¿y; jak odpaliæ (je¶li co¶ wiêcej
% ni¿ play w matlabie); kto co robi³; co nie dzia³a - je¶li jest opisane to OK?
% - przyk³adowe dane; przetestowaæ na du¿ym obrazku

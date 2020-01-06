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

% circularity - jaka �rednica, �eby powsta�e ko�o mia�o takie same pole jak nasza
% figura

dl = 2 * sqrt(prop.Area / pi);

% circularity 2 - jaka �rednica, �eby obw�d ko�a by� taki sam jak obw�d naszej figury

ds = prop.Perimeter / pi;

% stosunek dl / ds MUSI zawsze by� taki sam!!! niezale�nie od rozmiar�w
% obrazu!!

% wsp�czynnik malinowski - podobie�stwo figury do ko�a - 0 -> jest ko�em

d = (ds / dl) - 1;

% �rednia odleg�o�� piksela od kraw�dzi - wsp�czynnik Danielsona - r�wnie�
% podobie�stwo figury do ko�a - tutaj odwrotno��, aby r�wnie� 0 -> jest
% ko�em

dD = AO5RDanielsson(prop.Image);

% �rednia odleg�o��piksela od �rodka masy - wsp�czynnika Blair-Bliss'a

dBB = AO5RBlairBliss(prop.Image);

% wsp�czynnik Harlika - odleg�o�� piksela na kraw�dzi od �rodka masy

dH = AO5RHaralick(prop.Image);

% wsp�czynnik Ferret'a

dF = AO5RFeret(prop.Image);

% ^ implementacja jest na stronie do �ci�gni�cia pod nazw� "wsp�czynniki
% geometryczne"
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

% circularity - jaka ¶rednica, ¿eby powsta³e ko³o mia³o takie same pole jak nasza
% figura

dl = 2 * sqrt(prop.Area / pi);

% circularity 2 - jaka ¶rednica, ¿eby obwód ko³a by³ taki sam jak obwód naszej figury

ds = prop.Perimeter / pi;

% stosunek dl / ds MUSI zawsze byæ taki sam!!! niezale¿nie od rozmiarów
% obrazu!!

% wspó³czynnik malinowski - podobieñstwo figury do ko³a - 0 -> jest ko³em

d = (ds / dl) - 1;

% ¶rednia odleg³o¶æ piksela od krawêdzi - wspó³czynnik Danielsona - równie¿
% podobieñstwo figury do ko³a - tutaj odwrotno¶æ, aby równie¿ 0 -> jest
% ko³em

dD = AO5RDanielsson(prop.Image);

% ¶rednia odleg³o¶æ piksela od ¶rodka masy - wspó³czynnika Blair-Bliss'a

dBB = AO5RBlairBliss(prop.Image);

% wspó³czynnik Harlika - odleg³o¶æ piksela na krawêdzi od ¶rodka masy

dH = AO5RHaralick(prop.Image);

% wspó³czynnik Ferret'a

dF = AO5RFeret(prop.Image);

% ^ implementacja jest na stronie do ¶ci±gniêcia pod nazw± "wspó³czynniki
% geometryczne"
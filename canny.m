i =imread('lena_gray_256.tif');

%i=rgb2gray(i);
%for noise
%i=imnoise(i,'salt & pepper',0.05);
i=edge(i,'canny');
imshow(i);



close all
clear all


im1=imread('bicycle.bmp');
I = rgb2gray(im1);
J = dct2(I);
figure
imshow(im1)
title('Image 1')


im2=imread('motorcycle.bmp');
I2 = rgb2gray(im2);
J2 = dct2(I2);
figure
imshow(im2)
title('Image 2')

figure
subplot(2,3,1),imshow(im1),title('Image 1')
subplot(2,3,2),imagesc(log(abs(fftshift(fft2(I))))), colormap(jet(64)), colorbar
title('FFT of Image 1')
subplot(2,3,3),imshow(log(abs(J)),[]), colormap(jet(64)), colorbar
title('DCT of Image 1')
subplot(2,3,4),imshow(im2),title('Image 2')
subplot(2,3,5),imagesc(log(abs(fftshift(fft2(I2))))), colormap(jet(64)), colorbar
title('FFT of Image 2')
subplot(2,3,6),imshow(log(abs(J2)),[]), colormap(jet(64)), colorbar
title('DCT of Image 2')

%Filtering
cutoff_frequency = 10; 
cutoff_frequency2 = 8; 

filter = fspecial('Gaussian', cutoff_frequency*4+1, cutoff_frequency);
filter2 = fspecial('Gaussian', cutoff_frequency2*4+1, cutoff_frequency2);

I3 = filter;
J3 = dct2(I3);

I4 = filter2;
J4 = dct2(I4);

figure
subplot(2,3,1),imagesc(filter),title('Filter (Low)')
subplot(2,3,2),imagesc(log(abs(fftshift(fft2(I3)))))
title('FFT of Filter (Low)')
subplot(2,3,3),imshow(log(abs(J3)),[])
title('DCT of Filter (Low)')
subplot(2,3,4),imagesc(filter2),title('Filter (High)')
subplot(2,3,5),imagesc(log(abs(fftshift(fft2(I4)))))
title('FFT of Filter (High)')
subplot(2,3,6),imshow(log(abs(J4)),[])
title('DCT of Filter (High)')

low_frequencies=imfilter(im1,filter);
high_frequencies=im2-imfilter(im2,filter2);
hybrid_image= low_frequencies + high_frequencies;

I5 = rgb2gray(low_frequencies);
J5 = dct2(I5);

I6 = rgb2gray(high_frequencies);
J6 = dct2(I6);

figure
subplot(2,3,1),imshow(low_frequencies),title('Filtered Image 1(Low)')
subplot(2,3,2),imagesc(log(abs(fftshift(fft2(I5))))), colormap(jet(64)), colorbar
title('FFT of Filtered Image 1(Low)')
subplot(2,3,3),imshow(log(abs(J5)),[]), colormap(jet(64)), colorbar
title('DCT of Filtered Image 1(Low)')
subplot(2,3,4),imagesc(high_frequencies),title('Filtered Image 2(High)')
subplot(2,3,5),imagesc(log(abs(fftshift(fft2(I6))))), colormap(jet(64)), colorbar
title('FFT of Filtered Image 2(High)')
subplot(2,3,6),imshow(log(abs(J6)),[]), colormap(jet(64)), colorbar
title('DCT of Filtered Image 2(High)')


figure
imshow(hybrid_image)
title('Hybrid Image Generated')

%Piramide para visualizar 
I0 = hybrid_image;
I1 = impyramid(I0, 'reduce');
I2 = impyramid(I1, 'reduce');
I3 = impyramid(I2, 'reduce');
I4 = impyramid(I3, 'reduce');

figure
    subplot(3,2,1), subimage(I0), title('Imagen');
    subplot(3,2,2), subimage(I1), title ('Primer nivel');
    subplot(3,2,3), subimage(I2), title ('Segundo nivel');
    subplot(3,2,4), subimage(I3), title ('Tercer nivel');
    subplot(3,2,5), subimage(I4), title ('Cuarto nivel');
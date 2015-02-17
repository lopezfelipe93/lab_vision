# Introduction to Images in Matlab

=======

## Working directory

The following commands can be used inside matlab, just like in bash

    -   pwd
    -   ls
    -   cd



Note the current directory is also shown at the top of the graphical interface

1.  Change to the *misc* directory, which contains the uncompressed sipi_images
2.  List the contents of the directory
   
>> ls
4.1.01.tiff  4.1.06.tiff  4.2.03.tiff  5.1.09.tiff  5.1.14.tiff  5.3.02.tiff  7.1.05.tiff  7.1.10.tiff	  
house.tiff   4.1.02.tiff  4.1.07.tiff  4.2.04.tiff  5.1.10.tiff  5.2.08.tiff  7.1.01.tiff  7.1.06.tiff  
7.2.01.tiff	    numbers.512.tiff       4.1.03.tiff  4.1.08.tiff  4.2.05.tiff  5.1.11.tiff  5.2.09.tiff  
7.1.02.tiff  7.1.07.tiff  boat.512.tiff    ruler.512.tiff
4.1.04.tiff  4.2.01.tiff  4.2.06.tiff  5.1.12.tiff  5.2.10.tiff  7.1.03.tiff  7.1.08.tiff  elaine.512.tiff  testpat.1k.tiff
4.1.05.tiff  4.2.02.tiff  4.2.07.tiff  5.1.13.tiff  5.3.01.tiff  7.1.04.tiff  7.1.09.tiff  gray21.512.tiff

## Reading Images

 [imread]

1.  Look at the manual page for the command
2.  Read the ``5.1.12`` image
    What is the dimension of the output?
        a=imread('5.1.12.tiff')
    >  256 X 256 

3.  Read the ``4.2.03`` image
    What is the dimension of the output?
        b=imread('4.2.03.tiff')
    >  512 x 512 x 3 



## Displaying Images

The following commands can be used for displaying images

[image]
[imshow]
1.  Look at their manual pages
2.  Try displaying the images read in the previous point using both commands
-   [image]
-   a=imread('5.1.12.tiff')
-   image(a)
-   [imshow]
-   a=imread('5.1.12.tiff')
-   imshow(a)
3.  What are the differences?

    >  The 'image' function displays the image with random colors, while the 'imshow' shows the image with the real      colors of the image. This is because the colors that 'image' uses to represent each value are meaningless in          representing the matrix as an image, it just displays it as a matrix of numbers. While 'imshow' works with the        matrix as an image and displays its values as pixel intensities.

## Writing Images

 [imwrite]
1.  Look at the manual page
2.  Write one of the images from before as png and as jpg
    >> A = imread('5.1.12.tiff');
    >> B = imread('4.2.03.tiff');
    >> imwrite(A,'5.1.12.png')
    >> imwrite(A,'5.1.12.jpg')

3.  Write a matlab function that takes the path of an image and converts it to jpg

    function im_2_jpg (image)
        %Funcion para convertir el formato de una imagen en cualquier formato
        %  a un formato jpg, se utiliza como parametro el nombre del archivo que
         % se quiere convertir
            A = imread(image);
            [pathstr,name,ext] = fileparts(image);
            imwrite(A,[name,'.jpg'])
    end

    function all_2_jpg
        %Funcion que busca todas las imagenes .tiff del directorio en el que 
        % se encuentra y las convierte a formato jpg
        %Busca las imagenes en formato '.tiff'
        files= dir('*.tiff');
        
        numel=length(files);
        
        for i= 1:numel
        %Busca los nombres de cada archivo en la estructura de datos
         fileName=files(i).name;
        %Lee la imagen, y la convierte a jpg
        A= imread(fileName);
        [pathstr,name,ext] = fileparts(fileName);
        imwrite(A,[name,'.jpg'])
    end

=======

## Writing Images

The [imwrite](http://www.mathworks.com/help/matlab/ref/imwrite.html) image is used for writing images to disk

1.  Look at the manual page
2.  Write one of the images from before as png and as jpg
3.  Write a matlab function that takes the path of an image and converts it to jpg

## Matlab and the shell

### Shell from Matlab

It is possible to excecute bash commands from matlab by using the [system](http://www.mathworks.com/help/matlab/ref/system.html) command
or by using a [bang](http://www.mathworks.com/help/matlab/matlab_env/run-external-commands-scripts-and-programs.html)

1.  Look at the manual pages
2.  Try it (for example ``!ps``)

### Matlab from the shell

It is also possible to invoke matlab in a non interactive mode to run a script from the terminal. If the matlab
binary is on the system PATH you can do something like this

```bash
matlab -nodisplay -nosplash -r "write_jpg('boat.512.tiff'); exit"
# or
matlab -nodisplay -nosplash script.m"
```
If the command or script doesn't end in ``exit`` the matlab shell will stay open, and will block the bash script.

### Exercise

1.  Create a script for converting all tiff images to jpeg
    -   You may create a bash script that calls matlab
    -   Or a matlab script that calls bash 
    -   Or both
2.  Save this script in the matlab lab folder of your git repository

>> matlab -nodisplay -nosplash all_2_jpg.m

=======
## Filters

### Adding noise

 [imnoise]

1.  Read the manual page
2.  Try the diffente noise types, and save the noisy images to the repository (5 images)

>> files= dir('*.tiff');
>> Noise1=imread(files(1).name);
>> Noise2=imread(files(2).name);
>> Noise3=imread(files(3).name);
>> Noise4=imread(files(4).name);
>> Noise5=imread(files(5).name);
Imagen 1
>> Noise_gaussian=imnoise(Noise1,'gaussian');
>> imwrite(Noise_gaussian,'Noise_gaussian.jpg')

Imagen 2
>> Noise_poisson=imnoise(Noise2,'poisson');
>> imwrite(Noise_poisson,'Noise_poisson.jpg')

Imagen 3
>> Noise_saltNpepper=imnoise(Noise3,'salt & pepper');
>> imwrite(Noise_saltNpepper,'Noise_saltNpepper.jpg')

Imagen 4
>> Noise_speckle=imnoise(Noise4,'speckle');
>> imwrite(Noise_speckle,'Noise_speckle.jpg')

Imagen 5
>> Noise_localvar=imnoise(Noise5,'localvar',0.05*rand(size(Noise5)));
>> imwrite(Noise_localvar,'Noise_localvar.jpg')


3.  Try saving noisy images as jpg, what happens?

    > Nothing?


### Median filter

These filters can be applied to a an image in order to remove noise. 
-   To apply a mean filter create it with the function  [fspecial], apply it with [imfilter]
-    Median Filter: [medfilt2]

1.  Read the manuals for the functions described above
2.  Try applying both kinds of filters to noisy images. Be sure to zoom in to see the effects
3.  Try different sizes for the filters
4.  Which filter works best for salt & pepper noise?

    > The median filter works best because it filters the noise without blurring the edges of the image.


### Blur

To blur or smooth an image we can use the mean filter described above. We can also use the gaussian filter
which can be otained from [fspecial]

1.  Smooth an image using average and gaussian filters
2.  Try different sizes for the filters
3.  What differences do you notice?

    > Answer

### Sharpen

 [imsharpen]

1.  Sharp the ``5.1.12`` image. What do you notice?
    >> Sharp1=imread('5.1.12.tiff');
    >> imshow(Sharp1)
    >> SharpIm=imsharpen(Sharp1);
    >> figure; imshow(SharpIm)
    
    > You can see an image whose differences between intensity values are much more noticeable. It gives an enhanced 
    > version of the image, you can see the edges better and the difference between objects.

2.  Sharp a blurred image. What do you notice?

    > Answer

### Edge detection

The following filters from fspecil can be used to enhance edges in an image
-   laplacian
-   log
-   prewitt
-   sobel

Notice that the last two filters detect horizontal edges, in order to detect vertical edges you have to transpose them.

1.  Try applying this filters
2.  What is the difference between prewitt and sobel?

    > Answer



## Color Spaces

 [color]

1.  Load the ``4.2.03.tiff`` image (Mandril).
2.  Split it into the three color channels
    
    ```matlab
    img=imread('4.2.03.tiff');
    r = img(:,:,1);
    g = img(:,:,2);
    b = img(:,:,3);
    ```
3.  Look at the three channels simultaneusly

    ```matlab
    figure;
    subplot(2,2,1), subimage(img);
    subplot(2,2,2), subimage(r);
    subplot(2,2,3), subimage(g);
    subplot(2,2,4), subimage(b);
    ```
    
4.  Save the mosaic as a png file
    
    ```matlab
    print ('-dpng','rgb_mosaic.png');
    ```
5.  Transform the image to the following color spaces and repeat the exercise
    -   ycbcr
        RGB = imread('4.2.03.tiff');
        YCBCR = rgb2ycbcr(RGB);
         Y = YCBCR(:,:,1);
        CB = YCBCR(:,:,2);
        CR = YCBCR(:,:,3);
        figure;
        subplot(2,2,1), subimage(YCBCR), title('Imagen');
        subplot(2,2,2), subimage(Y), title ('Y');
        subplot(2,2,3), subimage(CB), title ('Cb');
        subplot(2,2,4), subimage(CR), title ('Cr');
        print ('-dpng','YCbCr_mosaic.png');
    
    -   lab
        RGB = imread('4.2.03.tiff');
        LAB = rgb2lab(RGB);
        L = LAB(:,:,1);
        a = LAB(:,:,2);
        b = LAB(:,:,3);
        figure;
        subplot(2,2,1), subimage(LAB), title('Imagen');
        subplot(2,2,2), subimage(L), title ('L');
        subplot(2,2,3), subimage(a), title ('a*');
        subplot(2,2,4), subimage(b), title ('b*');
        print ('-dpng','Lab_mosaic.png');

    -   hsv 
        RGB = imread('4.2.03.tiff');
        HSV = rgb2hsv(RGB);
         H = HSV(:,:,1);
         S = HSV(:,:,2);
         V = HSV(:,:,3);
        figure;
        subplot(2,2,1), subimage(HSV), title('Imagen');
        subplot(2,2,2), subimage(H), title ('H');
        subplot(2,2,3), subimage(S), title ('S');
        subplot(2,2,4), subimage(V), title ('V');
        print ('-dpng','HSV_mosaic.png');
        
6.  Save all the mosaics in your github repository

## Pyramids

 [impyramid]
 
1.  Read the manual page
2.  Create a four level pyramid from the ``5.1.12`` clock  image

    >>I0 = imread('5.1.12.tiff');
    >>I1 = impyramid(I0, 'reduce');
    >>I2 = impyramid(I1, 'reduce');
    >>I3 = impyramid(I2, 'reduce');
    >>I4 = impyramid(I3, 'reduce');

        >>figure;
        subplot(3,2,1), subimage(I0), title('Imagen');
        subplot(3,2,2), subimage(I1), title ('Primer nivel');
        subplot(3,2,3), subimage(I2), title ('Segundo nivel');
        subplot(3,2,4), subimage(I3), title ('Tercer nivel');
        subplot(3,2,5), subimage(I4), title ('Cuarto nivel');
        print ('-dpng','Pyramid1.png');
        

3.  At what level does the people in the picture dissappear?

    >  From the third level on, it is not possible to identify the silhouette of any person.
    
4.  At what level does the numbers in the clock disappear?

    >  From the second level on, it is not possible to identify the shape on any number in the clock.


## Template Matching

 [norm2corrx]

1.  Download the ``sequences.tar.gz`` file (from guitaca or sipi) and decompress it
2.  Go to the sequences directory
3.  Read the ``motion04.512.tiff`` image
4.  Use the ``imcrop`` comand to crop the train at the right side of the figure
    
    ```matlab
    [train,square] = imcrop(image);
    ```
5.  Now use [normxcorr2]

    ```matlab
    c=normxcorr2(train,image);
    % c is correlation from -1 to 1
    [sx,sy] = size(image);
    d=floor(size(train)/2);
    dx=d(1);
    dy=d(2);
    %Remove borders from c2 to make it the same size as image
    c2=c(dx+1:sx+dx,dy+1:sy+dy);
    %lets accentuate it more
    c3=c2.^3;
    %convert it into an image from 0 to 1
    cr=0.5+0.5*c3;
    %leave the original image as the luminance channel
    y=mat2gray(image);
    %empty cb channel
    cb=0.5*ones(size(image));
    %join the three channels
    ycbcr=cat(3,y,cb,cr);
    rgb=ycbcr2rgb(ycbcr);
    imshow(rgb);
    ```
6.  Explain what the above code does

    > The above code uses the image 'train' as a pattern and correlates it with the image 'image' to find the places that           look the most like the image train, thus those places will give the highest correlation. Then it shows an image with           bright spots where the highest correlation is in the image.

    
7.  Now lets find the train in the next frame, read image ``motion05.512.tiff``.
8.  Apply the procedure written above to it (use the train template from the past frame)
9.  What are the limitations of this method?


## End




function all_2_jpg
%Funcion que busca todas las imagenes .tiff del directorio en el que 
% se encuentra y las convierte a formato jpg

%Busca las imagenes en formato .tiff
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





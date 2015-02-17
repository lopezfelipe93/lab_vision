function im_2_jpg (image)
        %Funcion para convertir el formato de una imagen en cualquier formato
        %  a un formato jpg, se utiliza como parametro el nombre del archivo que
         % se quiere convertir
 
            A = imread(image);
            [pathstr,name,ext] = fileparts(image);
            imwrite(A,[name,'.jpg'])
end
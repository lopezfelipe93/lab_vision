function [resultado] = k_means(imagen,k)
close all

%Asegurar que la imagen a B&W
imagen=rgb2gray(imagen);

figure(1)
imshow(imagen)
title('Imagen Original')

%Niveles de gris de la imagen
num_pixeles= zeros(256,1);
nivel_gris= zeros(256,1);

for i=1:256
	num_pixeles(i)=sum(sum(imagen==(i-1)));
end

for i=1:256
	nivel_gris(i)=i-1;
end

%Hisograma de la imagen original
% figure(2)
% stem(nivel_gris,num_pixeles)
% title('Histograma de la Imagen Original')

centroides=zeros(k,1);

for i=1:k
    centroides(i)=uint8(rand*255);
end

cluster=zeros(k,1);
contador_clusters=zeros(k,1);

%El algoritmo se detiene cuando no haya cambio en la asignacion de
%promedios al vector cluster, es decir cuando el vector centroides sea
%igual al vector cluster

while (centroides ~= cluster)
    %(sum(sum(abs(cluster-centroides))) > 0.5)
    cluster=centroides; 
    asigna_cluster= zeros(256,1);
    distancia_min= uint8(zeros(256,1));
    
    % Calculo de la distancia (diferencia de nivel de gris) de un pixel y el primer centroide 
    distancia_min= abs(nivel_gris-centroides(1));
    
    %Encuentra la distancia minima (diferencia de nivel de gris) entre un pixel y cualquier cluster
    for i=2:k
		distancia_min =min(distancia_min,abs(nivel_gris-centroides(i)));
    end
    
    %Busqueda del cluster mas cercano al nivel de gris
    for i=1:k
       
	    asigna_cluster(distancia_min==(abs(nivel_gris-cluster(i)))) = i;
        
    end
    
    %Calculo del numero de pixeles que pertenecen a cada cluster
    
    for i=1:k
		contador_clusters(i) = sum(num_pixeles .*(asigna_cluster==i));
    end


    for i=1:k
        
        %Se comprueba que el valor del centroide calculado en el random
        % contega pixeles
        if (contador_clusters(i) == 0)
			centroides(i) = uint8(rand*255);
            
        else
            %Realiza un promedio de los valores que tienen asignado el
            %mismo cluster y asigna este nuevo valor a la posicion que le
            %corresponde en el vector centroides
			centroides(i) = uint8(sum(num_pixeles(asigna_cluster==i).*nivel_gris(asigna_cluster==i))/contador_clusters(i));
        end  
    end
    
end

%Imagen resultante de la segmentacion por k-means
resultado=(zeros(size(imagen)));

for i=1:256
	resultado(imagen==(i-1))=centroides(asigna_cluster(i));
    figure(3)
    imagesc(resultado)
    pause(0.01)
    title('Imagen Clusterizada')
end;

num_pixeles2= zeros(256,1);
nivel_gris2= zeros(256,1);

for i=1:256
	num_pixeles2(i)=sum(sum(resultado==(i-1)));
end;

for i=1:256
	nivel_gris2(i)=i-1;
end;

% figure(4)
% stem(nivel_gris2,num_pixeles2)
% title('Histograma de la Imagen Clusterizada')



end








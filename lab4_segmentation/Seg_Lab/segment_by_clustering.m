function my_segmentation=segment_by_clustering( rgb_image, feature_space, clustering_method, number_of_clusters)

%INPUt
%rgb_image : Image name;
%feature_space : 'rgb', 'lab', 'hsv', 'rgb+xy', 'lab+xy', 'hsv+xy'
%clustering_method : k-means, gmm, hierarchical or watershed.


%OUTPUT
% my_segmentation=image (or matrix) where each pixel has a cluster label

Image_RGB= imread(rgb_image);
number_rows = size(Image_RGB,1);
number_cols = size(Image_RGB,2);
figure
imshow(Image_RGB);
title('Original Image in RGB');


 
 %% Change from RGB to new feature space
 
if strcmp(feature_space,'lab')
    cform = makecform('srgb2lab');
    Image_lab = applycform(Image_RGB,cform);
    Image_lab = double(Image_lab(:,:,1:3));
    Image_CC = reshape(Image_lab,number_rows*number_cols,3);

elseif  strcmp(feature_space,'hsv')
    Image_HSV = rgb2hsv(Image_RGB);
    H = Image_HSV(:,:,1); 
    S = Image_HSV(:,:,2); 
    V = Image_HSV(:,:,3); 
    Image_CC= double([H(:) S(:) V(:)]);

elseif  strcmp(feature_space,'rgb')
    Image_CC=double(reshape(Image_RGB(:),[],3));
    
    
elseif  strcmp(feature_space,'rgb+xy')
    Image_CC=double(reshape(Image_RGB(:),[],3));
    Cont=0;
         for i=1:number_cols
            for j=1:number_rows
               Cont=Cont+1;
               Image_CC(Cont,4)=i;
               Image_CC(Cont,5)=j;
            end
         end
    

elseif  strcmp(feature_space,'lab+xy')
    cform = makecform('srgb2lab');
    Image_lab = applycform(Image_RGB,cform);
    Image_lab = double(Image_lab(:,:,1:3));
    Image_CC = reshape(Image_lab,number_rows*number_cols,3);
    Cont=0;
         for i=1:number_cols
            for j=1:number_rows
               Cont=Cont+1;
               Image_CC(Cont,4)=i;
               Image_CC(Cont,5)=j;
            end
         end
    
elseif  strcmp(feature_space,'hsv+xy')
    Image_HSV = rgb2hsv(Image_RGB);
    H = Image_HSV(:,:,1); 
    S = Image_HSV(:,:,2); 
    V = Image_HSV(:,:,3); 
    Image_CC= double([H(:) S(:) V(:)]);
    Cont=0;
         for i=1:number_cols
            for j=1:number_rows
               Cont=Cont+1;
               Image_CC(Cont,4)=i;
               Image_CC(Cont,5)=j;
            end
         end
    
end


%% Segmentation method
if strcmp(clustering_method,'k-means')
    % repeat the clustering 3 times to avoid local minima
    %cluster_id = kmeans(Image_CC,number_of_clusters,'distance','sqEuclidean', 'Replicates',3);
    cluster_id = kmeans(Image_CC,number_of_clusters);
    pixels_labeled = reshape(cluster_id,number_rows,number_cols);

elseif strcmp(clustering_method,'gmm')
    cluster_id=gmdistribution.fit(Image_CC, number_of_clusters);
    clusters=cluster(cluster_id, Image_CC);
    pixels_labeled = reshape(clusters,number_rows,number_cols);

elseif strcmp(clustering_method,'watersheds')
    Image_Gray=rgb2gray(Image_RGB);
    %gradient?s magnitude
    hy = fspecial('sobel');
    hx = hy';
    Iy = imfilter(double(Image_Gray), hy, 'replicate');
    Ix = imfilter(double(Image_Gray), hx, 'replicate'); 
    grad = sqrt(Ix.^2 + Iy.^2);
    %markers
    marker = imextendedmin(grad, number_of_clusters);
    new_grad= imimposemin(grad, marker);
    % watersheds
    ws= watershed(new_grad);
    pixels_labeled = label2rgb(ws,'jet','w','shuffle');
    
end



%% Display the segmented image
% %Display the final figure
 my_segmentation=pixels_labeled;
figure
imagesc(pixels_labeled)
title('Image labeled by cluster index');
 
 
end

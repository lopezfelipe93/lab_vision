function my_segmentation=segment_by_clustering( rgb_image, clustering_method, number_of_clusters)

%INPUT
%feature_space : 'rgb', 'lab', 'hsv', 'rgb+xy', 'lab+xy', 'hsv+xy'
%clustering_method : k-means, gmm, hierarchical or watershed.


%OUTPUT
% my_segmentation=image (or matrix) where each pixel has a cluster label



if strcmp(clustering_method,'k-means')
    
 [resultado1] = k_means(rgb_image,number_of_clusters);
  resultado=resultado1;
  
% elseif strcmp(clustering_method,'watershed')
%   [resultado2] = watershed_clusters(rgb_image);
%   resultado=resultado2;
%   
% elseif strcmp(clustering_method,'gmm')
%   
%     fn_imgSegmentationGMMBIC(rgb_image, number_of_clusters);
    
end

 my_segmentation=resultado;
 
end

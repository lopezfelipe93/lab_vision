% Running PHOW in imagenet multiple times.


%% Changing number of classes
Train=65;
Test=20;
Classes=15;
SpatialX=[2 4];
Classes=[2,5,7,9,10,12,15,20,25,30,50,60,75,90];

for i=1:length(Classes)
tic;    
[accuracy_classes(i)]= phow_IMGNET(Train,Test,Classes(i),SpatialX,i);
time_classes(i)=toc;

end

%% Changing training set
close all ; clear all; clc 
Train=65;
Test=20;
Classes=15;
SpatialX=[2 4];

Train=[5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100];

for i=1:length(Train)
tic;    
[accuracy_Train(i)]= phow_IMGNET(Train(i),Test,Classes,SpatialX,i);
time_Train(i)=toc;

end

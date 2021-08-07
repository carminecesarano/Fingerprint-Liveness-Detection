close all; clear all; clc;

myFolder = 'C:\Users\ccesa\Desktop\DATI\Augumented\Train\Clean';

filePattern = fullfile(myFolder, '*.png');
jpegFiles = dir(filePattern);


for k = 1:length(jpegFiles)
    baseFileName = jpegFiles(k).name;
    fullFileName = fullfile(myFolder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
   
    I = imread(fullFileName);
    I = rgb2gray(I);
    
    patch1 = I(1:224,1:224,:);
    newname = "1_" + baseFileName;
    imwrite(patch1,newname);
    
    patch2 = I(1:224,end-223:end,:);
    newname = "2_" + baseFileName;
    imwrite(patch2,newname);
    
    patch3 = I(end-223:end,1:224,:);
    newname = "3_" + baseFileName;
    imwrite(patch3,newname);
    
    patch4 = I(end-223:end,end-223:end,:);
    newname = "4_" + baseFileName;
    imwrite(patch4,newname);
    
    sz = size(I);
    x = floor(sz(2)/2);
    y = floor(sz(1)/2);
    patch5 = I(y-112:y+111, x-112:x+111, :);
    newname = "5_" + baseFileName;
    imwrite(patch5,newname);
    
    
end


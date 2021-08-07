% LCPD Demo
close all; clear all; clc;


myFolder = 'D:\UNI\Materiale Didattico\Laurea Magistrale\SECONDO ANNO\Data Mining\Progetto\unina-data-mining-2021-final-contest\Train\TRAIN\Clean';

filePattern = fullfile(myFolder, '*.png');
jpegFiles = dir(filePattern);

for k = 1:length(jpegFiles)
    
    baseFileName = jpegFiles(k).name;
    fullFileName = fullfile(myFolder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    
    I = imread(fullFileName);
    I = rgb2gray(I);

    sz = size(I);
    x = floor(sz(2)/2);
    y = floor(sz(1)/2);
    patch = I(y-126:y+125, :, :);
    
    patch = cat(3,patch,patch,patch);
    imwrite(patch,baseFileName);
end


%% determine the number of components 
% manually change _chem_ and fill in the vector in the next cell
close all;clc;

chem    = 24;
nIter   = 5;
nFacMax = 5;

pftest(nIter, data(:,:,(18*chem-17):(18*chem)), nFacMax,[0 0 0 0 NaN]);
% save evidence
saveas(gcf,['./fig/parafac/num/',chemName{18*chem},'.pdf']);
%%
% the following vector was created by Ce Gao on 2013-12-03
nFac = [2 2 1 2 1 ...
        2 1 2 2 2 ...
        2 2 2 2 2 ...
        2 2 2 1 2 ...
        2 2 2 2]' ;
    
%% put nFac into data.mat
save ./data/data.mat data chemName geneName pathName nFac;
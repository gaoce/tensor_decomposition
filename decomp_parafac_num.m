%% determine the number of components 
% manually change _chem_ and fill in the vector in the next cell
close all;

chem    = 24;
nIter   = 5;
nFacMax = 10;

pftest(nIter, data(:,:,(18*chem-17):(18*chem)), nFacMax);
% save evidence
saveas(gcf,['./fig/parafac/test/',chemName{18*chem},'.pdf']);
%%
% the following vector was created by Ce Gao on 2013-12-03
nFac = [5 3 4 4 3 ...
        2 4 4 2 3 ...
        3 3 1 2 2 ...
        2 4 4 3 2 ...
        2 3 2 2]' ;
    
%% put nFac into data.mat
save ./data/data.mat data chemName geneName pathName nFac;
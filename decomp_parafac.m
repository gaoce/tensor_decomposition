nChem = length(unique(chemName));
parModels = cell(nChem,1);

for i = 1:nChem
    parModels{i} = parafac(data(:,:,(18*i-17):(18*i)), nFac(i)); 
end
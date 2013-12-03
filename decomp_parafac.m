nChem = length(unique(chemName));

% factors for parafac models, each element contains the factors for one chem
factsCP = cell(nChem,1);
perExpl = zeros(nChem,1); % percent explained

for i = 1:nChem
    [factsCP{i},~,~,~,perExpl(i)]= parafac(data(:,:,(18*i-17):(18*i)),...
        nFac(i), [0 0 0 0 NaN]); 
end

save ./data/data.mat chemName geneName data nFac factsCP perExpl;
nChem = length(unique(chemName));

% factors for parafac models, each element contains the factors for one chem
factsCP = cell(nChem,1);
perExpl = zeros(nChem,1); % percent explained
coreCon = zeros(nChem,1); % percent explained

disp('-----decomp_main-----');
for i = 1:nChem
    [factsCP{i},~,~,coreCon(i),perExpl(i)]= parafac(data(:,:,(6*i-5):(6*i)),...
        nFac(i), [0 0 0 0 NaN]); 
end


save('./data/data.mat','factsCP', 'coreCon', 'perExpl','-append');
% main file to conduct GSEA (gene set enrichment analysis on each components of 
% decomposed tensor)

sigs  = cell(nChem,1); % significances (p-values)
ranks = cell(nChem,1); % ranking information

feat.gene    = geneName;
feat.pathway = pathName;

for i = 1:nChem
    nComp = size(factsCP{i}{1},2);
    rankComp = cell(nComp,1);
    for j = 1:nComp
        model_raw   = nmodel({factsCP{i}{1}(:,j), factsCP{i}{2}(:,j),...
                              factsCP{i}{3}(:,j)});
        
        % switch gene and time dimension
        model_per   = permute(model_raw,[2 1 3]);  
        
        rank        = gsea_rankCpca(model_per, feat,0.5);
        sigs{i}{j}  = gsea_evaluate(rank);
        ranks{i}{j} = rank;
    end
end

save ./data/data.mat chemName geneName pathName data nFac factsCP perExpl sigs ranks;
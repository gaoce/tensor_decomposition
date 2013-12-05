% main file to conduct GSEA (gene set enrichment analysis on each components of 
% decomposed tensor)

ranks = cell(nChem,1);
feat.gene = geneName;
feat.pathway = pathName;

for i = 1
    nComp = size(factsCP{i}{1},2);
    rankComp = cell(nComp,1);
    for j = 1:nComp
        model_raw = nmodel({factsCP{i}{1}(:,j),factsCP{i}{2}(:,j),factsCP{i}{3}(:,j)});
        model_per = permute(model_raw,[2 1 3]); % permute index
        rank = gsea_rankCpca(model_per, feat,0.5);
        rankComp{j} = rank;
    end
    ranks{i} = rankComp;
end
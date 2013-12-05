function sig = gsea_evaluate(rank)
% TODO: multiple comparison

rng('default');

paths  = rank.path(:);
scores = zscore(rank.score(:));
nperm = 1000;
p = 1;

assert(size(paths,2) == 1,'pathway must be a single list');
assert(size(scores,2) == 1,'scores must be a single list');

n = length(paths);

pathUni = sort(unique(paths));

randList = zeros(nperm,n);
for i = 1:nperm
    randList(i,:) = randperm(n);
end

es = zeros(length(pathUni),nperm + 1);
for i = 1:length(pathUni)
    es(i,1) = enrichScore(paths, pathUni{i});
    for j = 1:nperm
        es(i,j+1) = enrichScore(paths(randList(j,:)), pathUni{i});
    end
end

for i = 1:length(pathUni)
    sig.(pathUni{i}) = sum(es(i,1) < es(i,2:end))/nperm;
end

    function es = enrichScore(paths,path)
        idx = strcmp(paths,path);
        nh  = sum(idx);
        
        %running score
        rScore = -ones(n,1)/(n-nh);
        rScore(idx) = ( abs(scores(idx)) .^ p ) /sum(abs(scores(idx)));
        es = max(cumsum(rScore));
    end



end

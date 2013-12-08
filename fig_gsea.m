%% global values

nChem = size(sigs,1);
pathUni = unique(pathName);
nPath = length(pathUni);
nGene = length(geneName);

cmap = cbrewer('qual','Set2',6);
cmap = cmap(6:-1:1,:);
colors = zeros(nGene,3);

%%
fh = figure(2);
set(fh,'Visible','off');
for i = 1:nChem
    nComp = size(sigs{i},2);
    for j = 1:nComp
        % TODO: use patch
        rank = ranks{i}{j};
        for k = 1:nPath
            idx = strcmp(rank.path,pathUni{k});
            colors(idx,:) = repmat(cmap(k,:),sum(idx),1);
        end
        
        clf;
        hold on;
        yHeight = max(rank.score);
        for w = 1:nGene
            bar(w,yHeight,1,'FaceColor',colors(w,:),'EdgeColor','none');
        end
        
        xlim([0.5 nGene+0.5]);
        ylim([0 yHeight]);
        scatter(1:nGene,rank.score,40,'fill','MarkerEdgeColor','none');
        
        hold off;
        
        set(gca,'YTick',[]);
        set(fh,'Color','w','Position',[50 50 1000 400]);
        export_fig(gcf,['./fig/barCharts/',chemName{18*i},'_',num2str(j),'.pdf']);
        
    end
end


%% global values

nChem = size(sigs,1);
pathUni = unique(pathName);
nPath = length(pathUni);
nGene = length(geneName);

cmap = cbrewer('qual','Accent',nPath);
cmap = cmap(nPath:-1:1,:);
colors = zeros(nGene,3);
fb = zeros(nGene,1);

%%
fh = figure(2);
set(fh,'color','w','Position',[50 50 900 400],'Visible','off');

disp('-----fig_gsea-----');
for i = 1:nChem
    disp(chemName{6*i});
    nComp = size(sigs{i},2);
    for j = 1:nComp
        clf; % clean figure
        
        rank = ranks{i}{j};
        
        % pathFirstApp stores the first appearance of each path on the
        % list, in order to add legend
        pathFirstApp = zeros(nPath,1); 
        
        for k = 1:nPath
            idx = strcmp(rank.path,pathUni{k});
            colors(idx,:) = repmat(cmap(k,:),sum(idx),1);
            pathFirstApp(k) = find(idx,1); % find the first index
        end
        
        clf;
        
        yHeight = max(rank.score);
        
        hold on;
             
        % vertical color bar representing pathways
        for w = 1:nGene
            fb(w) = bar(w,yHeight,1,'FaceColor',colors(w,:),'EdgeColor','none');
        end
        
        % height of dots representing ranking score
        scatter(1:nGene,rank.score,30,'k','fill','MarkerEdgeColor','none');
        
        hold off;
        
        % legend
        hl = legend(fb(pathFirstApp),pathUni,'Location','EastOutside');
        flt = get(hl,'Title'); % legend title handle
        set(flt,'String','Pathways');
        set(hl,'EdgeColor','w'); % set legend border color to be white

        % axes limits, labels
        xlim([0.5 nGene+0.5]);
        ylim([0 yHeight]);
        xlabel('Genes');
        ylabel('CPCA Score');
        set(gca,'XTick',1:nGene,'XTickLabel',rank.gene,'FontSize',7);
        rotateXLabels( gca, 90 );
        
        % main title
        hmt = title([chemName{6*i}, '    Component ', num2str(j)]);
        set(hmt,'FontSize',12);
        
        set(fh,'Color','w','Position',[50 50 1000 500]);
        refresh;
        export_fig(fh,['./fig/gsea/barCharts/',chemName{6*i},'_',num2str(j),'.pdf']);
        
    end
end
close all;

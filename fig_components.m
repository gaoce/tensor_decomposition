%%
nChem = length(unique(chemName));
nGene = size(factsCP{1}{1},1);
nTime = size(factsCP{1}{2},1);
nSample = size(factsCP{1}{3},1);
%%
fh = figure(1);
set(fh,'Visible','off');
set(fh,'Position',[50 50 800 600],'color','w');

disp('-----fig_components-----');
for i = 1:nChem
    disp(chemName{6*i});
    nComp = size(factsCP{i}{1},2);
    legendStr = cell(nComp,1);
    for j = 1:nComp
        legendStr{j} = ['Component ',num2str(j)];
    end
    
    subplot(2,2,[1 2]);
    plot(factsCP{i}{1},'LineWidth',1.5);
    set(gca,'XTick',1:nGene,'XTickLabel',geneName,'FontSize',8,'Box','off');
    rotateXLabels( gca, 90 );
    xlabel('Genes','FontSize',10);
    ylabel('model factor','FontSize',10);
    legend(legendStr,'Location','SouthEast');
    title(chemName{6*i},'FontSize',13);
    
    subplot(2,2,3);
    plot(factsCP{i}{2},'LineWidth',1.5);
    set(gca,'XTick',[1:6:nTime],'XTickLabel',[0:30:120],'FontSize',8,'Box','off');
    xlabel('Time (minutes)','FontSize',10);
    ylabel('model factor','FontSize',10);
    legend(legendStr,'Location','SouthEast');
    
    subplot(2,2,4);
    plot(factsCP{i}{3},'LineWidth',1.5);
    set(gca,'XTick',1:nSample,'XTickLabel',[1:6,1:6,1:6],'Box','off');
    xlabel('Sample Concentrations','FontSize',10);
    ylabel('model factor','FontSize',10);
    legend(legendStr,'Location','SouthEast','FontSize',8);
    
    export_fig(fh,['./fig/parafac/components/',chemName{6*i},'.pdf']);
end
close all;

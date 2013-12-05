% side by side comparison of the raw data (column 1) and model reconstructed data
% (column 2). 2 randomly selected sample of 18 samples were selected, shown in each 
% row.

for chem = 1:24
    
    disp([num2str(chem),': ',chemName{18*chem}]);
    samps = randi(18,2,1);
    
    dataModel = nmodel(factsCP{chem}); % reconstructed data from model
    
    colorRange = [-2 2];
    
    figure(1);clf;
    
    subplot(2,2,1);
    imagesc(data(:,:,18*(chem-1)+samps(1)),colorRange);
    title(['Original data at random Sample ', num2str(samps(1))]);
    colorbar;
           
    subplot(2,2,2);
    imagesc(dataModel(:,:,samps(1)),colorRange);
    title(['Model data at random Sample ', num2str(samps(1))]);
    colorbar;
    
    subplot(2,2,3);
    imagesc(data(:,:,18*(chem-1)+samps(2)),colorRange);
    title(['Original data at random Sample ', num2str(samps(2))]);
    colorbar;
    
    subplot(2,2,4);
    imagesc(dataModel(:,:,samps(2)),colorRange);
    title(['Model data at random Sample ', num2str(samps(2))]);
    colorbar;
    
    set(gcf,'color','w');
    export_fig(gcf,['./fig/parafac/test/',chemName{18*chem},'.pdf']);
    
% you can uncomment the following line to visually exam the result, or see
% the result altogether in fig/parafac/test
%     pause;
end

close all;
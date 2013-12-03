for chem = 1:24
    disp([num2str(chem),': ',chemName{18*chem}]);
    samps = randi(18,2,1);
    
    dataModel = nmodel(factsCP{chem}); % reconstructed data from model
    
    colorRange = [-2 2];
    
    subplot(2,2,1);
    imagesc(data(:,:,18*(chem-1)+samps(1)),colorRange);
    
    subplot(2,2,2);
    imagesc(dataModel(:,:,samps(1)),colorRange);
    
    subplot(2,2,3);
    imagesc(data(:,:,18*(chem-1)+samps(2)),colorRange);
    
    subplot(2,2,4);
    imagesc(dataModel(:,:,samps(2)),colorRange);

    pause;
end
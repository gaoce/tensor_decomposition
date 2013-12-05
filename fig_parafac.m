nChem = length(unique(chemName));

% heat maps
for i = 1:nChem
    disp(chemName{18*i});
    fig_heatMapDecomp(data(:,:,(18*i-17):(18*i)), factsCP{i}, chemName{18*i});
end

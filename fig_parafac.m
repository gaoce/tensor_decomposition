nChem = length(unique(chemName));

% heat maps
disp('-----fig_heatMapDecomp-----');
for i = 1:nChem
    disp(chemName{6*i});
    fig_heatMapDecomp(data(:,:,(6*i-5):(6*i)), factsCP{i}, chemName{6*i});
end

disp('-----fig_heatMapDecomp-----');
fig_components;
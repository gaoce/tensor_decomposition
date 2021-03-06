% produce a csv table with GSEA calculated significance

nChem = length(sigs);

pathNames = fieldnames( orderfields(sigs{1}{1}) );


fid = fopen('./fig/gsea/sig_table/sig_table.csv','w');

% header
fprintf(fid,'%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n','chem',pathNames{:},'PerExp','CoreCon');

for i = 1:nChem
    nComp = size(sigs{i},2);
    for j = 1:nComp
        s = orderfields(sigs{i}{j});
        pvals = struct2array(s);
        fprintf(fid,'%s,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f\n',...
            [chemName{6*i},'_',num2str(j)], ...
            [pvals,perExpl(i),coreCon(i)]);
        
    end
end

fclose(fid);
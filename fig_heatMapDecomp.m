function fig_heatMapDecomp(data,factors,chemName,colorRange)

if nargin < 4 % no colorRange
    colorRange = [-2,2];
end

[gene,time,sample]=fac2let(factors);

nComp = size(gene,2);
% nSample = size(sample,1);
models = cell(nComp,1);

for i = 1:nComp
    models{i} = nmodel({gene(:,i),time(:,i),sample(:,i)});
end


fh = figure(1);
set(fh,'Position',[50 50 200*(nComp+1) 3000],'color','w','Visible','off');

nRep = 1;
nConc = 18;
for k = 1:nRep
    for j = 1:nConc
        s1 = subplot(nConc,nComp+1,(j-1)*(nComp+1)+1 );
        imagesc(data(:,:,j+(k-1)*nConc),colorRange);
        set(gca,'XTick',[],'YTick',[]);
        if j == 1, title(chemName); end
        s1Pos = get(s1,'position');
        
        for i = 1:nComp
            s2 = subplot(nConc,nComp+1,(j-1)*(nComp+1)+1+i);
            imagesc(models{i}(:,:,j+(k-1)*nConc), colorRange);
            set(gca,'XTick',[],'YTick',[]);
            if j == 1, title(['Comp ',num2str(i)]); end
            if i == nComp
                fc = colorbar;
                set(fc,'YTick',colorRange(1):1:colorRange(2));
                
                % adjust the image size, which has been narrowed by colorbar 
                s2Pos = get(s2,'position');
                s2Pos(3:4) = s1Pos(3:4);
                set(s2,'position',s2Pos);
            end
        end
    end
    export_fig(['./fig/heatmaps/',chemName,'.pdf']);
end
close(fh);
end
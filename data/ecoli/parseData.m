clear; clc;
% PARSINGRAWDATA parse induction (I) in excels in various layout (see README.md), and
% save data into data.mat

%% input gene names for various layout
[~,gene120,~]  = xlsread('layout.xlsx','A2:A127');
[~,path120,~]  = xlsread('layout.xlsx','B2:B127');
[~,gene116,~]  = xlsread('layout.xlsx','C2:C121');
% [~,path116,~]  = xlsread('layout.xlsx','D2:D121');
[~,gene108,~]  = xlsread('layout.xlsx','E2:E109');
% [~,path108,~]  = xlsread('layout.xlsx','F2:F109');

geneName = intersect(intersect(gene120,gene116), gene108);
[~,~,idx120] = intersect(geneName,gene120);
[~,~,idx116] = intersect(geneName,gene116);
[~,~,idx108] = intersect(geneName,gene108);
pathName = path120(idx120);

%% read 120 gene layout
files   = dir('120*.xlsx');  % chemicals with 120 gene layout
data120 = zeros(length(geneName),25,length(files)*3*6); % gene x time x chemical
chem120 = cell(length(files)*3,1);
for i  = 1:length(files)
    for j = 1:3 % 3 sheets for 3 replicates
        for k = 1:6 % 6 conc
            num = xlsread(files(i).name, j,...
                ['B',num2str(3+28*(k-1)),':DW',num2str(27+28*(k-1))]);
            data120(:,:,18*(i-1)+6*(j-1)+k) = num(:,idx120)';
            
            t = regexp(files(i).name,'120_(.*?).xlsx','tokens');
            chem120(18*(i-1)+6*(j-1)+k,1) = t{1};
        end
    end
end


%%
files = dir('116*.xlsx');  % chemicals with 120 gene layout
data116  = zeros(length(geneName),25,length(files)*3); % gene x time x chemical 
chem116 = cell(length(files)*3,1);
for i  = 1:length(files)
    for j = 1:3 % 3 sheets for 3 replicates
        for k = 1:6 % 6 conc
            num = xlsread(files(i).name, j,...
                ['B',num2str(3+28*(k-1)),':DQ',num2str(27+28*(k-1))]);
            data116(:,:,18*(i-1)+6*(j-1)+k) = num(:,idx116)';
            
            t = regexp(files(i).name,'116_(.*?).xlsx','tokens');
            chem116(18*(i-1)+6*(j-1)+k,1) = t{1};
        end
    end
end

%%
files = dir('108*.xlsx');  % chemicals with 120 gene layout
data108  = zeros(length(geneName),25,length(files)*3); % gene x time x chemical 
chem108 = cell(length(files)*3,1);
for i  = 1:length(files)
    for j = 1:3 % 3 sheets for 3 replicates
        for k = 1:6 % 6 conc
            num = xlsread(files(i).name, j,...
                ['A',num2str(3+28*(k-1)),':DE',num2str(27+28*(k-1))]);
            data108(:,:,18*(i-1)+6*(j-1)+k) = num(:,idx108)';
            t = regexp(files(i).name,'108_(.*?).xlsx','tokens');
            chem108(18*(i-1)+6*(j-1)+k,1) = t{1};
        end
    end
end

%% construct data and normalize the anomalies to 1, then take the logarithm
data = cat(3,data120,data116,data108);
data(data<0) = NaN;
data(isnan(data) | data == 0) = 1;
data = log(data);

chemName = cat(1,chem120,chem116,chem108);
save ../data.mat data geneName chemName pathName;

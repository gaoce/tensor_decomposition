%% determine the number of components 
% manually change _chem_ and fill in the vector in the next cell
close all;clc;

chem    = 24;
nIter   = 5;
nFacMax = 5;

X = data(:,:,(6*chem-5):(6*chem));
[ssX,Corco,It] = pftest(nIter, X, nFacMax,[0 0 0 0 NaN]);
perExp = mean( 1 - ssX ./ sum(X(:) .^2), 2)' * 100;
core = mean(Corco,2)';

% display percentage explained and core consistency
clc;
disp('---------percentage explained------------');
fprintf('nComp\tPerExp (%%) \n');
fprintf('%d\t%5.1f\n',[1:nFacMax; perExp]);
disp('-----------core consistency--------------');
fprintf('nComp\tCore Consistency (%%) \n');
fprintf('%d\t%5.1f\n',[1:nFacMax; core]);

% save evidence
saveas(gcf,['./fig/parafac/num/',chemName{6*chem},'.pdf']);
%%
% the following vector was created by Ce Gao on 2013-12-03 for 18 samples
% each chemical

% nFac = [2 2 1 2 1 ...
%         2 1 2 2 2 ...
%         2 2 2 2 2 ...
%         2 2 2 1 2 ...
%         2 2 2 2]' ;

% the following vector was created by Ce Gao on 2013-12-13 for 6 samples each
% chemical   
nFac = [2 2 2 1 2 ...
        2 1 1 2 2 ...
        1 3 2 3 2 ...
        2 2 2 1 2 ...
        2 4 2 2]' ;

%% put nFac into data.mat
save('./data/data.mat','nFac','-append');


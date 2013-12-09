%% data loading
clear;clc;close all;
addpath('./lib/nway331/');              % PARAFAC
addpath('./lib/multiple_comparison/');  % multiple comparison
addpath('./lib/vis/cbrewer/');          % color brewer
addpath('./lib/vis/export_fig/');       % export_fig
addpath('./lib/vis/rotateXLabels/');    % rotate x labels
load ./data/data.mat;

%% parafac 

% please uncomment the following line to manually run 
% decomp_parafac_num.m

% core script for parafac decomposition of each chemical's tensor data
decomp_main;

% the decomposition result could be visually examed by the following script
% decomp_parafac_test

% core script for GSEA
gsea_main;

%%
fig_parafac;
fig_gsea;
table_gsea;


%% data loading
clear;clc;close all;
addpath('./lib/nway331/');            % PARAFAC
addpath('./lib/vis/export_fig/');     % export_fig
load ./data/data.mat;

%% parafac 

% please uncomment the following line to manually run 
% decomp_parafac_num.m

decomp_parafac;
% fig_parafac;
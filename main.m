%% data loading
clear;clc;close all;
addpath('./lib/nway331/');            % PARAFAC
addpath('./lib/vis/export_fig/');     % export_fig
addpath('./lib/vis/subtightplot/');   % subtightplot
load ./data/data.mat;

%% parafac 
% please manually run decomp_parafac_num.m
decomp_parafac;
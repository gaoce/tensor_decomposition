E. coli data pre-processing
===========================
pre-processing data into matlab acceptable format, and store data in data.mat file.
the parsed data contain only the common genes in 3 separate batches of experiment.
please run parseData.m in MATLAB to proceed

Input:
------

* 120__chem_.xlsx: chemicals with 120 gene layout
* 116__chem_.xlsx: chemicals with 116 gene layout
* 108__chem_.xlsx: chemicals with 108 gene layout

Note:

* broken__chem_.xlsx contain data chemicals with missing data, discarded
* _chem_: chemical names

Ouput:
------
data.mat, containing variables:

	1. data: 3D tensor for gene expression time series data, gene x time x chemical
	2. chemName:
	3. geneName: the gene of the intersect of 3 layouts
	4. pathName: the corresponding pathways to which the above genes belong

Among the 18 samples for an individual chemical, the first 6 samples are for conc 1-6
for replicate A (batch 1), and second and third 6 samples for replicate B and C, 
respectively.
	
Note:
-----
H2O2, MMC are new data (second batch)
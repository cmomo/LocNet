# Genetic Fine-mapping with Dense Linkage Disequilibrium Blocks (DenseLD)
This is a genetic fine-mapping method incorporating dense LD block structure of linkage disequilibrum (LD) matrix among SNPS from a genomic region of interest.

# Prerequisites
MATLAB is required for the analysis.
"denseLD.m" is a MATLAB function for dense block detection that originally from the "NICE.m" in a previous package https://github.com/shuochenstats/Network_program/tree/master/NICE_folder/NICE_detection. "denseLD.m" is a faster function than "NICE.m". 

"denseLD.m" can be downloaded at https://github.com/cmomo/DenseLD_Data/blob/main. 

Dense LD block detection can be performed either in MATLAB or called by R using function "dense_block" in the R package. 

DenseLD also requires R (>= 3.5.0) and R packages genlasso, graphics, R.matlab and matlabr for the analysis. Install these packages before the analysis. 

"denseLD_block.R" and "denseLD_order.R" are R functions can be used for DenseLD.

# Implementation
#### Import functions in R:
source("denseLD_block.R")

source("denseLD_order.R")

### Steps
The analysis consists of three may steps.

#### 1. Detection of Dense LD
Note: an example conducted in MATLAB using function "denseLD.m" can be found in "SampleAnalysis/demo_mat.html".
#### 2. Convert dense LD block structure to graph object
#### 3. Perform causal variant selection by incorporting the graph object of LD matrix into fused-LASSO


# Data
Datasets for analysis demonstration using a small sample data can be downloaded together from "data/data.zip". 

"GWAS summary statistics_CPD.csv" is the GWAS summary statistics generated from raw data in this study.

"LDmatrix_chr15_78700Kto79230K_r2.zip" is the matrix of linkage disequilibrium scores estimated for the SNPs used in this study. 

"simu_geno.csv" is the simulated genotypes for the simulation studies. "simu_ldmx.csv" is the LD matrix for simulated genotypes. 


# Sample analysis display
"SampleAnalysis/DenseLD_demo.html" shows an example of performing fine-mapping using DenseLD with a simulated sample data. 

The sample analysis using DenseLD can be previewed with link: http://htmlpreview.github.io/?https://github.com/cmomo/DenseLD/blob/main/SampleAnalysis/DenseLD_demo.html

The sample analysis for dense LD block structure detection using MATLAB can be previewed with link: http://htmlpreview.github.io/?https://github.com/cmomo/DenseLD/blob/main/SampleAnalysis/demo_mat.html


### Plots generated during analysis are uploaded in folder "png". 
"heatmap_BPorder" and "heatmap_DENSEorder" are two heatmaps generated by MATLAB. These plots show the same LD matrix of the sample data in different orders (i.e., the natural physical positions and the order rearranged by DenseLD).

"Manhattan plot by BPorder-1" and "Manhattan plot by DENSEorder-1" are the two Manhattan plots generated by R. These plots show the p-values of the same sample data in different orders (i.e., the natural physical positions and the order rearranged by DenseLD).

"Trend plot of beta by lambda-1" shows the trend of beta shrinkage using DenseLD fine-mapping approach (i.e., fused-LASSO incorporating dense LD block structure).

Since one of the SNPs produced extreme values when fitting by the regression model, we generated a plot, "Trend plot of beta by lambda (remove extreme beta)-1", to remove the extreme SNPs in order to better display the trend of the other SNPs. 

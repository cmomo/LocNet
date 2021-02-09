##' Dense LD block structure detection
##'
##' This function adopts the "denseLD.m" MATLAB function, which is a faster version of "NICE.m" originally from
##' a previous package https://github.com/shuochenstats/Network_program/tree/master/NICE_folder/NICE_detection.
##'
##' @param input_location: Local directory of the input LD matrix saved in csv file.
##' @param filename: Name of the input LD matrix saved in csv file.
##' @param mat_function_dir: Local directory of the "denseLD.m".
##' @param output: Name of the output file of dense LD block structure detection you want to save as.
##' @param cnames: 0 or 1. 0 = no column names in the csv file; otherwise, 1 = have column names in the csv file.
##' @param rnames: 0 or 1. 0 = no column names in the csv file; otherwise, 1 = have column names in the csv file.
##' @param LDcut: Threshold of LD scores. Default value is 0.5.
##' @param iter: Number of iterations for dense LD block structure detection. Default value is 10.
##' @param k1: Number of SNPs the detection starts with. Default value is 1.
##' @param kn: Number of SNPs the detection ends with. This number has to be specify and it has to be smaller than
##' the total number of SNPs. Change to a smaller number if error occurs.
##' @param leap: The interval of SNPs that skip for detecting blocks. Default value is 10.
##' @param fig: 0 or 1. 0 = no figure output. 1 = output figure. Default value is 0. This figure cannot automatically saved by R.
##'
##' @return The list with index
##'
##' library(R.matlab)
##' library(matlabr)
##'
##' @export

denseLD_block=function(input_location, filename, mat_function_dir,output, cnames, rnames, LDcut=0.5, iter=10, k1=1, kn, leap=10, fig=0){
  mat_input_dir<-paste("addpath('", input_location, "');", sep = "")
  input_file<-paste("ldmx=csvread('",filename,"',",cnames,"," ,rnames,");", sep = "")
  # input_file<-paste("ldmx=csvread('",filename,"',",1,",",0,");", sep = "")
  set_parameters<-paste("[Cindx,CID,Clist,K_final]=denseLD(squareform(ldmx),",
                        paste(LDcut, iter, k1, kn,leap, fig, sep = ","),
                        ");", sep = "")
  output_dir<-paste("save('",input_location,"/", output,".mat','Clist','CID','Cindx')", sep = "")
  save_file_dir<-setwd(getwd())
  # Creat MATLAB code:
  code <- c(mat_input_dir,
            input_file,
            mat_function_dir,
            set_parameters,
            mat_input_dir,
            output_dir)
  res <- run_matlab_code(code, verbose=T)
  index <- readMat(paste(input_location,"/output_data.mat",sep = "" ))
  # return(index)
}

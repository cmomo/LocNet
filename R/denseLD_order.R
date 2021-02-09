##' Arrange SNPs according to their dense LD block structure
##'
##' @param mat_results: this is the MATLAB output for dense LD block structure detection.
##'
denseLD_order=function(mat_results){

  clist=data.frame(t(mat_results$Clist))
  clist$DENSEorder=rownames(clist)
  colnames(clist)[1]="BPorder"

  cindx=data.frame(t(mat_results$Cindx)) #node belongs to which block
  cindx$BPorder=rownames(cindx)
  colnames(cindx)[1]="block.ID"

  cid=data.frame(t(mat_results$CID)) #block ranking
  cid$block.rank=rownames(cid)
  colnames(cid)[1]="block.ID"
  cid$block.rank <- as.numeric(as.character(cid$block.rank))


  block=cid
  block[nrow(block)+1,] <- c(-1, max(block$block.rank)+1)

  denseLD.block.order=merge(clist, merge(cindx,block, by=c("block.ID")),
                            by=c("BPorder"))
  denseLD.block.order[]=sapply(denseLD.block.order, function(x){as.numeric(as.character(x))})

  return(denseLD.block.order)
}











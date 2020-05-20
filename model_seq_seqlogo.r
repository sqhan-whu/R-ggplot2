### seqlogo for model-seq 
### date: 20200520 
### auther: Han Shaoqing

BiocManager::install("motifStack")
suppressPackageStartupMessages(library(motifStack))

a1 <- read.table("ND1-1_genome.bam.count.txt", sep="\t")  #读取矩阵
a2 <- read.table("ND1-2_genome.bam.count.txt", sep="\t")
du <- read.table("du.txt", sep="\t")
a1 = t(as.matrix(a1))
a2 = t(as.matrix(a2))
du = t(as.matrix(du))
rownames(a1) <- c("A","C","G","T") #插入rowname
rownames(a2) <- c("A","C","G","T")
rownames(du) <- c("A","C","G","T")

a1 = a1[,32:50]
a2 = a2[,32:50]

motifs <- list(p3=new("pcm", mat=pcm2pfm(du), name="ND1-2"),
	p1=new("pcm", mat=pcm2pfm(a2), name="ND1-2"),
	p2=new("pcm", mat=pcm2pfm(a1), name="ND1-1"))
motifs<-lapply(motifs,pcm2pfm)


motifs <-DNAmotifAlignment(motifs)
plotMotifLogoStack(motifs,font="Arial",fontface=1,
ylab=NA,xaxis=TRUE,yaxis=TRUE,
xlcex=3, ylcex=3, ncex=1, ic.scale=FALSE)

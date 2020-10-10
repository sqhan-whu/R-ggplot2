### seqlogo for model-seq 
### date: 20200520 
### auther: Han Shaoqing

BiocManager::install("motifStack")
suppressPackageStartupMessages(library(motifStack))

a <- read.table("seq.txt", sep="\t")  #读取矩阵


a = t(as.matrix(a))

rownames(a) <- c("A","C","G","T") #插入rowname

a1 = a[,1:60]
a2 = a[,61:120]
a3 = a[,121:180]
a4 = a[,181:240]
a5 = a[,241:300]
a6 = a[,301:360]


motifs <- list(p6=new("pcm", mat=pcm2pfm(a6), name="6"),
	p5=new("pcm", mat=pcm2pfm(a5), name="5"),
	p4=new("pcm", mat=pcm2pfm(a4), name="4"),
	p3=new("pcm", mat=pcm2pfm(a3), name="3"),
	p2=new("pcm", mat=pcm2pfm(a2), name="2"),
	p1=new("pcm", mat=pcm2pfm(a1), name="1"))



motifs<-lapply(motifs,pcm2pfm)


motifs <-DNAmotifAlignment(motifs)


pdf("figure.pdf",,width=20,height=10)
plotMotifLogoStack(motifs,font="Arial",#fontface=1,
ylab=NA,xaxis=TRUE,yaxis=TRUE,
xlcex=3, ylcex=3, ncex=1, ic.scale=FALSE)
dev.off()


########################################################################################################################################################



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

#figure1.r
#library(karyoploteR)

pdf(file="chr.pdf",width=10,height=20)
chrX <- read.table("chrX.txt",head=FALSE,sep='\t')
chrY <- read.table("chrY.txt",head=FALSE,sep='\t')
chr1 <- read.table("chr1.txt",head=FALSE,sep='\t')
chr2 <- read.table("chr2.txt",head=FALSE,sep='\t')
chr3 <- read.table("chr3.txt",head=FALSE,sep='\t')
chr4 <- read.table("chr4.txt",head=FALSE,sep='\t')
chr5 <- read.table("chr5.txt",head=FALSE,sep='\t')
chr6 <- read.table("chr6.txt",head=FALSE,sep='\t')
chr7 <- read.table("chr7.txt",head=FALSE,sep='\t')
chr8 <- read.table("chr8.txt",head=FALSE,sep='\t')
chr9 <- read.table("chr9.txt",head=FALSE,sep='\t')
chr10 <- read.table("chr10.txt",head=FALSE,sep='\t')
chr11 <- read.table("chr11.txt",head=FALSE,sep='\t')
chr12 <- read.table("chr12.txt",head=FALSE,sep='\t')
chr13 <- read.table("chr13.txt",head=FALSE,sep='\t')
chr14 <- read.table("chr14.txt",head=FALSE,sep='\t')
chr15 <- read.table("chr15.txt",head=FALSE,sep='\t')
chr16 <- read.table("chr16.txt",head=FALSE,sep='\t')
chr17 <- read.table("chr17.txt",head=FALSE,sep='\t')
chr18 <- read.table("chr18.txt",head=FALSE,sep='\t')
chr19 <- read.table("chr19.txt",head=FALSE,sep='\t')
chr20 <- read.table("chr20.txt",head=FALSE,sep='\t')
chr21 <- read.table("chr21.txt",head=FALSE,sep='\t')
chr22 <- read.table("chr22.txt",head=FALSE,sep='\t')


y <- rnorm(30, mean=0.5, sd=0.25)
plot.params <- getDefaultPlotParams(plot.type=1)

plot.params$ideogramheight <- 50
plot.params$data1height <- 100


kp <- plotKaryotype(genome="hg38",plot.params = plot.params)
kpPoints(kp, chr="chrX", x=chrX$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chrY", x=chrY$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr1", x=chr1$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr2", x=chr2$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr3", x=chr3$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr4", x=chr4$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr5", x=chr5$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr6", x=chr6$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr7", x=chr7$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr8", x=chr8$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr9", x=chr9$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr10", x=chr10$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr11", x=chr11$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr12", x=chr12$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr13", x=chr13$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr14", x=chr14$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr15", x=chr15$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr16", x=chr16$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr17", x=chr17$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr18", x=chr18$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr19", x=chr19$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr20", x=chr20$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr21", x=chr21$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr22", x=chr22$V1, y=0.3*y,cex=0.25,col="#6AA3C6")


dev.off()

pdf(file="chr12-18.pdf",width=10,height=20)
plot.params$ideogramheight <- 50
plot.params$data1height <- 100
kp <- plotKaryotype(genome="hg38",chromosomes = c("chr12", "chr18"),plot.params = plot.params)
kpPoints(kp, chr="chr12", x=chr12$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
kpPoints(kp, chr="chr18", x=chr18$V1, y=0.3*y,cex=0.25,col="#6AA3C6")
dev.off()

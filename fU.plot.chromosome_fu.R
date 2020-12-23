#C:\Users\50246\Desktop\实验室工作\杨威\fU_figure\染色体


library(quantsmooth)

pdf(file="chromosome_fu.1202.pdf", width=12,height=20)

chrompos<-prepareGenomePlot(cols = "blue",paintCytobands = TRUE, sexChromosomes = TRUE,organism="hsa",units = "hg38")
zchr1 <- read.table("chr1.txt")
zchr2 <- read.table("chr2.txt")
zchr3 <- read.table("chr3.txt")
zchr4 <- read.table("chr4.txt")
zchr5 <- read.table("chr5.txt")
zchr6 <- read.table("chr6.txt")
zchr7 <- read.table("chr7.txt")
zchr8 <- read.table("chr8.txt")
zchr9 <- read.table("chr9.txt")
zchr10<- read.table("chr10.txt")
zchr11<- read.table("chr11.txt")
zchr12<- read.table("chr12.txt")
zchr13<- read.table("chr13.txt")
zchr14<- read.table("chr14.txt")
zchr15<- read.table("chr15.txt")
zchr16<- read.table("chr16.txt")
zchr17<- read.table("chr17.txt")
zchr18<- read.table("chr18.txt")
zchr19<- read.table("chr19.txt")
zchr20<- read.table("chr20.txt")
zchr21<- read.table("chr21.txt")
zchr22<- read.table("chr22.txt")
zchrX <- read.table("chrX.txt")
xchr1 <- zchr1$V2
xchr2 <- zchr2$V2
xchr3 <- zchr3$V2
xchr4 <- zchr4$V2
xchr5 <- zchr5$V2
xchr6 <- zchr6$V2
xchr7 <- zchr7$V2
xchr8 <- zchr8$V2
xchr9 <- zchr9$V2
xchr10<- zchr10$V2
xchr11<- zchr11$V2
xchr12<- zchr12$V2
xchr13<- zchr13$V2
xchr14<- zchr14$V2
xchr15<- zchr15$V2
xchr16<- zchr16$V2
xchr17<- zchr17$V2
xchr18<- zchr18$V2
xchr19<- zchr19$V2
xchr20<- zchr20$V2
xchr21<- zchr21$V2
xchr22<- zchr22$V2
xchrX <- zchrX$V2
points(xchr1  + chrompos['chr1',][2],chrompos['chr1', ][1]+0.07+runif(length(xchr1))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr2  + chrompos['chr2',][2],chrompos['chr2', ][1]+0.07+runif(length(xchr2))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr3  + chrompos['chr3',][2],chrompos['chr3', ][1]+0.07+runif(length(xchr3))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr4  + chrompos['chr4',][2],chrompos['chr4', ][1]+0.07+runif(length(xchr4))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr5  + chrompos['chr5',][2],chrompos['chr5', ][1]+0.07+runif(length(xchr5))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr6  + chrompos['chr6',][2],chrompos['chr6', ][1]+0.07+runif(length(xchr6))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr7  + chrompos['chr7',][2],chrompos['chr7', ][1]+0.07+runif(length(xchr7))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr8  + chrompos['chr8',][2],chrompos['chr8', ][1]+0.07+runif(length(xchr8))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr9  + chrompos['chr9',][2],chrompos['chr9', ][1]+0.07+runif(length(xchr9))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr10 + chrompos['chr10',][2],chrompos['chr10',][1]+0.07+runif(length(xchr10))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr11 + chrompos['chr11',][2],chrompos['chr11',][1]+0.07+runif(length(xchr11))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr12 + chrompos['chr12',][2],chrompos['chr12',][1]+0.07+runif(length(xchr12))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr13 + chrompos['chr13',][2],chrompos['chr13',][1]+0.07+runif(length(xchr13))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr14 + chrompos['chr14',][2],chrompos['chr14',][1]+0.07+runif(length(xchr14))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr15 + chrompos['chr15',][2],chrompos['chr15',][1]+0.07+runif(length(xchr15))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr16 + chrompos['chr16',][2],chrompos['chr16',][1]+0.07+runif(length(xchr16))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr17 + chrompos['chr17',][2],chrompos['chr17',][1]+0.07+runif(length(xchr17))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr18 + chrompos['chr18',][2],chrompos['chr18',][1]+0.07+runif(length(xchr18))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr19 + chrompos['chr19',][2],chrompos['chr19',][1]+0.07+runif(length(xchr19))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr20 + chrompos['chr20',][2],chrompos['chr20',][1]+0.07+runif(length(xchr20))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr21 + chrompos['chr21',][2],chrompos['chr21',][1]+0.07+runif(length(xchr21))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchr22 + chrompos['chr22',][2],chrompos['chr22',][1]+0.07+runif(length(xchr22))*0.08,pch=16, cex =0.5 ,col="#807DBA")
points(xchrX  + chrompos['chrX',][2],chrompos['chrX', ][1]+0.07+runif(length(xchrX))*0.08,pch=16, cex =0.5 ,col="#807DBA")

dev.off()

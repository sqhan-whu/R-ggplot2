library(ggpubr)
library(gridExtra)
#C:\Users\50246\Desktop\实验室工作\彭双师姐\20200909\cpm_fold

data = read.table("density.txt",header =TRUE,sep='\t')
selectresult =subset(data,data$cpm >1)
selectresult$cpm =log(selectresult$cpm,10)
selectresult$type<- factor(selectresult$type, levels=c("mof","kit"))
p1 <- ggdensity(selectresult, x = "cpm",
   add = "mean", rug = TRUE,
   color = "type", fill = "type",
   palette = c("#00AFBB", "#E7B800"))

data = read.table("density2.txt",header =TRUE,sep='\t')
selectresult =subset(data,data$cpm >1)
selectresult$cpm =log(selectresult$cpm,10)
p2 <- ggdensity(selectresult, x = "cpm",
   add = "mean", rug = TRUE,
   color = "type", fill = "type",
   palette = c("#00AFBB", "#E7B800"))

pdf("figure.density.pdf",,width=10,height=10)
grid.arrange(p1,p2,ncol=1,nrow=2)

dev.off()

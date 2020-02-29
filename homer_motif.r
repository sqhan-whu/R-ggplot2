suppressPackageStartupMessages(library(motifStack))
library(ggplot2)

a <- read.table("~/Documents/R/motif/ipt.txt", sep="\t")  #读取矩阵
rownames(a) <- c("A","C","G","U") #插入rowname
motif <- new("pcm", mat=as.matrix(a), name="ybx1-d")
#plot(motif2 ,font="Arial") #ic.scale=FALSE

df <- data.frame(xmin=c(.25,.25, .25,.25,.25, .25), ymin=c(.05, .35,.65, .95,1.25,1.55),
				 xmax=c(.75, .75,.75, .75,.75, .75), ymax=c(.3,.6,.9,1.2,1.5,1.8), 
                 fontfamily=c("Helvetica"), fontface=c(2, 1))
df$motif <- list(motif,motif)

ggplot(df, aes(xmin=xmin, ymin=ymin, xmax=xmax, ymax=ymax, motif=motif, 
               fontfamily=fontfamily, fontface=fontface)) + 
			geom_motif(ic.scale=FALSE) + theme_light() + ylim(0, 2) + xlim(0, 1)

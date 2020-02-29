library(ggpubr)
library(ggthemes)
bar.data<- read.table("bp.txt",sep= '\t',header=T)
bar.data$p <- -log10(bar.data$PValue)
p <- ggbarplot(bar.data,x="Term",y="p",rotate=TRUE,color='white', fill="#8172B2" ,sort.val = "asc",sort.by.groups=TRUE,top=10)+xlab("Biological process")+ylab("-log10(P-value)")
p+theme_bw()+theme(panel.grid.major = element_blank(), 
	panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))+ scale_y_continuous(expand = expand_scale(add = c(0, .5)))

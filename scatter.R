
library(ggplot2)
library(gridExtra)


data =  read.table("cpm_13_table2.txt",header=TRUE,sep='\t')

p1 <- ggplot(data=data, aes(x=base, y=fold, color=regulation)) + 
geom_point(data=subset(data,data$regulation =='up'),aes(size=abs(fold)),color="red",alpha=0.4) + 
geom_point(data=subset(data,data$regulation =='down'),aes(size=abs(fold)),color="darkgreen",alpha=0.1) + 
geom_point(data=subset(data,data$regulation =='not'),aes(size=abs(fold)),color="grey",alpha=0.4) + 
scale_size(range = c(0.1,2.5)) + geom_hline(yintercept = 1, col = "grey",linetype = 2) +geom_hline(yintercept = -1, linetype = 2,col = "grey")+
 #以点图形式呈现 "#C4573C","#6BA25E","#4474BB"
 xlab("RNA mean expression log10(cpm)") + ylab("Relative expression level log2(SYQ1/SYQ3)") +   #定义X轴和Y轴的名称  
 #scale_colour_manual(values = c('darkgreen','grey',"red")) +  #设置具体颜色 
  theme_bw(base_size=15)+   #去除灰色背景并设置字体大小  
  theme(panel.border = element_blank(),     
     panel.grid.major = element_blank(),       
      panel.grid.minor = element_blank(),       
       axis.line = element_line(colour = "black"))+ #去除背景格线 
        labs(title = "SYQ1 VS SYQ3")+    #设置标题  
        theme(plot.title = element_text(size=15,hjust = 0.5)) #标题大小和位置print(g)


data =  read.table("old.txt",header=TRUE,sep='\t')
p2 <- ggplot(data=data, aes(x=base, y=fold, color=regulation)) + 
geom_point(data=subset(data,data$regulation =='up'),aes(size=abs(fold)),color="red",alpha=0.4) + 
geom_point(data=subset(data,data$regulation =='down'),aes(size=abs(fold)),color="darkgreen",alpha=0.1) + 
geom_point(data=subset(data,data$regulation =='not'),aes(size=abs(fold)),color="grey",alpha=0.4) + 
scale_size(range = c(0.1,2.5)) + geom_hline(yintercept = 1, col = "grey",linetype = 2) +geom_hline(yintercept = -1, linetype = 2,col = "grey")+
 #以点图形式呈现 "#C4573C","#6BA25E","#4474BB"
 xlab("RNA mean expression log10(cpm)") + ylab("Relative expression level log2(mof/kit)") +   #定义X轴和Y轴的名称  
 #scale_colour_manual(values = c('darkgreen','grey',"red")) +  #设置具体颜色 
  theme_bw(base_size=15)+   #去除灰色背景并设置字体大小  
  theme(panel.border = element_blank(),     
     panel.grid.major = element_blank(),       
      panel.grid.minor = element_blank(),       
       axis.line = element_line(colour = "black"))+ #去除背景格线 
        labs(title = "MOF VS KIT")+    #设置标题  
        theme(plot.title = element_text(size=15,hjust = 0.5)) #标题大小和位置print(g)

pdf("figure.pdf",,width=10,height=10)
grid.arrange(p1,p2,ncol=1,nrow=2)

dev.off()



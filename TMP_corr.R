library(ggplot2)

a<-read.table("TPM.txt",head=T)
c = a[,2:3]
cor_pearson <- cor(c, method = 'pearson')
pdf("figure_TPM.pdf",,width=6,height=5)
p = ggplot(data=a,aes(x=SYQ1,y=SYQ3))+geom_point(color="#CC9999",alpha=0.5)+ scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
              labels = trans_format("log10", math_format(10^.x))) +
     scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
              labels = trans_format("log10", math_format(10^.x))) +
     theme_bw()+ coord_cartesian(clip = "off")#xlim =c(1, 10000), ylim = c(1, 10000),)
p + annotation_logticks(sides = "lb", outside = TRUE,  short = unit(.5,"mm"),
  mid = unit(.5,"mm"),
  long = unit(.5,"mm"))+
geom_abline(slope=1,intercept=0,color="#666666",size=0.5,linetype=5)+
xlab("SYQ1 log10(TPM)") + ylab("SYQ3 (TPM)") +
annotate("text", x = 0.5, y = 50000, label = paste("r",round(cor_pearson[1,2],2),sep="="),

size = 6,colour = "red") #family = "Arial", 

dev.off()


a<-read.table("TPM.old.txt",head=T)
c = a[,2:3]
cor_pearson <- cor(c, method = 'pearson')
pdf("figure_TPM_old.pdf",,width=6,height=5)
p = ggplot(data=a,aes(x=mof,y=kit))+geom_point(color="#CC9999",alpha=0.5)+ scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
              labels = trans_format("log10", math_format(10^.x))) +
     scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
              labels = trans_format("log10", math_format(10^.x))) +
     theme_bw()+ coord_cartesian(clip = "off")#xlim =c(1, 10000), ylim = c(1, 10000),)
p + annotation_logticks(sides = "lb", outside = TRUE,  short = unit(.5,"mm"),
  mid = unit(.5,"mm"),
  long = unit(.5,"mm"))+
geom_abline(slope=1,intercept=0,color="#666666",size=0.5,linetype=5)+
xlab("mof log10(TPM)") + ylab("kit (TPM)") +
annotate("text", x = 0.5, y = 50000, label = paste("r",round(cor_pearson[1,2],2),sep="="),

size = 6,colour = "red") #family = "Arial", 

dev.off()
                   
##############################################################################################################
###  组合图
##############################################################################################################
library(gridExtra)

a<-read.table("TPM.txt",head=T)
c = a[,2:3]
cor_pearson <- cor(c, method = 'pearson')

p1 = ggplot(data=a,aes(x=SYQ1,y=SYQ3))+geom_point(color="#CC9999",alpha=0.5)+ 
scale_x_log10(limits=c(0.1,100000),breaks = trans_breaks("log10", function(x) 10^x),
              labels = trans_format("log10", math_format(10^.x))) +
scale_y_log10(limits=c(0.1,100000),breaks = trans_breaks("log10", function(x) 10^x),
              labels = trans_format("log10", math_format(10^.x))) +
     theme_bw()+ coord_cartesian(clip = "off")+
     annotation_logticks(sides = "lb", outside = TRUE,  short = unit(.5,"mm"),
  mid = unit(.5,"mm"),
  long = unit(.5,"mm"))+
geom_abline(slope=1,intercept=0,color="#666666",size=0.5,linetype=5)+
xlab("SYQ1 log10(TPM)") + ylab("SYQ3 (TPM)") +
annotate("text", x = 0.5, y = 50000, label = paste("r",round(cor_pearson[1,2],2),sep="="),

size = 6,colour = "red") #family = "Arial", 



a<-read.table("TPM.old.txt",head=T)
c = a[,2:3]
cor_pearson <- cor(c, method = 'pearson')

p2 = ggplot(data=a,aes(x=mof,y=kit))+geom_point(color="#CC9999",alpha=0.5)+
 scale_x_log10(limits=c(0.1,100000),breaks = trans_breaks("log10", function(x) 10^x),
              labels = trans_format("log10", math_format(10^.x))) +
     scale_y_log10(limits=c(0.1,100000),breaks = trans_breaks("log10", function(x) 10^x),
              labels = trans_format("log10", math_format(10^.x))) +
     theme_bw()+ coord_cartesian(clip = "off")+
 annotation_logticks(sides = "lb", outside = TRUE,  short = unit(.5,"mm"),
  mid = unit(.5,"mm"),
  long = unit(.5,"mm"))+
geom_abline(slope=1,intercept=0,color="#666666",size=0.5,linetype=5)+
xlab("mof log10(TPM)") + ylab("kit (TPM)") +
annotate("text", x = 0.5, y = 50000, label = paste("r",round(cor_pearson[1,2],2),sep="="),

size = 6,colour = "red") #family = "Arial", 

pdf("figure_total_TPM.pdf",,width=12,height=5)
grid.arrange(p2,p1,ncol=2,nrow=1)

dev.off()

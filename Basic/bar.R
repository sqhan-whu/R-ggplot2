set.seed(1124)
data <- matrix(sample(1:30,15) , nrow=3)
colnames(data) <- c("A","B","C","D","E")
rownames(data) <- c("var1","var2","var3")
 
# create color palette:
library(RColorBrewer)
coul <- brewer.pal(3, "Set2") 
 
# Transform this data in %
data_percentage <- apply(data, 2, function(x){x*100/sum(x,na.rm=T)})
 
# Make a stacked barplot--> it will be in %!
barplot(data_percentage, col=coul , border="white", xlab="group")

#############  C:\Users\50246\Desktop\实验室工作\彭双师姐\20200909\分类
library(ggplot2)

dat.fig1c <- read.table("type_count2.txt",header=TRUE,sep='\t')

#dat.fig1c[,3]<- factor(dat.fig1c[,3], levels=c("mof","kit","SYQ1","SYQ2","SYQ3",))
dat.fig1c[,1]<- factor(dat.fig1c[,1], levels=c("lncRNA","miRNA","protein_coding","rRNA","scaRNA","snoRNA","snRNA","other_RNA"))

pdf("figure_type_count.pdf",,width=8,height=6)
ggplot(dat.fig1c,aes(sample,num,fill=type)) + 
 geom_bar(stat = "identity", position = position_fill(vjust = 0.5),width=.7) + 
 ylab("Number of ncRNA genes") + xlab("RNA type") + 
#geom_text(aes(label=round(num,1)), position=position_dodge(width=0.7), vjust=-0.25,size=2.3)  + 
 scale_fill_brewer("",palette = "Paired",labels=c("lncRNA","miRNA","protein_coding","rRNA","scaRNA","snoRNA","snRNA","other_RNA"))+ 
 theme_bw() +theme(legend.position = "top") 
dev.off()

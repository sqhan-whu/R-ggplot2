library (VennDiagram)
library(gridExtra)
data = read.table("read.count_1-3.table.cpm.txt",header =TRUE,sep='\t')
selectresult_A =subset(data,data$SYQ1 >1)$id
selectresult_B =subset(data,data$SYQ3 >1)$id
p1 <-venn.diagram(list(SYQ1=selectresult_A,SYQ3=selectresult_B),
filename=NULL,
lwd=1,                         #圈线粗度
lty=1,                         #圈线类型
col=c('#0099CC','#FF6666'),    #圈线颜色
fill=c('#0099CC','#FF6666'),   #填充颜色
cat.col=c('#0099CC','#FF6666'),#A和B的颜色
cat.cex = 2.5,                 #A和B的大小
rotation.degree = 0,          #旋转角度
main = "SYQ1 & SYQ3",                  #主标题内容
main.cex = 2,                  #主标题大小
sub = "SYQ1 VS SYQ3",        #亚标题内容
sub.cex = 1,                   #亚标题字大小
cex=1.5,                       #里面交集字的大小
alpha = 0.5,                   #透明度
reverse=TRUE,
area.vector=TRUE)
pdf("figurevenn.pdf",,width=6,height=6)
grid.draw(p1)
#grid.arrange(p1,ncol=1,nrow=2)
dev.off()

data = read.table("old_venn.txt",header =TRUE,sep='\t')
selectresult_A =subset(data,data$mof >1)$id
selectresult_B =subset(data,data$kit >1)$id
p1 <-venn.diagram(list(mof=selectresult_A,kit=selectresult_B),
filename=NULL,
lwd=1,                         #圈线粗度
lty=1,                         #圈线类型
col=c('#0099CC','#FF6666'),    #圈线颜色
fill=c('#0099CC','#FF6666'),   #填充颜色
cat.col=c('#0099CC','#FF6666'),#A和B的颜色
cat.cex = 2.5,                 #A和B的大小
rotation.degree = 0,          #旋转角度
main = "mof & kit",                  #主标题内容
main.cex = 2,                  #主标题大小
sub = "mof VS kit",        #亚标题内容
sub.cex = 1,                   #亚标题字大小
cex=1.5,                       #里面交集字的大小
alpha = 0.5,                   #透明度
reverse=TRUE,
area.vector=TRUE)
pdf("figure_old_venn.pdf",,width=6,height=6)
grid.draw(p1)
#grid.arrange(p1,ncol=1,nrow=2)
dev.off()







#### 3元
T<-venn.diagram(list(A=A,B=B,C=C),
filename=NULL,
lwd=1,#圈线粗度
lty=1, #圈线类型
col=c('#0099CC','#FF6666','#FFCC99'), #圈线颜色
fill=c('#0099CC','#FF6666','#FFCC99'), #填充颜色
cat.col=c('#0099CC','#FF6666','#FFCC99'),#A和B的颜色
cat.cex = 2.5,# A和B的大小
rotation.degree = 0,#旋转角度
main = "A&B",#主标题内容
main.cex = 2,#主标题大小
sub = "plot : example",#亚标题内容
sub.cex = 1,#亚标题字大小
cex=1.5,#里面交集字的大小
alpha = 0.5,#透明度
reverse=TRUE)
grid.draw(T)

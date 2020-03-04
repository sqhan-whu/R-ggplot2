library(gcookbook) #For the data set

#Bar Graph
ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat="identity")
?BOD
str(BOD)
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")
ggplot(BOD, aes(x=factor(Time), y=demand)) + geom_bar(stat="identity")
ggplot(pg_mean, aes(x=group, y=weight)) +
  geom_bar(stat="identity", fill="lightblue", colour="black")
  
#Grouping Bars Together
?cabbage_exp
cabbage_exp
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_bar(stat="identity",position="dodge")
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_bar(position="stack",stat="identity")

upc = subset(uspopchange, rank(Change)>40)  ## subset 提取 data中 Change 排名大于40 的数据
ggplot(upc, aes(x=Abb, y=Change, fill=Region)) + geom_bar(stat="identity")

ggplot(upc, aes(x=reorder(Abb, Change), y=Change, fill=Region)) +   ##### reorder(x,y) 以y的值对x排序
  geom_bar(stat="identity", colour="black")
  
csub = subset(climate, Source=="Berkeley" & Year >= 1900)  ## subset 提取 data中 Source=="Berkeley" & Year >= 1900 
csub$pos = csub$Anomaly10y >= 0   ##csub$Anomaly10y >= 0 返回 TRUE or FALSE，增加到csub$pos

ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) +
  geom_bar(stat="identity", position="identity") +
  scale_fill_manual(values=c("#669933", "#FFCC66"), guide=FALSE)  ##重新设置 fill的颜色,, guide=FALSE ,取消lenged
  
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_bar(stat="identity", width=0.5, position=position_dodge(0.7))   ##width=0.5  设置柱宽，position=position_dodge(0.7) 设置两柱之间间距

ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
  geom_bar(stat="identity") +   
  geom_text(aes(label=Weight), vjust=-0.2) +            ###aes(label=Weight),设置添加标注为Weight值，向上微调0.2，
  ylim(0, max(cabbage_exp$Weight) * 1.05)               ###设置y轴范围，max(cabbage_exp$Weight) * 1.05

ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
  geom_bar(stat="identity") +
  geom_text(aes(y=Weight+0.1, label=Weight))
  
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_bar(stat="identity", position="dodge") +
  geom_text(aes(label=Weight), vjust=1.5, colour="black",  ##设置字体微距，颜色
            position=position_dodge(0.9), size=10)   ##设置字体间距，大小


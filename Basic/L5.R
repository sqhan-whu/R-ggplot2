library(ggplot2)
library(gcookbook)

#Making a Basic Line Graph
BOD
ggplot(BOD, aes(x=Time, y=demand)) + geom_line()
BOD1 = BOD # Make a copy of the data
BOD1$Time = factor(BOD1$Time)
ggplot(BOD1, aes(x=Time, y=demand, group=1)) + geom_line()

ggplot(BOD, aes(x=Time, y=demand)) + 
  geom_line() + 
  ylim(0, max(BOD$demand))
  

#Adding Points to a Line Graph
ggplot(BOD, aes(x=Time, y=demand)) + geom_line() + geom_point()

#Making a Line Graph with Multiple Lines
library(plyr)
tg = ddply(ToothGrowth, c("supp", "dose"), 
           summarise, length=mean(len))    ##生产数据集tg

ggplot(tg, aes(x=dose, y=length, colour=supp)) + geom_line()   #颜色以supp分类
ggplot(tg, aes(x=dose, y=length, linetype=supp)) + geom_line() 
ggplot(tg, aes(x=dose, y=length, fill=supp)) + geom_line() +
  geom_point(size=4, shape=21)   ##填充点的颜色，线条颜色需要用color来设置
  
ggplot(BOD, aes(x=Time, y=demand)) +
  geom_line() +
  geom_point(size=4, shape=22, colour="red", fill="blue")  ##设置点大小，形状，轮廓，填充
  
#Making a Graph with a Shaded Area
sunspotyear <- data.frame(
  Year = as.numeric(time(sunspot.year)),
  Sunspots = as.numeric(sunspot.year)
)
ggplot(sunspotyear, aes(x=Year, y=Sunspots)) + geom_area()
ggplot(sunspotyear, aes(x=Year, y=Sunspots)) +
  geom_area(colour="black", fill="blue", alpha=0.2)    ##设置面积轮廓，填充，透明度
ggplot(sunspotyear, aes(x=Year, y=Sunspots)) + geom_line() 

#Making a Stacked Area Graph
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + geom_area()
ggplot(uspopage, aes(x=Year, y=Thousands, 
                     fill=AgeGroup, order=desc(AgeGroup))) +   ##以AgeGroup 逆序
  geom_area(colour=NA, alpha=0.4) +
  geom_line(position="stack", size=0.2)  #stack面积堆积对应的position即为stack


#Making a Proportional Stacked Area Graph   ### 将之前的数值变为比例
uspopage_prop = ddply(uspopage, "Year", transform,
                       Percent = Thousands / sum(Thousands) * 100)
ggplot(uspopage_prop, aes(x=Year, y=Percent, fill=AgeGroup)) +
  geom_area(colour="black", size=.2, alpha=.4)
ggplot(uspopage_prop, aes(x=Year, y=Percent, fill=AgeGroup)) +
  geom_area(colour=NA, size=.2, alpha=.4) + 
  geom_line(position="stack", size=0.2)


################# 选取数据的特定行，特定列 subset, select=c("Year", "Anomaly10y", "Unc10y")
clim = subset(climate, Source == "Berkeley",
               select=c("Year", "Anomaly10y", "Unc10y"))

ggplot(clim, aes(x=Year, y=Anomaly10y)) +
  geom_ribbon(aes(ymin=Anomaly10y-Unc10y, ymax=Anomaly10y+Unc10y),  #######绘制正负误差
              alpha=0.2) + 
  geom_line()

ggplot(clim, aes(x=Year, y=Anomaly10y)) + 
  geom_line() + #main
  geom_line(aes(y=Anomaly10y-Unc10y), 
            colour="grey50", linetype="dashed") +#lower
  geom_line(aes(y=Anomaly10y+Unc10y), 
            colour="grey50", linetype="dashed") #upper    #######绘制正负误差以线的形式绘制，绘制三条线



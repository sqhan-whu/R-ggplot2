library(ggplot2)

p = ggplot(mtcars, aes(x = mpg, y = wt))   #绘制图层，并不显示数据层，
p + geom_point()   # 添加数据层
p + geom_point(aes(colour = factor(cyl)))  # 添加数据层，并以cyl具体值分类
p + geom_point(aes(y = disp))  # 可用y= 重新设定y轴对应的列
p + geom_point(colour = "green")   #类似
p + geom_point(aes(colour = "blue")) #类似

library(nlme)  # 载入数据包
data(package="nlme")   #查看包中的内容，包含哪些数据集
?Oxboys
head(Oxboys)
str(Oxboys)
p = ggplot(Oxboys, aes(age, height, group = Subject)) + geom_line()  ##分组每一组，画一条线
ggplot(Oxboys, aes(age, height, group = 1)) + geom_line()  ##当成一组来画
#Different groups on different layers
p + geom_smooth(aes(group = Subject), method="lm", se = F)
p + geom_smooth(aes(group = 1), method="lm", se = F, size=2)

###箱型图之间连线
boysbox = ggplot(Oxboys, aes(Occasion, height)) + geom_boxplot()
boysbox
boysbox + geom_line(aes(group = Subject), colour = "blue")

#Position adjustments
#dodge: Adjust position by dodging overlaps to the side
#fill: Stack overlapping objects and standardise have equal height
#identity: Do not adjust position
#jitter: Jitter points to avoid overplotting
#stack: Stack overlapping objects on top of one another

ggplot(diamonds,
       aes(clarity, fill = cut)) + geom_bar(position = "stack")
ggplot(diamonds,
       aes(clarity, fill = cut)) + geom_bar(position = "fill")
ggplot(diamonds,
       aes(clarity, fill = cut)) + geom_bar(position = "dodge")
       
       

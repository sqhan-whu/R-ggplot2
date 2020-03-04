library(ggplot2)
dat=diamonds   ##use diamonds data

qplot(log(carat), log(price), data = diamonds)  ## 直接对x y，取Log，并画图

dsmall = diamonds[sample(nrow(diamonds), 100), ]  ## 对diamonds 取随机100行. sample函数：sample(1:10,4) 随机无放回抽取4个值

qplot(carat, price, data = dsmall, colour = color)  ## color 以color填充点得颜色，并作为分类 （点用color）
qplot(carat, price, data = dsmall, shape = cut)  
qplot(carat, price, data = diamonds, alpha = I(1/10))  ## alpha: 控制点透明

library(splines)  # 绘制拟合曲线用到的线性模型包
qplot(carat, price, data = dsmall, geom = c("point", "smooth"),
      method = "lm")  ## lm 把拟合曲线变为直线


######箱型图
qplot(color, price, 
      data = dsmall, 
      geom = "boxplot") + geom_boxplot(outlier.colour = "green",    #箱外点颜色
                                       outlier.size = 10,           #箱外点大小
                                       fill = "red",                #箱子填充颜色
                                       colour = "blue",             #箱子轮廓颜色
                                       size=2)                      #箱子轮廓粗细
                                       

qplot(carat, data = diamonds, geom = "density")                ##密度曲线图
qplot(carat, data = diamonds, geom = "density", color = color) ##以 color 分类。并设置轮廓颜色
qplot(carat, data = diamonds, geom = "density", fill = color)  ##以 color 分类。并设置填充颜色
  
qplot(color, data = diamonds, geom = "bar",fill=color)         ##柱状图


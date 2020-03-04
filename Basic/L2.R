setwd("~/documents/R programming/ggplot2")  
library(ggplot2)
attach(mtcars)   #锁定路径，添加到R

qplot(displ, hwy, data = mpg, 
      colour = factor(cyl),           # factor去除默认连续不存在值，因子化X的具体值,factor后，X为真实存在的具体值
      geom=c("smooth","point"),       # geom 设置图的类型，拟合曲线+点
      method="lm")                    # methond="lm" 直线
   
qplot(displ, hwy, data=mpg, facets = . ~ year) + geom_smooth()   ## facets = . ~ year  以year的分类 单独每year画一个图

save(p, file = "plot.rdata")          #保存，画图用到的数据放在变量P中

load("plot.rdata")                    #保存，载入画图用到的数据放在变量P中

ggsave("plot.pdf", width = 5, height = 5)    #保存为图片

ggplot(msleep, aes(sleep_rem / sleep_total, awake)) + geom_point()    ## basic point : ggplot(data, aes(x,y)) + geom_point()
qplot(sleep_rem / sleep_total, awake, data = msleep)  ##  equal === ggplot

ggplot(msleep, aes(sleep_rem / sleep_total, awake)) + geom_point() + geom_smooth()  # add smooth

bestfit = geom_smooth(method = "lm",                 ###曲线 类型
                      se = T,                        ###显示 误差宽
                      colour = "steelblue",          ###拟合线 颜色
                      alpha=0.5,                     ###误差背景 透明度
                      size = 2)                      ###拟合线 宽度
ggplot(msleep, aes(sleep_rem / sleep_total, awake)) + geom_point() + bestfit  # add smooth

p = ggplot(mtcars, aes(mpg, wt, colour = cyl)) + geom_point(size=5)   ##点大小为5，以cyl连续分类
ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) + geom_point(size=5)  ##点大小为5，以cyl因子化分类

mtcars = transform(mtcars, mpg = mpg ^ 2)  ##X的值平方
p %+% mtcars  #更新p中的 mtcars 并画图



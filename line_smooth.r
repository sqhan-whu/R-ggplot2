######## data:  
pos	HEK293T	Random
-1500	1.39129651	1.010914163
-1450	1.324127383	1.041648069
-1400	1.29591635	1.029090129
-1350	1.034852344	1.101463519
-1300	0.892006002	0.433248927
-1250	0.893349384	0.401523605
##########################

library(ggplot2)
data<- read.table("CENPA-fig-data.txt",sep= '\t',header=T)

mytheme = theme_bw() + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank()) +
theme(panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank())+
theme(legend.position = "top")

ggplot(data)+
geom_smooth(aes(x=pos, y=HEK293T),method = 'loess',span = 0.2,color="#CC7033",se = FALSE)+
geom_smooth(aes(x=pos, y=Random),method = 'loess',span = 0.2,color="#4474BB",se = FALSE)+
mytheme +
scale_x_continuous(limits=c(-1500, 1500),breaks=seq(-1500,1500,500)) +
labs( ylab = "CENPA peaks Depth", title="CENPA Distribution near Uracil Sites")

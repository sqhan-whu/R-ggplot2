df<-read.table("peak.txt",head=T)
bp<- ggplot(df, aes(x=type, y=num, fill=factor(type)))+
geom_bar(width = 1, stat = "identity")+facet_grid(sam~.,scales = 'free')+scale_fill_brewer(palette="Set3")+
#theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  theme_bw(base_size=15)+   #去除灰色背景并设置字体大小  
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
  panel.border = element_blank(),     
     panel.grid.major = element_blank(),       
      panel.grid.minor = element_blank(),       
       axis.line = element_line(colour = "black"))+ #去除背景格线 
        labs(title = "G4 peaks distribution")+   #设置标题  
      theme(plot.title = element_text(size=15,hjust = 0.5)) #标题大小和位置print(g)

bp

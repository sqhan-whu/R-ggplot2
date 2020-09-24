###Heat map of the Pearson correlation coefficient for each
#gene pair shows that gan, fei and gan_fei
#[same group colors as (A)] measurements are highly correlated with each
#other [median Pearson correlation r = 0.89 (gan), 0.62 (fei),
#; P < 10−7]. gan and fei genes also show a weak degree of cross-correlation 
#(r = 0.21, P < 10−14).

library(corrplot)
library(dplyr)
library(ggplot2)
library(reshape2)

#Source scripts
#source('plot_theme.R')

counts_to_plot <-read.table("corr2.txt",head=T,sep='\t')

rownames(counts_to_plot)=counts_to_plot[,1]
counts_to_plot <- counts_to_plot[,-1]

M = cor(counts_to_plot, use = 'complete.obs')
diag(M) = 0 #Mask diagonal


corr_df = as.data.frame(M)
corr_df$gene2 = rownames(corr_df)

corr_melted=  melt(corr_df, id = c('gene2'))
corr_melted$variable = factor(corr_melted$variable, levels = rev(colnames(M)))
corr_melted$gene2 = factor(corr_melted$gene2, levels = rownames(M))

gan = c('GAN1','GAN2','YY2','YY3')
fei = c('IN5','R5','GZ1','GY2','HY1','LY1')

id = c()
for (idx in 1:dim(corr_tri)[1]) {
  temp = 0
  
  if (as.character(corr_tri$col[idx]) %in% gan) {
    temp = 2
  } else if (as.character(corr_tri$col[idx]) %in% fei) {
    temp = 3
  }
  
  if (as.character(corr_tri$row[idx]) %in% gan) {
    temp = temp + 2
  } else if (as.character(corr_tri$row[idx]) %in% fei) {
    temp = temp + 3
  }
  
  id = c(id, temp)
}
corr_tri$id = id

median = c(median(as.matrix(corr_tri %>% filter(id == 4) %>% select(val))), 
           median(as.matrix(corr_tri %>% filter(id == 6) %>% select(val))),
           median(as.matrix(corr_tri %>% filter(id == 5) %>% select(val)))) #gan, fei, gan_fei
#Perform one sample t-test
pvals = c(t.test(as.matrix(corr_tri %>% filter(id == 4) %>% select(val)), mu=0)$p.value, 
		t.test(as.matrix(corr_tri %>% filter(id == 6) %>% select(val)), mu=0)$p.value,
		t.test(as.matrix(corr_tri %>% filter(id == 5) %>% select(val)), mu=0)$p.value)
pvals_adj = p.adjust(pvals, method = 'bonferroni')

#Plot

theme_pub = function(base_size = 15, font = 'Helvetica') {
  txt = element_text(size = base_size, colour = 'black', face = 'plain')
  bold_txt = element_text(size = base_size, colour = 'black', face = 'bold')
  
  theme_classic(base_size = base_size, base_family = font)  +
    theme(
      legend.key = element_blank(),
      strip.background = element_blank(),
      text = txt,
      plot.title = txt,
      axis.title = bold_txt,
      axis.text = txt,
      legend.title = bold_txt,
      legend.text = txt,
      legend.position = 'bottom')
}



corr_plot = ggplot(corr_melted) +
  geom_tile(aes(x= gene2, y = variable, fill = value), color = 'white') +
# scale_fill_gradient2(low = '#f7f7f7', high = '#9055A2', space = "Lab", guide = 'colourbar', limits = c(0,1)) +
  scale_fill_gradient2(low = '#ca0020', mid = '#f7f7f7', midpoint = 0, high = '#0571b0', space = "Lab", guide = 'colourbar', limits = c(-1,1)) +
  theme_pub() +
  theme(
    axis.ticks.x = element_blank(),
    axis.ticks.y = element_blank(),
    axis.line.x = element_blank(),
    axis.line.y = element_blank(),
    axis.text.y = element_text(size = 9),
    axis.text.x = element_text(size = 9, angle = 90),
    legend.position = 'right'
  ) +
  labs(x = '', y = '', fill = '') +
  scale_x_discrete(position = 'top') +
  guides(fill = guide_colorbar(barwidth = 0.5, barheight = 7, ticks = FALSE))

ggsave('corr4.pdf', width = 5.2, height = 4.2)

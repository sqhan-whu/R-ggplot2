# Data: 2020.02.28
# Author: Han Shaoqing
# usage: analysis for m6A peaks distribution

# Packages:
# https://github.com/olarerin/metaPlotR
# wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.chromFa.tar.gz
# perl make_annot_bed.pl --genomeDir chroms/ --genePred hg38_gencode.genePred > hg38_annot.bed
# sort -k1,1 -k2,2n hg38_annot.bed > hg38_annot.sorted.bed
# perl metaPlotR/metaPlotR-master/size_of_cds_utrs.pl --annot hg38_annot.sorted.bed > hg38_region_sizes.txt
# perl metaPlotR/metaPlotR-master/annotate_bed_file.pl --bed mP1.bed --bed2 hg38_annot.sorted.bed  > fm.bed
# perl metaPlotR/metaPlotR-master/rel_and_abs_dist_calc.pl --bed fm.bed --regions hg38_region_sizes.txt > fm.txt

#################################################################################################################
# m6A peaks : format 6 column : chr1    135140  135431  peak_1  0       +
# cat peak.bed |tail -n +2|sort -k1,1 -k2,2n|awk '{s+=1;print $1"\t"$2"\t"$3"\tpeak_"s"\t0\t"$6}'
#################################################################################################################


library (ggplot2)
library(metaplotr)
library(scales)

m6a.dist <- read.delim ("m6a.dist.measures.txt", header = T)
m6.dist <- read.delim ("m6a.pP1dist.measures.txt", header = T)
#head(m6a.dist)
#head(m6.dist)
trx_len <- m6a.dist$utr5_size + m6a.dist$cds_size + m6a.dist$utr3_size # Determine transcript length
temp <- data.frame(m6a.dist$gene_name, m6a.dist$refseqID, trx_len)
colnames(temp) <- c("gene_name", "gid", "trx_len") 
temp.df <- temp[order(temp$gene_name, temp$gid, -temp$trx_len),]
temp.df <- temp[!duplicated(temp$gene_name),]

# limit m6a data to one transcript per gene (longest)
m6a.dist <- m6a.dist[m6a.dist$refseqID %in% temp.df$gid,]

utr5.SF <- median(m6a.dist$utr5_size, na.rm = T)/median(m6a.dist$cds_size, na.rm = T)
utr3.SF <- median(m6a.dist$utr3_size, na.rm = T)/median(m6a.dist$cds_size, na.rm = T)

# assign the regions to new dataframes
utr5.m6a.dist <- m6a.dist[m6a.dist$rel_location < 1, ]
cds.m6a.dist <- m6a.dist [m6a.dist$rel_location < 2 & m6a.dist$rel_location >= 1, ]
utr3.m6a.dist <- m6a.dist[m6a.dist$rel_location >= 2, ]

utr5.m6a.dist$rel_location <- rescale(utr5.m6a.dist$rel_location, to = c(1-utr5.SF, 1), from = c(0,1))
utr3.m6a.dist$rel_location <- rescale(utr3.m6a.dist$rel_location, to = c(2, 2+utr3.SF), from = c(2,3))

m6a.metagene.coord <- c(utr5.m6a.dist$rel_location, cds.m6a.dist$rel_location, utr3.m6a.dist$rel_location)
#qplot(m6a.metagene.coord, geom="density") + geom_vline(xintercept = 1:2, col = "red") + theme_bw()

#m6.dist <- t(read.delim ("fm2.txt", header = T))

tr_len <- m6.dist$utr5_size + m6.dist$cds_size + m6.dist$utr3_size # Determine transcript length
temp <- data.frame(m6.dist$gene_name, m6.dist$refseqID, tr_len)
colnames(temp) <- c("gene_name", "gid", "tr_len") 
temp.df <- temp[order(temp$gene_name, temp$gid, -temp$tr_len),]
temp.df <- temp[!duplicated(temp$gene_name),]

# limit m6a data to one transcript per gene (longest)
m6.dist <- m6.dist[m6.dist$refseqID %in% temp.df$gid,]

utr5.SF <- median(m6.dist$utr5_size, na.rm = T)/median(m6.dist$cds_size, na.rm = T)
utr3.SF <- median(m6.dist$utr3_size, na.rm = T)/median(m6.dist$cds_size, na.rm = T)

# assign the regions to new dataframes
utr5.m6.dist <- m6.dist[m6.dist$rel_location < 1, ]
cds.m6.dist <- m6.dist [m6.dist$rel_location < 2 & m6.dist$rel_location >= 1, ]
utr3.m6.dist <- m6.dist[m6.dist$rel_location >= 2, ]

utr5.m6.dist$rel_location <- rescale(utr5.m6.dist$rel_location, to = c(1-utr5.SF, 1), from = c(0,1))
utr3.m6.dist$rel_location <- rescale(utr3.m6.dist$rel_location, to = c(2, 2+utr3.SF), from = c(2,3))

pseudoU.metagene.coord <- c(utr5.m6.dist$rel_location, cds.m6.dist$rel_location, utr3.m6.dist$rel_location)

metagene.cord <- c(m6a.metagene.coord, pseudoU.metagene.coord)

mod <- c(rep("nomal", length(m6a.metagene.coord)), 
         rep("patients", length(pseudoU.metagene.coord))) 

df <- data.frame(metagene.cord, mod)

ggplot(df) + geom_density(aes(x = metagene.cord, fill = mod), alpha=0.4) + xlim(0, 3) +theme_bw()+ geom_vline(xintercept = 1:2, col = "grey")


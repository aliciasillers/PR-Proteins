library(tidyverse)
library(reshape)

tags <- read.delim("TAGs.txt", header = FALSE, sep = '\t')
prbed <- read.delim("RR_PRs.bed", header = FALSE, sep = '\t')

tagbed <- prbed %>% filter(V4 %in% tags$V1)

write.table(tagbed, "TAGs.bed", sep = '\t', row.names = FALSE, col.names = FALSE, quote = FALSE)

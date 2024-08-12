# load packages

library("chromoMap")
library("dplyr")
library("htmlwidgets")

# chromosome file
chromfile <- read.delim("../Genome/farr1.txt", sep = "\t", header = FALSE)
chromfile <- chromfile %>% mutate(V1.5 = rep(1, length(chromfile[,1])), .after = V1) %>% filter(!grepl("^contig", V1))
colnames(chromfile) <- c("V1", "V2", "V3")
chromfile$V2 <- as.numeric(chromfile$V2)
chromfile$V3 <- as.numeric(chromfile$V3)

# annotation file
prs <- read.delim("RR_PRs2.bed", sep="\t", header = FALSE)
prs <- as.data.frame(cbind(prs[,4], prs[,1], prs[,2], prs[,3], prs[,5]))
prs[,3] <- as.numeric(prs[,3])
prs[,4] <- as.numeric(prs[,4])

# run ChromoMap

pr.cm <- chromoMap(ch.files = list(chromfile), data.files = list(prs), title = "PR Proteins Across the Royal Royce Genome", data_based_color_map = TRUE, data_type = "categorical", legend = TRUE, lg_x = 35, lg_y = 515, discrete.domain = list(c("PR1", "PR2", "PR3", "PR4", "PR5", "PR6", "PR7", "PR8", "PR9", "PR10", "PR11", "PR12", "PR14", "PR16", "PR17", "PR18")), data_colors = list(c("royalblue1", "darkolivegreen4", "tan", "turquoise", "lightpink3", "azure2", "lavenderblush1", "burlywood2", "lightblue2", "salmon2", "palegreen2", "thistle", "tomato3", "goldenrod1", "seashell3", "slateblue")), n_win.factor = 2, export.options = TRUE)

# save figures as html files
saveWidget(pr.cm, "chromoMap_PRs.html")

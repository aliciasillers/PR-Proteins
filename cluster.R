library(tidyverse)
library(purrr)

#read in file

file1 <- read.delim("filefortags.bed", sep = '\t', header = FALSE)

#split

grouped <- split(file1, f = file1$V1)

length(grouped)

#filter

groups <- keep(grouped, function(x) nrow(x) > 1)

length(groups)

print(groups)

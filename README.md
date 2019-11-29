# plotAM
# this procedure is about to draw the antigenic map based on antigenic distance among viruses using classical multidimensional scaling

#usage
# load your data: the example data can be seen from 222-1.txt
library(readr)

X222_1 <- read_delim("Downloads/222-1.txt",  "\t", escape_double = FALSE, trim_ws = TRUE)

#plot your antigenic map using ggplot2

library(ggplot2)

plotAM(X222_1)

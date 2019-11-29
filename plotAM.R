#this procedure is to draw the antigenic map for virus

#import your data
#take X_222 as an example
plotAM<-function(virus_data) {
  library(readr)
  #X222_1 <- read_delim("Downloads/222-1.txt",  "\t", escape_double = FALSE, trim_ws = TRUE)
  DF<-data.matrix(virus_data[,-1])
  rownames(DF)<-virus_data$ID
  REF<-apply(DF,2,max)
  DF1<-log2(DF)
  DF2<-DF1
  for (j in 1:ncol(DF1)) {DF2[,j]<-(log2(REF)[j]-DF1[,j])}
  rownames(DF2)<-virus_data$ID
  
  dis<-dist(DF2)
  dis[is.infinite(dis)]<-0
  fit<-cmdscale(dis,k=2,eig = TRUE)
  
  A<-strsplit(rownames(DF2),"/")
  m<-length(A[[1]])
  year<-sapply(1:nrow(DF2),function(x) A[[x]][m])
  library(ggplot2)
  
  df<-data.frame(X=fit$points[,1],Y=fit$points[,2],year=year)
  ggplot(df, aes(X, Y, color = year)) +geom_point(shape = 16, size = 3)+theme(text = element_text(size=15)) +labs(caption="Antigenic Map",x="",y="")
  
}




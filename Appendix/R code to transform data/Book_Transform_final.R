
library(data.table) 
dframe_author <- read.table(file='Feature_author.txt',header=FALSE, sep=",",col.names=c('Key','Value')) 
dtable_author <- data.table(f1_list,key='unique_ba') 

dframe_year <- read.table(file='Feature_year.txt',header=FALSE, sep=",",col.names=c('Key','Value')) 
dtable_year <- data.table(f2_list,key='unique_years') 

dframe_publisher <- read.table(file='Feature_publisher.txt',quote="",header=FALSE, sep=",",col.names=c('Key','Value'),stringsAsFactors = FALSE) 
dtable_publisher <- data.table(f3_list,key='unique_publishers') 


op <- options(stringsAsFactors=FALSE)
itemFeatures2 <- data.frame()

for (i in 1:nrow(BX_Books))
{
  book_author <- BX_Books$`Book-Author`[i]
  year <- BX_Books$`Year-Of-Publication`[i]
  year <- as.character(year)
  publisher <- BX_Books$Publisher[i]
  isbn <- BX_Books$ISBN[i]
  authorID <- dtable_author[book_author]$id
  yearID <- dtable_year[year]$id
  publisherID <- dtable_publisher[publisher]$id
  itemFeatures2 <- rbind(itemFeatures2,data.frame(isbn,yearID,publisherID)) 
}

write.csv(itemFeatures, file ="itemFeatures.csv", eol = "\n",row.names = FALSE)

library(readr)

BX_Book_Ratings = read.table("BookRatings_Explicit.txt")
##BX_Book_Ratings<-BX_Book_Ratings[!(BX_Book_Ratings$V3==0),]

summary(BX_Books)
help(unique) 
unique_ba = unique(BX_Books$`Book-Author`)
unique_years= unique(BX_Books$`Year-Of-Publication`)
unique_years = as.character(unique_years)
unique_publishers = unique(BX_Books$Publisher)


f1 <- data.frame(unique_ba)
f2 <- data.frame(unique_years)
f3 <- data.frame(unique_publishers)

id_f1 <- rownames(f1)
f1_list <- cbind(id=id_f1, f1)

help(seq.int)
id_f2 <- seq.int(102041,102157)
id_f2 <- as.character(id_f2)
f2_list <- cbind(id=id_f2, f2)

id_f3 <- seq.int(102158,118979)
f3_list <- cbind(id=id_f3, f3)

#feature_combined <- rbind(f1,f2,f3)
#id <- rownames(feature_combined)
#feature_list <- cbind(id=id, feature_combined)
#write.table(f1_list, "~/Desktop/MS-PA/QuarterV-Winter/CSC 577/Final Project/BX-CSV-Dump 2/Feature_author.txt", sep=",",row.names = FALSE)
#write.table(f2_list, "~/Desktop/MS-PA/QuarterV-Winter/CSC 577/Final Project/BX-CSV-Dump 2/Feature_year.txt", sep=",",row.names = FALSE)
#write.table(f3_list, "~/Desktop/MS-PA/QuarterV-Winter/CSC 577/Final Project/BX-CSV-Dump 2/Feature_publisher.txt", sep=",",row.names = FALSE)




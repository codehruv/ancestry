args <- commandArgs(TRUE)

tbl <- read.table(args[1])
finalFam <- read.csv("merge.fam", sep=" ", header=F)

sampleRow <- which(grepl("FAM001", finalFam[,1]))

labels <- unique(finalFam[,1])
lbls <- lbls[lbls != "FAM001"]

lbls

cat(toString(tbl[sampleRow,]), file='ancestry.txt') 
png(file="ancestry.png")
slices <- as.numeric(tbl[sampleRow,])
pie(slices, labels = lbls, main="Ancestry Chart")
dev.off()

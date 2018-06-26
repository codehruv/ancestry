args <- commandArgs(TRUE)

tbl <- read.table(args[1])
finalFam <- read.csv("merge.fam", sep=" ", header=F)

sampleRow <- which(grepl("FAM001", finalFam[,1]))

cat(toString(tbl[sampleRow,]), file='ancestry.txt') 
png(file="ancestry.png")
slices <- as.numeric(tbl[sampleRow,])
lbls <- c("East Asian", "European", "African")
pie(slices, labels = lbls, main="Ancestry Chart")
dev.off()

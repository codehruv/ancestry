tbl <- read.table("final1.3.Q")
sampleFam <- read.csv("sample.fam", sep=" ", header=F)
finalFam <- read.csv("final1.fam", sep=" ", header=F)

sampleRow <- which(grepl(sampleFam[1,1], finalFam[,1]))

cat(toString(tbl[sampleRow,]), file='ancestry.txt') 
png(file="ancestry.png")
slices <- as.numeric(tbl[sampleRow,])
lbls <- c("Central Europe", "East Africa", "East Asia")
pie(slices, labels = lbls, main="Ancestry Chart")
dev.off()

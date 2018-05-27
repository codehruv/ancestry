tbl <- read.table("merge.9.Q")

sampleRow <- 1

cat(toString(tbl[sampleRow,]), file='ancestry.txt') 
png(file="ancestry.png")
slices <- as.numeric(tbl[sampleRow,])
lbls <- c("Med", "Nat", "NEA", "NEU", "OCE", "RSA", "SEA", "SWA", "SSA")
pie(slices, labels = lbls, main="Ancestry Chart")
dev.off()

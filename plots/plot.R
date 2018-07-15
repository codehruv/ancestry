args <- commandArgs(TRUE)

tbl <- read.table(args[1])

popsFam <- read.csv("merge.pop", sep="\n", header=F)
sampleRow <- which(grepl(" ", popsFam[,1]))

cat(toString(tbl[sampleRow,]), file='ancestry.txt') 
png(file="ancestry.png")
slices <- as.numeric(tbl[sampleRow,])
lbls <- unique(popsFam)
lbls <- lbls[!(lbls == " ")]
 
#lbls <- c("African", "East Asian", "European", "MiddleEastern","South Asian")
#lbls <- c("ACB", "ASW", "CEU", "CLM", "MXL", "NAT", "PEL", "PUR", "YRI")
pie(slices, labels = lbls, main="Ancestry Chart")
dev.off()

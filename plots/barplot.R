tbl <- read.table("PHYLOCORE.5.Q")
people <- read.csv("merge.pop", header=F)
sampleFam <- read.csv("me_final.fam", sep=" ", header=F)
finalFam <- read.csv("merge.fam", sep=" ", header=F)

sampleRow <- which(grepl(sampleFam[1,1], finalFam[,1]))

temp <- tbl[1,]
tbl[1,] <- tbl[sampleRow,]
tbl[sampleRow,] <- temp

cat(toString(tbl[1,]), file='ancestry.txt') 
png(file="ancestry.png")
barplot( t(as.matrix(tbl)), col=rainbow(5), las=2, cex.names=0.5, xlab="People", ylab="Ancestry", border=NA )
dev.off()

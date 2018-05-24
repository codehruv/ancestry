tbl <- read.table("final1.2.Q")
sampleFam <- read.csv("sample.fam", sep=" ", header=F)
finalFam <- read.csv("final1.fam", sep=" ", header=F)

sampleRow <- which(grepl(sampleFam[1,1], finalFam[,1]))
people <- c()

temp <- tbl[1,]
tbl[1,] <- tbl[sampleRow,]
tbl[sampleRow,] <- temp

for(i in 1:60) {
    people[i] = ""
    if( i == 1 ) people[i] = "YOU"
    if( i == 60 ) people[i] = "YRI"
}

cat(toString(tbl[1,]), file='ancestry.txt') 
png(file="ancestry.png")
barplot( t(as.matrix(tbl)), col=rainbow(3), names.arg=people, las=2, cex.names=0.5, xlab="People", ylab="Ancestry", border=NA )
dev.off()

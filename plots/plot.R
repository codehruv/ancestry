# Step 1: Input
args <- commandArgs(TRUE)
tbl <- read.table(args[1])

popsFam <- read.csv("merge.pop", sep="\n", header=F)

# Step 2: Extracting Result
# 2.1 Numerical Result
sampleRow <- which(grepl(" ", popsFam[,1]))
slices <- as.numeric(tbl[sampleRow,])

# 2.2 Corresponding populations
lbls <- unique(popsFam)
lbls <- lbls[!(lbls == " ")]


# Step 3: Clearing up results and plotting
# 3.1 Clearing up results
final_table <- data.frame(slices, lbls)
final_table <- final_table[final_table$slices > 0.00010, ]

# 3.2 Plotting
png(file="ancestry.png")
pie(final_table[,1], labels = final_table[,2], main="Ancestry Chart")
dev.off()


# Later development
if(FALSE) {
pop2region <- read.table("pops2region.txt", sep=" ", header=F)
names(pop2region) <- c("Pop", "Region")

finalized_table <- merge(final_table, pop2region, by.x='lbls', by.y='Pop')

#finalized_table <- finalized_table[finalized_table$slices > 0.00010, ]

print(finalized_table)
print(final_table)
}



library(dplyr)
library(tidyr)
library(ggplot2)

# Step 1: Input
args <- commandArgs(TRUE)
#tbl <- read.table("merge.84.Q")
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

# Later development
pop2region <- read.table("reference_panel/pop2superpop.txt", sep="\t", header=F)
names(pop2region) <- c("Pop", "Region")

finalized_table <- merge(final_table, pop2region, by.x='lbls', by.y='Pop')
finalized_table <- distinct(finalized_table)
#finalized_table <- finalized_table[finalized_table$slices > 0.00010, ]

# 3.2 Saving Info
if(is.data.frame(finalized_table) && nrow(finalized_table)!=0) {
    write.table(finalized_table, "ancestry.txt", sep="\t", quote=F, row.names=F)
} else {
    write.table(final_table, "ancestry.txt", sep="\t", quote=F, row.names=F)
}

if(FALSE) {
print(finalized_table)
print(final_table)

par(new=TRUE)
p <- pie(finalized_table[,2], labels=finalized_table[,3], radius = 0.5) 
color_scheme <- c("EUROPE" = "blue", "MIDDLE_EAST" = "white", "OCEANIA" = "blue", "EAST_ASIA" = "yellow", "CENTRAL_SOUTH_ASIA" = "brown")
p + scale_colour_manual(values = color_scheme)

png(file="ancestrySP.png")
sunburst(finalized_table)
dev.off()
}

read.ba.peaktable <- function(CSV, target='Ladder') {

# Find position of the ladder's peak table
CSV.lines <- readLines(file(CSV, encoding="ISO-8859-1"))
peaktable.start  <- 3 + grep(paste('Sample Name', target, sep=','), CSV.lines)
peaktable.length <- grep("^ $", CSV.lines[peaktable.start:length(CSV.lines)])[1] - 2

# Read the table and prepare a data frame.
peaktable <-  scan(CSV, skip=peaktable.start, what="character", nlines=peaktable.length, sep=',')
dim(peaktable) <- c(10, peaktable.length)
peaktable <- data.frame(t(peaktable), stringsAsFactors=FALSE)
colnames(peaktable) <- c('Size',   'Conc', 'Molarity', 'Observations', 'Area', 'Time', 'Peak.Height', 'Peak.Width', 'Total.perc', 'Time.corrected.area')

# Repair all columns but 'Observations'.
removecommas  <- function(X) sub(',','',X)
correctcolumn <- function(X) as.numeric(sapply(peaktable[,X], removecommas))
for (column in c('Size',   'Conc', 'Molarity', 'Area', 'Time', 'Peak.Height', 'Peak.Width', 'Total.perc', 'Time.corrected.area')) peaktable[,column] <- correctcolumn(column)

# Repair 'Observations'.
peaktable$Observations <- as.factor(peaktable$Observations)

return(peaktable)

}

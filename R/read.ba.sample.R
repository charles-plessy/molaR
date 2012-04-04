read.ba.sample<- function(CSV) {

# Find start and stop position of the data in the file
CSV.lines <- readLines(file(CSV, encoding="ISO-8859-1"))
timevalue.start  <- grep('Time,Value', CSV.lines)
timevalue.length <- grep("^ $", CSV.lines[timevalue.start:length(CSV.lines)])[1] - 2

# Load the data and return a data frame.
timevalue <-  scan(CSV, skip=timevalue.start, nlines=timevalue.length, sep=',')
dim(timevalue) <- c(2, timevalue.length)
timevalue <- data.frame(t(timevalue))
colnames(timevalue) <- c('Time', 'Value')

return(timevalue)

}

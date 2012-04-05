\name{molaR-package}
\alias{molaR-package}
\docType{package}
\title{molaR}
\description{
Load BioAnalyzer size profiles exported in CSV format, and calculate their molarity.
}
\details{
The current workflow is 1) load the ladder data with the read.ba.peaktable() function,
2) load the data for the sample of interest with the read.ba.sample() function and
3) confert its timepoints into sizes with the ba.fit() function.
}
\author{
Charles Plessy, RIKEN Omics Science Center
}
\keyword{ package }
\examples{
ladder <- read.clonotypes(system.file("ba.results.csv", package = "molaR"))
sample1 <- read.clonotypes(system.file("ba.sample1.csv", package = "molaR"))
sample1$size <- ba.fit(ladder, sample1)
}

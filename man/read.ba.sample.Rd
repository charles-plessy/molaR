\name{read.ba.sample}
\alias{read.ba.sample}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Reads a sample's fluorescence time course in a data frame.
}
\description{
Reads the file once with \code{\link{readLines}} to locate the data in,
and then reads it again with code{\link{scan}}
}
\usage{
read.ba.sample(CSV)
}
\arguments{
  \item{CSV}{Path to a sample fluorescence time course exported in CSV format by the BioAnalyzer software.}
}
\value{
Returns a data frame.
\item{Time}{Time point, in seconds}
\item{Value}{Fluorescence intensity, in fluorescence units (FU).}
}
\author{
Charles Plessy, RIKEN Omics Science Center
}
\seealso{
\code{\link{read.ba.peaktable}}
}
\examples{
sample1 <- read.ba.sample(system.file("data/ba.sample1.csv", package = "molaR"))
sample2 <- read.ba.sample(system.file("data/ba.sample2.csv", package = "molaR"))
}
\keyword{ BioAnalyzer }

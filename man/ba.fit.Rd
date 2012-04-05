\name{ba.fit}
\alias{ba.fit}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Convert time into size using the ladder's peak table.
}
\description{
Fits size and time from a ladder's peak table on a log scale, and
uses the resulting slope and intercept to convert a sample's time
into size.
}
\usage{
ba.fit(ladder, sample)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ladder}{
Ladder peak table, a data frame returned by read.ba.peaktable().
}
  \item{sample}{
Sampple Time/Value table, a data frame returned by read.ba.sample().
}
}
\details{
Size = exp((Time - intercept) / slope)
}
\value{
A numeric vector of sizes of the same length as the sample's data frame number of rows.
}
\author{
Charles Plessy, RIKEN Omics Science Center
}

\seealso{
\code{\link{read.ba.peaktable}}, \code{\link{read.ba.sample}}
}
\examples{
ladder <- read.ba.peaktable(system.file("data/ba.results.csv", package = "molaR"))
sample1 <- read.ba.sample(system.file("data/ba.sample1.csv", package = "molaR"))
sample1$size <- ba.fit(ladder, sample1)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ BioAnalyzer }

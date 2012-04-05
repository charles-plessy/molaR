\name{read.ba.peaktable}
\alias{read.ba.peaktable}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Read a peak table from a BioAnalyzer Result CSV file}
\description{
The BioAnalyzer result CSV files contain multiple "peak tables".  This
function parses the CSV file for a given sample, by default the Ladder,
and returns a data frame.
}
\usage{
read.ba.peaktable(CSV, target = "Ladder")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{CSV}{
Path to a BioAnalyzer Result CSV file.
}
  \item{target}{
Name of a sample present in that file.  Default: "Ladder".
}
}
\details{
The file is read once with the readLines() function, the boundaires of the
peak table are searched, and the file is read once again within these
boundaries with the scan() function.
}
\value{
Data frame with the following columns names.  The original names follow.
\item{Size}{Size [bp]}
\item{Conc}Conc. [pg/µl]{}
\item{Molarity}{Molarity [pmol/l]}
\item{Observations}{Observations}
\item{Area}{Area}
\item{Time}{Aligned Migration Time [s]}
\item{Peak.Height}{Peak Height}
\item{Peak.Width}{Peak Width}
\item{Total.perc}{\% of Total}
\item{Time.corrected.area}{Time corrected area}
All columns are numeric type, except "Observations" which is a factor.
"Lower Marker" and "Upper Marker" indicate the size markers mixed with
all samples.  In the case of Ladder peak tables, "Ladder Peak" indicates
the ladder peaks.
}
\references{
See BioAnalyzer's 2100 Expert documentation for more information.
}
\author{
Charles Plessy
}

\seealso{
\code{\link{read.ba.sample}}
}
\examples{
ladder <- read.ba.peaktable(system.file("data/ba.results.csv", package = "molaR"))
summary(ladder)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Ladder }

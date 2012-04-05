\name{read.ba.peaktable}
\alias{read.ba.peaktable}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
read.ba.peaktable(CSV, target = "Ladder")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{CSV}{
%%     ~~Describe \code{CSV} here~~
}
  \item{target}{
%%     ~~Describe \code{target} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (CSV, target = "Ladder") 
{
    CSV.lines <- readLines(file(CSV, encoding = "ISO-8859-1"))
    peaktable.start <- 3 + grep(paste("Sample Name", target, 
        sep = ","), CSV.lines)
    peaktable.length <- grep("^ $", CSV.lines[peaktable.start:length(CSV.lines)])[1] - 
        2
    peaktable <- scan(CSV, skip = peaktable.start, what = "character", 
        nlines = peaktable.length, sep = ",")
    dim(peaktable) <- c(10, peaktable.length)
    peaktable <- data.frame(t(peaktable), stringsAsFactors = FALSE)
    colnames(peaktable) <- c("Size", "Conc", "Molarity", "Observations", 
        "Area", "Time", "Peak.Height", "Peak.Width", "Total.perc", 
        "Time.corrected.area")
    removecommas <- function(X) sub(",", "", X)
    correctcolumn <- function(X) as.numeric(sapply(peaktable[, 
        X], removecommas))
    for (column in c("Size", "Conc", "Molarity", "Area", "Time", 
        "Peak.Height", "Peak.Width", "Total.perc", "Time.corrected.area")) peaktable[, 
        column] <- correctcolumn(column)
    peaktable$Observations <- as.factor(peaktable$Observations)
    return(peaktable)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

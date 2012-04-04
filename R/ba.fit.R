ba.fit <- function(ladder, sample) {
fit <- with(ladder, lm(Time ~ log(Size)))$coefficients
with(sample, exp( (Time - fit[1]) / fit[2] ))
}

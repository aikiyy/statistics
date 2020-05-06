3 + 5

身長 <- c(173,178,180,183,174,179,179,174,192)
summary(身長)

varp <- function(x) {
  標本分散<- var(x) * (length(x) - 1) / length(x)
  標本分散
}
x <- c(10, 13, 8, 15, 8)
# 不偏分散
var(x)
# 標本分散
varp(x)
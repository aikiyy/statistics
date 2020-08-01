# 対数の法則
ave <- numeric(1000)
x <- as.integer(runif(1000,1,7))
for(n in 1:1000) ave[n] <- mean(x[1:n])
plot(1:1000,ave)
abline(h=3.5)
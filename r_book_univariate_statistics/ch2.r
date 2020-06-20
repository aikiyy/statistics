score <- read.table(pipe("pbpaste"),header=TRUE)

hist(score$math)
plot(score$math, score$phys)

# ピアソンの積率相関係数
cor(score$math, score$phys)
cor.test(score$math, score$phys)

# スピアマンの順位相関係数
# アンケート回答のような値自体に意味はなく、順位に意味があるときに使う
cor.test(score$math, score$phys, method="spearman")

# ケンドールの順位相関係数
cor.test(score$math, score$phys, method="kendall")

# スピアマンとケンドールの比較
M <- 10
N <- 200
x <- matrix(runif(M*N,0,1),nrow=M,ncol=N)
y <- matrix(runif(M*N,0,1),nrow=M,ncol=N)
sz <- cor(x, y, method="spearman")
kz <- cor(x, y, method="kendall")
plot(sz, kz, xlim=c(-1,1), ylim=c(-1, 1), xlab="Speaman", ylab="Kendall", pch=20)


# 問題2-1
x <- seq(0,1,by=0.01)
y <- 1-x^4
plot(x,y)
cor.test(x,y)
cor.test(x,y,method="spearman")
cor.test(x,y,method="kendall")

# 問題2-6
x <- seq(-1,1,by=0.01)
y <- x^3-3*x+rnorm(length(x),0,0.1)
plot(x,y)
cor.test(x,y)

# 問題2-7
M <- 50
N <- 200
x <- matrix(runif(M*N,0,1), nrow=M, ncol=N)
y <- matrix(runif(M*N,0,1), nrow=M, ncol=N)
sp <- cor(x, y, method="spearman")
kd <- cor(x, y, method="kendall")
z <- 3*kd - 2*sp
hist(z)
# 正規分布
curve(dnorm(x,mean=0,sd=1),from=-4,to=4)
curve(dnorm(x,mean=1,sd=1),add=TRUE)

# 正規母集団から単純無作為抽出
標本 <- rnorm(n=10000,mean=50,sd=10)
hist(標本)

# 標本平均
標本 <- rnorm(n=10,mean=50,sd=10)
mean(標本)

# モンテカルロシミュレーション
# 標本平均の標本分布
標本平均 <- numeric(length=10000)
for(i in 1:10000) {
  標本 <- rnorm(n=10,mean=50,sd=10)
  標本平均[i] <- mean(標本)
}
hist(標本平均)
mean(標本平均)
# --> ある統計量の標本分布の平均が母平均と一致する=不偏性
# --> 標本平均=母平均の不偏推定量
var(標本平均)

# 標本分散と不偏分散の標本分布
標本分散 <- numeric(length=10000)
不偏分散 <- numeric(length=10000)
for(i in 1:10000) {
  標本 <- rnorm(n=10,mean=50,sd=10)
  標本分散[i] <- mean((標本-mean(標本))^2)
  不偏分散[i] <- var(標本)
}
mean(標本分散)
mean(不偏分散)
# dbinom(成功数,試行数,成功確率): 成功確率下における成功数/試行数の実現する確率
勝利数 <- 0:20
plot(勝利数,dbinom(勝利数,20,0.5),type="h")
# pbinom(成功数,試行数,成功確率): 成功確率下における成功数<=xとなる確率
round(pbinom(勝利数,20,0.5),4)

的中回数 <- 0:10
round(pbinom(的中回数,10,1/3),4)
p値 <- pbinom(6,10,1/3,lower.tail=FALSE)
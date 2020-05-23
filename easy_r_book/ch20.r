t値 <- numeric(length=10000)
有意回数 <- 0
for(i in 1:10000){
  第1群 <- rnorm(n=10,mean=0,sd=1)
  第2群 <- rnorm(n=10,mean=0.5,sd=1)
  検定結果 <- t.test(第1群,第2群,var.equal=TRUE)
  t値[i] <-検定結果[[1]]
  有意回数 <- 有意回数+ifelse(検定結果[[3]]<0.05,1,0)
}
有意回数/10000 #検定力
#-->実際には母集団に0.5の差があるが、有意差が見られる確率は18%ほど


hist(t値,freq=FALSE)
curve(dt(x,df=18),add=TRUE)
#-->中心がずれる


非心度 <- -0.5*sqrt(5)
curve(dt(x,df=18,ncp=非心度),add=TRUE)


# 検定力に基づいてサンプルサイズを決める
# NULLとした値を求める
power.t.test(n=10,delta=0.5,sd=1,sig.level=0.05,power=NULL,strict=TRUE)
power.t.test(n=NULL,delta=0.5,sd=1,sig.level=0.05,power=0.8,strict=TRUE)

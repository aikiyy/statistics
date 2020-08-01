# 正規分布
curve(dnorm(x,mean=5,sd=1),1,9,type="l")

# 対数正規分布
curve(dlnorm(x,meanlog=1,sdlog=1),0,10,type="l")

# 指数分布
curve(dexp(x,rate=2))
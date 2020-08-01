# 二項分布
# n=10, k=7, p=0.6
dbinom(7,10,p=0.6)
barplot(dbinom(0:10,10,0.5),names=0:10,xlab="x")

# ポワソン分布
# 独立かつランダムな事象が一定期間に起きる回数Xの分布
barplot(dpois(0:10,lambda=2.3),names=0:10,xlab="x")

# 幾何分布
# 確率pで起きる事象が初めて起きるまでの試行回数Xの分布
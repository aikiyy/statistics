x <- c(290,50,80,100,200,350,430,80,210,110,70,260,220,330,170,420,80,300,290,230)
y <- c(350,70,100,130,250,430,520,100,260,140,90,320,270,400,210,510,100,370,350,280)

par(mfrow=c(2,1))
hist(x,breaks=seq(0,600,60))
hist(y,breaks=seq(0,600,60))

source("easy_r_book/varp.r")
varp(x)
sqrt(varp(x))

par(mflow=c(1,1))
差得点 <- y-x
hist(差得点)

cor(x,y)

単回帰結果 <- lm(y~x)
summary(単回帰結果)
# y=7.012840+1.196661x
plot(x,y)
abline(単回帰結果)
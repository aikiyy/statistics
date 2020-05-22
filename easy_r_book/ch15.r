# 回帰分析
重回帰データ <- read.csv("easy_r_book/chap15data.csv",header=TRUE)
attach(重回帰データ)

重回帰結果 <- lm(daughter~father+mother)
summary(重回帰結果)

単回帰結果 <- update(重回帰結果,.~.-mother)
summary(単回帰結果)
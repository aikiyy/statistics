統計テスト1 <- c(6,10,6,10,5,3,5,9,3,3,11,6,11,9,7,5,8,7,7,9)
統計テスト2 <- c(10,13,8,15,8,6,9,10,7,3,18,14,18,11,12,5,7,12,7,7)

shidouhou <- read.csv("easy_r_book/shidouhou.csv", fileEncoding = "SJIS")

# plot(統計テスト1,統計テスト2)
# plot(shidouhou$psych_test,統計テスト2)

共分散1と2 <- sum((統計テスト1-mean(統計テスト1)) * (統計テスト2-mean(統計テスト2))) / length(統計テスト1)
共分散1と2
cov(統計テスト1,統計テスト2) * (length(統計テスト1) - 1) / length(統計テスト1)

# 相関係数
cov(統計テスト1,統計テスト2)/(sd(統計テスト1)*sd(統計テスト2))
cor(統計テスト1,統計テスト2)

# 集計
table(shidouhou$math)
table(shidouhou$math,shidouhou$stat)

# ファイ係数(二値変数の相関係数)
数学イチゼロ <- ifelse(shidouhou$math=="好き",1,0)
統計イチゼロ <- ifelse(shidouhou$stat=="好き",1,0)
cor(数学イチゼロ,統計イチゼロ)
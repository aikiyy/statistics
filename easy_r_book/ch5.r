# 標準正規分布を用いた検定
# 平均値の検定・母分散は既知
# 帰無仮説μ=12
心理学テスト <- c(13,14,7,12,10,6,8,15,4,14,9,6,10,12,5,12,8,8,12,15)
Z分子 <- mean(心理学テスト)-12
Z分母 <- sqrt(10/length(心理学テスト))
Z統計量 <- Z分子/Z分母
Z統計量
p値 <- 2*pnorm(Z統計量)
p値

# t分布を用いた検定
# 平均値の検定・母分散は未知
t分子 <- mean(心理学テスト)-12
t分母 <- sqrt(var(心理学テスト)/length(心理学テスト))
t統計量 <- t分子/t分母
t統計量
p値 <- 2*pt(t統計量,19)
p値

# 相関係数の検定(無相関検定)
# 「母集団において相関が0である」
統計テスト1 <- c(6,10,6,10,5,3,5,9,3,3,11,6,11,9,7,5,8,7,7,9)
統計テスト2 <- c(10,13,8,15,8,6,9,10,7,3,18,14,18,11,12,5,7,12,7,7)
標本相関 <- cor(統計テスト1,統計テスト2)
t分子 <- 標本相関*sqrt(length(統計テスト1)-2)
t分母 <- sqrt(1-標本相関^2)
t統計量 <- t分子/t分母
t統計量
p値 <- 2*pt(t統計量,18,lower.tail=FALSE)
p値
cor.test(統計テスト1,統計テスト2)

# カイ二乗分布
curve(dchisq(x,2),0,20)
curve(dchisq(x,1),0,20,add=TRUE)
curve(dchisq(x,4),0,20,add=TRUE)
curve(dchisq(x,8),0,20,add=TRUE)

# 独立性の検定
期待度数イチイチ <- 12*14/20
期待度数ニイチ <- 12*6/20
期待度数イチニ <- 8*14/20
期待度数ニニ <- 8*6/20
期待度数 <- c(期待度数イチイチ,期待度数ニイチ,期待度数イチニ,期待度数ニニ)
観測度数 <- c(10,2,4,4)
カイ二乗要素 <- (観測度数-期待度数)^2/期待度数
カイ二乗要素
カイ二乗 <- sum(カイ二乗要素)
カイ二乗
qchisq(0.95,1)
qchisq(0.05,1)
pchisq(カイ二乗,1,lower.tail=FALSE)

shidouhou <- read.csv("easy_r_book/shidouhou.csv", fileEncoding = "SJIS")
クロス集計表 <- table(shidouhou$math,shidouhou$stat)
chisq.test(クロス集計表,correct=FALSE)

履修A <- matrix(c(16,12,4,8),2,2)
rownames(履修A) <- c('文系','理系')
colnames(履修A) <- c('履修した','履修しない')
chisq.test(履修A,correct=FALSE)
履修A <- matrix(c(160,120,40,80),2,2)
rownames(履修A) <- c('文系','理系')
colnames(履修A) <- c('履修した','履修しない')
chisq.test(履修A,correct=FALSE)
par(family= "HiraKakuProN-W3")

# oneway.test: 一元配置分散分析のみ実行可能
# aov: 最も一般的
# anova: 複数のモデルの比較など高度な分析に対応


# 一元配置分散分析(対応なし)
A <- c(15, 9, 18, 14, 18)
B <- c(13, 8, 8, 12, 7)
C <- c(10, 6, 11, 7, 12)
D <- c(10, 7, 3, 5, 7)
統計テスト2 <- c(A, B, C, D)
指導法 <- c(rep("A",5),rep("B",5),rep("C",5),rep("D",5))
指導法2 <- factor(指導法) # 文字型->要因型
oneway.test(統計テスト2~指導法2,var.equal=TRUE) # t検定や分散分析では分散の等質性が満たされていなくても結果にあまり影響しない
summary(aov(統計テスト2~指導法2))
anova(lm(統計テスト2~指導法2))

全データ <- cbind(A, B, C, D)
群平均 <- colMeans(全データ)
全平均 <- mean(全データ)
全平均行列 <- matrix(rep(全平均,20),nrow=5,ncol=4)
群平均行列 <- matrix(rep(群平均,5),nrow=5,ncol=4,byrow=TRUE)
全体 <- 全データ-全平均行列
群間 <- 群平均行列-全平均行列
郡内 <- 全データ-群平均行列
全体平方和 <- sum(全体^2)
群間平方和 <- sum(群間^2)
郡内平方和 <- sum(郡内^2) #全体平方和=群間平方和+郡内平方和
群間自由度 <- ncol(全データ)-1
郡内自由度 <- (nrow(全データ)-1)*ncol(全データ)
全体自由度 <- length(全データ)-1
群間平均平方 <- 群間平方和/群間自由度
郡内平均平方 <- 郡内平方和/郡内自由度
# 全データの不偏分散=全体平方和/全体自由度
F <- 群間平方和/郡内平方和
F

# 多重比較(Tukey法, どの群の間に差があるか)
q <- abs(mean(A)-mean(D))/sqrt(郡内平均平方/nrow(全データ))
# qtukey(下側確率,平均値の数,郡内の自由度):棄却域
qtukey(0.95,4,16)
TukeyHSD(aov(統計テスト2~指導法2))

# F分布
# 分子の自由度3, 分母の自由度16
curve(df(x,3,16),0,5)


# 一元配置分散分析(対応あり)
好意度 <- c(7,8,9,5,6,5,4,7,1,3,8,6,7,2,5)
科目 <- factor(c(rep("線形代数",5),rep("微分積分",5),rep("確率統計",5)))
人 <- factor(rep(c("田中","岸","大引","吉川","荻野"),3))
summary(aov(好意度~科目+人))

全データ <- matrix(好意度,nrow=5,ncol=3)
科目平均 <- colMeans(全データ)
人平均 <- rowMeans(全データ)
全平均 <- mean(全データ)
全平均行列 <- matrix(rep(全平均,15),nrow=5,ncol=3)
科目平均行列 <- matrix(rep(科目平均,5),nrow=5,ncol=3,byrow=TRUE)
人平均行列 <- matrix(rep(人平均,3),nrow=5,ncol=3)
全体 <- 全データ-全平均行列
条件 <- 科目平均行列-全平均行列
個人差 <- 人平均行列-全平均行列
残差 <- 全データ-全平均行列-条件-個人差
全体平方和 <- sum(全体^2)
条件平方和 <- sum(条件^2)
個人差平方和 <- sum(個人差^2)
残差平方和 <- sum(残差^2)


# 二元配置分散分析(対応なし)
味 <- c(6,4,5,3,2,10,8,10,8,9,11,12,12,10,10,5,4,2,2,2,7,6,5,4,3,12,8,5,6,4)
温度 <- factor(c(rep("冷蔵庫",15),rep("常温",15)))
銘柄 <- factor(rep(c(rep("イカアン",5),rep("ボスビッグ",5),rep("ビビッテル",5)),2))
summary(aov(味~温度*銘柄))
summary(aov(味~温度+銘柄+温度:銘柄))
interaction.plot(温度,銘柄,味)
interaction.plot(銘柄,温度,味)
score <- read.table(pipe("pbpaste"),header=TRUE)

# 切断効果
# データを切断すると相関係数が大きく下がる
cor(score$math[score$math<60],score$phys[score$math<60])


plot(airquality[,1:4])
# 共分散行列
iris_mat <- iris[,1:4]
cor(iris_mat)


# 問題3-1
x <- c(1,2,3,4)
barplot(x,names.arg=c("poor","not bad","good","very good"),
  xlab="feeling",ylab="population",border="dark blue")
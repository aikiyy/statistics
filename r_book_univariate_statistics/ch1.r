# str(iris)

boxplot(iris[,1:3])

# 最頻値
x <- c("Alice", "Bob", "Chris", "Alice", "Alice", "Chris")
names(which.max(table(x)))


# 問題1-2
x <- c(2, 5, 11, 7, 9)
mean(x) #算術平均
prod(x)^(1/length(x)) #幾何平均
1/mean(1/x) #調和平均
var(x) #不偏分散
sd(x) #不偏分散の平方根

# 問題1-3
x <- c(34, 56, 32, 15, 49)
sum(abs(x-mean(x)))/length(x) #平均偏差
sqrt(var(x)*(length(x)-1)/length(x)) #標準偏差

# 問題1-4
x <- c(65, 59, 62)
y <- c(500, 750, 690)
sum(x * y) / sum(y)

# 問題1-5
height <- c(171.8, 167.2, 180.9)
weight <- c(74.4, 56.3, 93.2)
weight/(height/100)^2

# 問題1-6
x <- c(3, 4, 8, 11, 7)
sd(x) #不偏分散の平方根
sqrt(sum((x-mean(x))^2)/length(x)) #標準偏差

# 問題1-8
hist(rnorm(100, 50, 10))

# 問題1-9
boxplot(rnorm(100, 50, 5), rnorm(100, 10, 10))

# 問題1-10
x <- rnorm(5, 170, 10)
y <- c(x, 500)
mean(y)
median(y)

# 問題1-11
mad(x)
mad(y)
sd(x)
sd(y)
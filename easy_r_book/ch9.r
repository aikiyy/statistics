指導法データ <- read.csv("easy_r_book/shidouhou.csv", fileEncoding = "SJIS")

for (i in 6:8) {
  print(mean(指導法データ[,i]))
}

plot(指導法データ$stat_test1,指導法データ$stat_test2)

# stringをintegerに割り当て
as.integer(指導法データ$math)
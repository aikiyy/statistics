脳データ <- read.csv("easy_r_book/animaldat.csv",header=TRUE)

plot(脳データ$Body_weight,脳データ$Brain_weight)
cor(脳データ$Body_weight,脳データ$Brain_weight)

条件1 <- 脳データ$Body_weight<80000
脳データ2 <- 脳データ[条件1,]
cor(脳データ2$Body_weight,脳データ2$Brain_weight)
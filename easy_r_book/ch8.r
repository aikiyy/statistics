veca <- 1:5
vecb <- seq(2, 10, 2)
veca%*%vecb

matrix(1:12,nrow=3,ncol=4)
matrix(1:12,nrow=3,ncol=4,byrow=TRUE) #行方向優先の割り当て

cbind(veca,vecb) #列ベクトルとして結合
rbind(veca,vecb) #縦ベクトルとして結合

mata <- matrix(1:6,nrow=2,ncol=3)
rownames(mata) <- c("row1","row2")
colnames(mata) <- c("col1","col2","col3")
t(mata) #転置

diag(c(1,2,3)) #対角行列
diag(3) #単位行列
solve(diag(c(1,2,3))) #逆行列
eigen(diag(c(1,2,3))) #固有値と固有ベクトル
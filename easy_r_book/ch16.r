set.seed(9999)
n <- 200
load_m <- matrix(c(0.09884, 0.17545, 0.52720, 0.73462,
0.45620, 0.72141, 0.47258, 0.17901, 0.07984, 0.37204), nrow=5)
uniq <- diag(sqrt(c(0.530201, 0.254119, 0.309986,
0.546036, 0.346539)))
factor_m <- matrix(rnorm(2*n), nrow=2)
uniq_m <- matrix(rnorm(5*n), nrow=5)
subjects <- round(t(load_m%*%factor_m + uniq%*%uniq_m)*10+50)
colnames(subjects) <- c("J", "S", "math", "sci", "E")

相関行列 <- cor(subjects)
相関行列

五教科因子分析 <- factanal(subjects,factors=2)
五教科因子分析
# p値が0.782->モデルとデータが有意に異なっていない->適合している
共通性 <- 1-五教科因子分析$uniquenesses
共通性
# 共通性の値が大きい=因子で説明できる部分が大きい
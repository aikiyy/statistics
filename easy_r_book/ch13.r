事前事後 <- read.csv("easy_r_book/prepost.csv",header=TRUE)

# 共分散分析
attach(事前事後)
summary(lm(post~pre+group))
# 統制群 post=-0.6433pre+58.5052
# 実験群 post=-0.6433pre+(58.5052+21.3574)
# p値が0.001114なので統計的に有意

summary(aov(post~pre+group))
# groupのp値が0.00111なので統計的に有意

summary(aov(post~pre*group))
# pre:group(共変量と群の交互作用)のp値が0.97874となり
# 「回帰係数が等質」=「回帰直線は平行」

事前事後$変化量 <- 事前事後$post-事前事後$pre
var.test(変化量~group) # 分散は等質である
t.test(変化量~group,var.equal=TRUE)
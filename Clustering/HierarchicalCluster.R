#这里主要基于iris数据，使用hclust()函数来说明层级聚类。

#随机选取40个样本记录，并删除变量Species
idx<-sample(1:dim(iris)[1],40)

irisSample<-iris[idx,]

irisSample$Species<-NULL

#层级聚类
hc<-hclust(dist(irisSample),method="ave")

plot(hc,hang=-1,labels=iris$Species[idx])

#与前面的k-均值聚类类似，在该图中，聚簇"setosa"能够很容易的从其他两个聚簇中分离。
#聚簇"versicolor"和"virginica"有小程度的覆盖。
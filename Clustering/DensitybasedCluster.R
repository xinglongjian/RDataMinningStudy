#fpc包中的DBSCAN提供了一个基于密度聚类的方法。
#基于密度聚类的思想是将稠密相当的对象划分为一个聚簇。
#在DBSCAN中需要两个关键参数
#1、eps:可达到的距离，定义了领域的大小
#2、MinPts:可达到的最小编号的点

#如果在点a领域的点的数目不小于MinPts,那么a就是一个密集点。其邻域的所有点
#都是从点a密度可达的，并将他们与点a归为一个聚簇。

#基于密度聚类的优势是他能够发现各种形状和大小的聚簇，以及对噪音不敏感
#与k-均值聚类比较，k-均值聚类具有球形形状和相似大小

library(fpc)
iris2<-iris[-5]
ds<-dbscan(iris2,eps=0.42,MinPts=5)
table(ds$cluster,iris$Species)
#上面表中，1到3表示发现的三个聚簇，而0表示噪音或离群点。下图中噪音使用黑色
#圆圈表示
plot(ds,iris2)

plot(ds,iris2[c(1,4)])

plotcluster(iris2,ds$cluster)

#对新数据贴标签
#上述的聚类模型可用于标签新数据，基于新对象和聚类之间的相似性，下面的例子包含
#iris数据中的10个对象并添加了小部分噪音作为新的数据集

set.seed(435)
#随机选取10行
idx<-sample(1:nrow(iris),10)
#删除选取数据的第5列
newData<-iris[idx,-5]

#使用runif()产生随机偏离
newData<-newData+matrix(runif(10*4,min=0,max=0.2),nrow=10,ncol=4)

#验证新数据
myPred<-predict(ds,iris2,newData)

#检测分配给新数据的标签
plot(iris2[c(1,4)],col=1+ds$cluster)
ds$cluster

#绘制新数据中生成的标签
points(newData[c(1,4)],pch="*",col=1+myPred,cex=3)

#查看新数据的频率
table(myPred,iris$Species[idx])

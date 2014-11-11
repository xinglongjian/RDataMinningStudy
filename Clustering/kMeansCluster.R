#基于iris数据显示k-means聚类方法
iris2<-iris

#从数据集中删除species变量
iris2$Species<-NULL

#对数据集iris2上应用kmeans()函数，并将聚类结果存储在kc变量中，聚类数设置为3
(kmeans.result<-kmeans(iris2,3))

#比较聚类结果中各组Species的数目
table(iris$Species,kmeans.result$cluster)

#从结果中可以看出，聚类“setosa”能够很容易的与其他聚类分开，而聚类"versicolor"和“virginica”
#与其他有小程度的覆盖

#下面绘制一下各个聚簇及他们的中心，数据中有4个维度，下面只绘制2个维度。在图形显示中一些黑点离绿色中心比离黑色中心更近。
#由于初始随机选择的聚类中心不同，k-均值聚类的结果每次运行都会不同。

plot(iris2[c("Sepal.Length","Sepal.Width")],col=kmeans.result$cluster)

#绘制中心点
points(kmeans.result$centers[,c("Sepal.Length","Sepal.Width")],col=1:3,pch=8,cex=2)





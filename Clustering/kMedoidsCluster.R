#这里主要介绍使用pam()和pamk()函数实现k-中心点聚类。k-中心点聚类与k-means聚类类似。
#不同是:当一个聚簇在k-均值算法由他的中心表示时，在k-中心点算法他是由离中心最近的对象表示。
#在有离群点存在时，k-中心点聚类比k-均值聚类更健壮。

#PAM(Partitioning Around Medoids)是k-中心点聚类的一个经典算法。当PAM算法在聚类大数据低效时，

#PAM的改进技术CLARA算法可以绘制多个样品数据，然后在每个样品数据上应用PAM算法，可以得到更好的聚类。

#cluster包中的pam()和clara()函数，是R中PAM算法和CLARA算法的实现。
#这两个算法，都需要用户指定k，聚类的数目。做为pam()的改进版本，fpc包中的pamk()函数不需要用户指定k。
#他通过调用pam()函数和clara()函数来执行围绕聚类中心点分片，通过最优平均轮廓宽度来估计聚类的数目。

#下面使用pam()和pamk()来查找聚簇。

library(fpc)
pamk.result<-pamk(iris2)

#聚类的属性
attributes(pamk.result)

#查看聚簇的数目
pamk.result$nc

#检查聚类结果中各Species的数目
table(pamk.result$pamobject$clustering,iris$Species)

#设置图形表格布局
layout(matrix(c(1,2),1,2))
#绘制聚类结果图形
plot(pamk.result$pamobject)
#返回布局设置
layout(matrix(1))

#上面例子中，pamk()产生了2个聚簇，一个是“setosa”,一个是“versicolor”和"virginica"
#的混合体。左图显示了2个维度的聚簇图，线显示了聚簇间的距离。右侧显示了他们的聚簇效果，
#大的si,比如接近1，表明观测变量具有很好的聚簇效果，小的si,比如接近0，意味着观测变量在
#两个聚簇之间，如果是负值，则很可能放在了错的聚簇里。上图中的平均Si分别为0.81和0.62,
#可以认为两个聚簇划分良好。

#下面使用pam()进行聚类，k设置为3
pam.result<-pam(iris2,3)

table(pam.result$clustering,iris$Species)

#设置布局
layout(matrix(c(1,2),1,2))
plot(pam.result)
layout(matrix(1))

#上面的结果使用pam()产生了3个聚簇，聚簇1是“setosa”，能够很好的从其他两个中分隔开。
#聚簇2主要由"versicolor"和一些“virginica”组成，聚簇3主要由“virginica”以及2个“versicolor”组成。

#上面的两种聚类技术，pamk()和pam()很难说哪个更好，依赖与目标问题、领域知识和经验。在这个例子中，
#pam()更好一点，因为他识别出了3个聚簇，与3个物种对应。



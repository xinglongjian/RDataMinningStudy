#单变量离群点检测
#这里显示了一个单变量离群点检测的例子，以及如何应用到多变量数据中。
#单变量离群点检测可通过函数boxplot.stats()实现，并产生一个统计的箱线图
#上述函数返回的结果中有一个out组件，该组件列出了离群点。更具体的说，他列出了
#超出胡须顶点的数据点。参数coef可以控制胡须超出箱线盒多远。

set.seed(3147)
x<-rnorm(100)

summary(x)

#离群点
boxplot.stats(x)

#查看离群点
boxplot.stats(x)$out

#箱线图显示
boxplot(x)

#上述的单变量离群点检测方法可以应用于多变量数据中，下面首先创建一个包含x和y两列的数据框df
#然后从x和y单独进行离群点检测。然后把都包含在两列中的离群点取出来，并以红色的+标识。

y<-rnorm(100)

df<-data.frame(x,y)

rm(x,y)

head(df)

attach(df)
#从x中查找离群点的索引
(a<-which(x %in% boxplot.stats(x)$out))

#从y中查找离群点的索引
(b<-which(y %in% boxplot.stats(y)$out))

detach(df)

#同时包含在x和y中的离群点,使用intersect()函数获取交叉部分
(outlier.list1<-intersect(a,b))
#绘图
plot(df)
points(df[outlier.list1,],col="red",pch="+",cex=2)

#同样，可以获取在x或者在y中的离群点
(outlier.list2<-union(a,b))

plot(df)
points(df[outlier.list2,],col="blue",pch="x",cex=1.5)

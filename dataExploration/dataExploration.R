#可以在R中显示对象的维度、结构和数据，可以以不同的图形进行展示，多变量的展示可以采用分组分布
#分组沙箱图、散点图和成对图，以及水平图、等高线图和三维图

#3.1了解一下数据----
#维度
dim(iris)

#变量名或列名
names(iris)

#结构
str(iris)

#属性
attributes(iris)

#获得前五行数据
iris[1:5,]

#获取头几个数据
head(iris)

#获取最后几个数据
tail(iris)


#获取Sepal.Length的前十行数据
iris[1:10,"Sepal.Length"]

iris$Sepal.Length[1:10]

#3.2展示独立的变量----
#各个变量汇总
summary(iris)

#各百分比
quantile(iris$Sepal.Length)

#频率
table(iris$Species)

#饼图
pie(table(iris$Species))


#Sepal.Length的方差
var(iris$Sepal.Length)

#柱状图
iris$Sepal.Length
hist(iris$Sepal.Length)

#密度图
density(iris$Sepal.Length)
plot(density(iris$Sepal.Length))

#3.3展示多个变量----
#两个变量的协方差
cov(iris$Sepal.Length,iris$Petal.Length)
cov(iris[,1:4])

#两个变量的相关性
cor(iris$Sepal.Length,iris$Petal.Length)
cor(iris[,1:4])


#子集的分布
#可以按种类分组显示变量Sepal.Length的概要统计
aggregate(iris$Sepal.Length~iris$Species,summary,data=iris)

#使用箱线图显示
boxplot(iris$Sepal.Length~iris$Species,data=iris)

#散点图显示
with(iris,plot(Sepal.Length,Sepal.Width,col=Species,pch=as.numeric(Species)))

#当有许多点时，会有很多点重叠，可以使用jitter()来添加小数量的噪音
plot(jitter(iris$Sepal.Length),jitter(iris$Sepal.Width))

#pairs图
pairs(iris)

#3.4更多展示----
#3D散点图 需要使用scatterplot3d包
library(scatterplot3d)
scatterplot3d(iris$Petal.Width,iris$Sepal.Length,iris$Sepal.Width)

#水平图，使用lattice包
library(lattice)
print(levelplot(iris$Petal.Width~iris$Sepal.Length*iris$Sepal.Width,iris,cuts=9,col.regions=grey.colors(10)[10:1]))

#等高线图
filled.contour(volcano,color=terrain.colors,asp=1,plot.axes=contour(volcano,add=T))

#三维表面
persp(volcano,theta=25,phi=30,expand=0.5,col="lightblue")

#交互式三维散点图
#需要使用rgl包
library(rgl)
plot3d(iris$Petal.Width,iris$Sepal.Length,iris$Sepal.Width)

#平行坐标
library(lattice)
parallelplot(~iris[1:4]|Species,data=iris)

#ggplot2包
#http://had.co.nz/ggplot2/
library(ggplot2)
qplot(Sepal.Length,Sepal.Width,data=iris,facets=Species ~ .)

#3.5保存图表到文件
pdf("dataExploration/mypdf.pdf")
x<-1:50
plot(x,log(x))
graphics.off()

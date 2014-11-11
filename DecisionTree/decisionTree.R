#关于决策树和随机森林的介绍----

#在R中有大量的包应用于决策树、回归树和随机森林，如rpart、rpartOrdinal、randomForest、
#party、tree、marginTree和maptree

#这里介绍使用party、rpart和randomForest如何建立预测模型。首先使用party包构建一个决策树，并利用
#构建的树进行分类，然后利用rpart包构建一个决策树，最后利用randomForest包训练随机森林模型。

#4.1利用party包构建决策树----
#还是使用iris数据集，使用party包中的ctree函数，Sepal.Length, Sepal.Width,Petal.Length and Petal.Width
#用来预测花的Species,在包中，ctree()函数用于构建一个决策树，predict()函数对没有标签的数据进行预测

#iris数据集被划分为两部分:70%训练集和30%测试集

#查看数据结构
str(iris)

#设置种子
set.seed(1234)

#取样
ind<-sample(2,nrow(iris),replace=T,prob=c(0.7,0.3))
trainData<-iris[ind==1,]
testData<-iris[ind==2,]

#加载party包，构建一个决策树
library(party)
myFormula<-Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width
iris_tree<-ctree(myFormula,data=trainData)

#检查预测,查看预测结果频率
predict(iris_tree)
table(predict(iris_tree),trainData$Species)

#打印规则
print(iris_tree)

#绘制图形
plot(iris_tree)
plot(iris_tree,type="simple")

#使用测试数据进行预测
testPred<-predict(iris_tree,newdata=testData)
table(testPred,testData$Species)

#问题:
#当前版本0.9-9995的ctree()不能处理缺失值，包含缺失值的实例有时会跑到左子树
#有时会跑到右子树上。

#另一个问题是:当一个变量在训练集中存在，并且也添加到ctree()函数中，但在构建的
#决策树上不显示，测试数据集也必须包含该变量来进行预测，否则，predict()调用就会失败。

#另外，如果测试数据集中变量层级与训练集中的不同，在测试数据集中进行预测也会失败
#一种可以解决上述问题的办法是：构建完决策树后，可以再次调用ctree()来构建一个新的
#决策树，使用第一个树中存在的变量。并设置与训练集中对应的变量级别。

#4.2利用rpart包构建决策树----
#利用bodyfat数据集，使用函数rpart()来构建一个决策树，具有最小预测误差，然后，
#可以利用predict()函数来对未标记的数据进行预测。

data("bodyfat",package="mboost")

#查看数据集的维度
dim(bodyfat)

#查看数据集的属性（行名、列名、类）
attributes(bodyfat)

#查看前五行数据
bodyfat[1:5,]

#将数据集划分为训练集和测试集
set.seed(1234)
ind<-sample(2,nrow(bodyfat),replace=T,prob=c(0.7,0.3))
bodyfat.train<-bodyfat[ind==1,]
bodyfat.test<-bodyfat[ind==2,]

#训练一个决策树
library(rpart)
myFormula<-DEXfat~age+waistcirc+hipcirc+elbowbreadth+kneebreadth
bodyfat_rpart<-rpart(myFormula,data=bodyfat.train,control=rpart.control(minsplit=10))

#查看属性
attributes(bodyfat_rpart)

#打印bodyfat_rpart的cptable属性
print(bodyfat_rpart$cptable)

#绘制决策树
plot(bodyfat_rpart)
#添加文本
text(bodyfat_rpart,use.n=T)

#使用which条件函数获取xerror的最小值的行索引
opt<-which.min(bodyfat_rpart$cptable[,"xerror"])
#获取最小值行的CP列值
cp<-bodyfat_rpart$cptable[opt,"CP"]

#根据“复杂性参数”cp，对bodyfat_rpart递归的修剪掉最不重要的分支，以获取一个最优子树。
bodyfat_prune<-prune(bodyfat_rpart,cp=cp)
print(bodyfat_prune)

#使用predict函数,基于构建的决策树，对测试数据进行预测
DEXfat_pred<-predict(bodyfat_prune,newdata=bodyfat.test)

#获取原始数据值的最小值和最大值范围
xlim<-range(bodyfat$DEXfat)

#绘制预测值与实际值的散点图，来说明预测准确性，
plot(DEXfat_pred~DEXfat,data=bodyfat.test,xlab="Observed",ylab="Predicted",ylim=xlim,xlim=xlim)
#在该图上添加截距为0，斜率为1的直线
abline(a=0,b=1)

#4.3随机森林----
#下面使用randomForest包，对iris数据构建一个预测模型。函数randomForest有两个限制:
#1、该函数不能处理带有缺失值的数据，在应用该函数之前需要补充缺失值。
#2、该函数限制分类属性的级别最大不能超过32，超过32级别的属性首先需要进行转换才能使用该函数。

#或者可以使用party包中的cforest函数，该函数没有最大级别限制。

#将iris数据划分为两部分:训练集(70%)和测试集(30%)

ind<-sample(2,nrow(iris),replace=T,prob=c(0.7,0.3))
trainData<-iris[ind==1,]
testData<-iris[ind==2,]

#load包
library(randomForest)
#构建一个随机森林
rf<-randomForest(Species ~ .,data=trainData,ntree=100,proximity=T)
print(rf)
#查看属性
attributes(rf)

#预测
predict(rf)
table(predict(rf),trainData$Species)

#绘图,显示树的数量与错误率的关系
plot(rf)

#变量重要性
importance(rf)
#绘制变量重要性散点图
varImpPlot(rf)

#使用构建的随机森林测试测试数据
irisPred<-predict(rf,newdata=testData)
table(irisPred,testData$Species)
#数据点的边距代表了分类的正确性，正的边距意味着正确的分类
plot(margin(rf,testData$Species))




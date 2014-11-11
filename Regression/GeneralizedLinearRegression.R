#GLM（广义线性模型）
#广义线性模型通过一个链接函数将响应变量与线性模型建立关联来概括线性回归，
#并允许每个测量的方差的大小是预测值的一个函数。它统一了其他统计模型，包括
#线性回归，logistic回归和泊松回归

#函数glm用于拟合广义线性模型，通过为线性预测通过一个象征性描述和误差分布的描述

#下面基于bodyfat数据集构建广义线性模型

data("bodyfat",package="mboost")

myFormula<-DEXfat ~ age+waistcirc+hipcirc+elbowbreadth+kneebreadth

bodyfat.glm<-glm(myFormula,family=gaussian("log"),data=bodyfat)

summary(bodyfat.glm)

#进行预测，type标识预测类型，默认为线性预测，可选项response，是对响应变量
pred<-predict(bodyfat.glm,type="response")

plot(bodyfat$DEXfat,pred,xlab="观测值",ylab="预测值")

#如果将family设置为gaussian("identity")，则结果与线性回归类似。如果设置
#binomial("logit")则是logistic回归。





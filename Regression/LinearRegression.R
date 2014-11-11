#回归分析是建立一个独立变量的函数(也称为预测)预测因变量(也称为响应)。
#例如，银行根据客户的年龄、收入、费用、职业、家属人数、总的信贷额度来评估
#他们房贷的风险。

#这里主要介绍一些基本概念和通过几个例子展示各种回归技术。
#首先通过一个例子构建一个回归模型来预测CPI数据。
#然后介绍Logistic回归分析
#在简短的介绍完非线性回归后，介绍广义线性模型(GLM)

#5.1线性回归----
#线性回归是用一个线性函数来预测响应，如下：
#  y=c0+c1x1+c2x2+...+ckxk.
#x1,x2,...,xk是预测变量，y是响应变量。

#使用lm函数来实现线性回归预测。
#下面使用模拟的CPI数据进行回归测试

#CPI数据
cpi<-c(162.2,164.6,166.5,166.0,166.2,167.0,168.6,169.5,171.0,172.1,173.3,174.0)
#年份,使用rep()函数，每个重复4次
year<-rep(2008:2010,each=4)
#季度,使用rep()函数，共重复3次
quarter<-rep(1:4,3)

#绘制cpi散点图
plot(cpi,xaxt="n",ylab="CPI",xlab="")
#绘制x坐标轴
axis(1,labels=paste(year,quarter,sep="Q"),at=1:12,las=3)

#检查cpi与变量year和quarter的相关性
cor(year,cpi) # 0.9096316
cor(quarter,cpi) # 0.3738028

#基于以上数据构建一个线性回归模型，使用year和quarter作为预测变量，cpi作为响应变量.
fit<-lm(cpi~year+quarter)
print(fit)

#基于以上的数据模型，cpi的计算公式是
#        cpi=c0+c1*year+c2*quarter
#而c0、c1和c2与fit模型的Coefficients有关，可以使用这个模型来计算2011年的CPI,计算如下:
cpi2011<-fit$coefficients[[1]]+fit$coefficients[[2]]*2011+fit$coefficients[[3]]*(1:4)

#该模型的属性
attributes(fit)

#查看一下系数
fit$coefficients

#观测值和拟合值的差异,使用residuals()函数
#residuals()函数从建模函数返回的对象中抽取模型残差。
residuals(fit)

#fit的概要信息
summary(fit)

#查看模型图，共4个
plot(fit)

#下面使用predict()函数对2011年的cpi进行预测
data2011<-data.frame(year=2011,quarter=1:4)
cpi2011<-predict(fit,newdata=data2011)
style<-c(rep(1,12),rep(2,4))
plot(c(cpi,cpi2011),xaxt="n",ylab="CPI",xlab="",pch=style,col=style)
axis(1,at=1:16,las=3,labels=c(paste(year,quarter,sep="Q"),"2011Q1","2011Q2","2011Q3","2011Q4"))


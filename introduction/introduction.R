#这里主要介绍如何使用R进行data mining.
#这里介绍一些数据挖掘的基本概念和技术，包括数据挖掘过程和常用的数据挖掘技术，
#如聚类，分类和关联规则。也展示了用于数据挖掘的R及其包，函数，任务视图。最后
#介绍了用到的数据集
#1.1数据挖掘-----
#用于数据挖掘的主要技术是:
#聚类（Clustering）
#分类(Classification)
#关联规则(Association Rules)
#序列模式（Sequential Patterns）
#时序分析（Time Series Analysis）
#文本挖掘(Text Mining)

#1.2.1用于数据挖掘的包和函数
#下面罗列了用于数据挖掘的R包和函数，一些并不是数据挖掘特有的，但是对于数据挖掘很有用。
#1.2.1.1聚类----
#包
  #fpc
  #cluster
  #pvclust
  #mclust
#基于分片的聚类:kmeans、pam、pamk、clara
#层次聚类:hclust、pvclust、agnes、diana
#基于模型的聚类：mclust
#基于密度的聚类:dbscan
#绘制集群解决方案:plotcluster、plot、hclust
#验证集群解决方案:cluster.stats

#1.2.1.2分类----
#包
  #rpart
  #party
  #randomForest
  #rpartOrdinal
  #tree
  #marginTree
  #maptree
  #survival
#决策树：rpart,ctree
#随机森林:cforest,randomForest
#回归，logistic回归，泊松回归：glm,predict,residuals
#生存分析：survfit,survdiff,coxph

#1.2.1.3关联规则和频繁项集----
#包
  #arules
  #drm
#APRIORI算法:apriori,drm
#ECLAT算法：eclat

#1.2.1.4序列模型----
#包
  #arulesSequences
#SPADE算法：cSPADE
#1.2.1.5时序----
#包
  #timsac
#构造时序序列:ts
#分解:decomp,decompose,stl,tsr
#1.2.1.6统计----
#包
  #base R
  #nlme
#变量分析：aov,anova
#密度分析：density
#统计测试：t.test,prop.test,anova,aov
#线性混合效应模型拟合：lme
#主成分和因子分析：princomp
#1.2.1.7图形----
#bar图：barplot
#pie图：pie
#散点图:dotchart
#柱状图:hist
#密度图:densityplot
#箱线图:boxplot
#qq图:qqnorm,qqnplot,qqline
#双变量图:coplot
#树:rpart
#平行坐标:parallel,paracoor,parcoord
#热点、轮廓:contour,filled,contour
#其他图:stripplot,sunflowerplot,interaction.plot,matplot,fourfoldplot,
#assocplot,mosaicplot
#保存图形格式:pdf,postscript,win.metafile,jpeg,bmp,png
#1.2.1.8数据管理----
#缺失值:na.omit
#标准化变量:scale
#转换:t
#样例:sample
#栈:stack，unstack
#其他:aggregate,merge,reshape

#1.2.1.9WEKA----
#RWeka

#1.3数据集----
#1.3.1Iris数据集----
str(iris)
#1.3.2mboost包中的Bodyfat数据集----
data("bodyfat",package="mboost")

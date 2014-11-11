#Logistic回归通过数据拟合一条logistic曲线来预测某一事件发送的概率。
#http://www.ats.ucla.edu/stat/r/dae/logit.htm
#http://nlp.stanford.edu/~manning/courses/ling289/logistic.pdf

#Logistic回归，也称为logit模型，用于模拟二元结果变量。
#Logistic回归-ucla-----
#参考http://www.ats.ucla.edu/stat/r/dae/logit.htm
#这里主要展示如何使用各种数据分析命令，不包括数据清理和检查，验证假设，模型诊断和
#潜在的后续分析

#例子:研究人员通过对变量，GRE(美国研究生入学考试成绩)、GPA(平均成绩)和未毕业院校的威望
#来对是否能进入研究所进行预测，结果变量：让进或不让进，是一个二元变量。

#查看一下数据集----
#可通过url直接访问
mydata<-read.csv("http://www.ats.ucla.edu/stat/data/binary.csv");

#或直接访问本地文件
mydata<-read.csv("Regression/binary.csv")

#该数据集有一个二元响应变量“admit”,三个预测变量"gre","gpa","rank"。
#gre和gpa为连续值变量，rank为4个值。
#使用summary函数对该数据展示基本的描述
#可以使用sapply函数，调用sd函数获取标准差。



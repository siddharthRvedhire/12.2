#Assignment12.2_Session12

#Problem 1
#1. Use the given link Data Set.
#Answer the below questions:
#  a. What are the assumptions of ANOVA, test it out?
#  b. Why ANOVA test? Is there any other way to answer the above question?

#Answer 1
#****Note****
#using salescity dataset

#a
#the assumptions of ANOVA

#The populations have the same variance. This assumption is called the 
#assumption of homogeneity of variance.

#The populations are normally distributed.

#Each value is sampled independently from each other value. 
#This assumption requires that each subject provide only one value.
#If a subject provides two scores, then the values are not independent. 

#Independence of observations. This is mostly a study design issue and, as such, you will need to determine whether you believe it is possible that your observations are 
#not independent based on your study design (e.g., group work/families/etc)

#we can do anova testing here in dataset salescity

resultss<- aov(sales~city ,data= salescity)
summary(resultss)

#as we can see p value is <0.05 we will reject the Ho and accept the Ha
#which says that aleast one city sales is different 

#Check the normality assumption and linearity
#The normal probability plot of sales is used to check the assumption that the sales are normally distributed. 
#It should approximately follow a straight line.

qqnorm(salescity$sales)
qqline(salescity$sales)

#As all the points fall approximately along this reference line, we can assume normality.

#checking the normality distribution
hist(salescity$sales ,xlab = "sales", ylab = "frequency",main="histogram of salescity",col="red")

#Check the homogeneity of variance assumption
library(car)

#around median by default
leveneTest(sales~city,data = salescity)

#check around mean too
leveneTest(sales~city,data=salescity, center = mean)

#From the output above we can see that the p-value is not less than the significance level of 0.05. This means that there is no evidence to suggest 
#that the variance across cities is statistically significantly different. 
#Therefore, we can assume the homogeneity of variances in the different treatment cities

boxplot(sales~city,data= salescity,main="sales versus city",xlab="city",ylab="sales",col=topo.colors(4))

#or 
ggplot(salescity, aes(x = city, y = sales)) +
  geom_boxplot() +
  ggtitle("Number of sales by different cities")

#keep in mind that visualizing variance provides indications rather 
#than statistical confirmation of homogeneity (or heterogeneity).


#b
#The one-way analysis of variance (ANOVA) is used to determine whether there are any statistically significant 
#differences between the means of three or more independent (unrelated) groups

#The one-way ANOVA compares the means between the groups you are interested in and determines whether 
#any of those means are statistically significantly different from each other

#In the situation where there multiple response variables you can test them simultaneously using a 
#multivariate analysis of variance (MANOVA)

#As in salescity dataset we see that our categorical variables has more than 2 levels hence we are using 
#anova t test ,otherwise if our independent variables that is city here in salescity dataset
#has got only 2 levels than we used "independent sample t test

#Thus we can use independent sample t test also if our independent variables has got only 2 levels

#the other ways for testing which we can used are by plotting 
#histogram
#scatterplot
#box plot
#qq plot

#by this too
#Levene's test
#Fligner Killeen test
#Bartlett's tes

qqnorm(salescity$sales)
qqline(salescity$sales)

hist(salescity$sales ,xlab = "sales", ylab = "frequency",main="histogram of salescity",col="red")

boxplot(sales~city,data= salescity,main="sales versus city",xlab="city",ylab="sales",col=topo.colors(4))


library(MASS)
library(ISLR)

?Boston

lm.fit = lm(medv~lstat, data=Boston)
lm.fit

summary(lm.fit)

cor(Boston)
library(corrplot)
corrplot(cor(Boston))

?corrplot
?Boston
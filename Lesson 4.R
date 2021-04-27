library(MASS)
library(ISLR)

?Boston
summary(Boston)
plot(Boston)
plot(medv~lstat, Boston)
pairs(~medv + ptratio + lstat + dis,
      data = Boston, main = "Boston Dataset")
fitsimplelin = lm(medv~lstat, data = Boston)
summary(fitsimplelin)
lm.fit2 = lm(medv~., data = Boston)
summary(lm.fit2)

library(tibble)
as_tibble(Boston)

tibble(x = 1:5, y = 1, z = x ^ 2 + y)

tribble( ~x, ~y, ~z,
         "a", 2, 1,
         "b", 1, 7)
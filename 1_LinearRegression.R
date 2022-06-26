
# Linear regression: how to treat log operation.

x <- seq(0.1,5,length.out = 100)
set.seed(1)
e <- rnorm(100, mean = 0, sd = )

hist(e)
hist(exp(e))

y <- exp(1.2 + 0.2 * x + e)

plot(x, y)
hist(y)
plot(x, log(y))
hist(log(y))

lm1 <- lm(log(y) ~ x)
summary(lm1)

lm2 <- lm(y ~ x)
summary(lm2)


# ---------------- Linear regression exercises.

#---------------- Simple linear regression.
library(MASS)
library(ISLR2)
library(car)

head(Boston)
?Bostonn

attach(Boston)

plot(medv, lstat)

#--- Simple linear regression.
model = lm(medv ??? lstat, data = Boston)
# Vi è una relazione significativa (p-value beta_1) non troppo importante (R^2 non troppo alto).
summary(model)
coef(model)
confint(model)

# Previsioni con un intervallo di previsione o un intervallo di confidenza.
# prediction intervals refers to where the values could occur, while the confidence interval
# defines uncertainty around the mean value. They are centered around the same point
# but with different ranges . 
predict(model, data.frame(lstat = (c(5, 10, 15))), interval = 'confidence')
predict(model, data.frame(lstat = (c(5, 10, 15))), interval = 'prediction')

plot(medv, lstat)
abline(model)

# Diagnstic residuals.
# Linearità: dai residui si osserva che vi è una componente non lienare da tenere in considerazione.
# Correlazione (indipendenza): non sembra esserci correlazione.
# Heterosk. seems not to be a problem here.
# Normalità residui: QQ plot. Non sembrano essere normali. 
# Outliers, leverage points: Cook's distance express how much the i-th point effect the total result. Some points have high values of Cook's distance.
# Multicollinearit: meaningless.
# par (mfrow = c(2, 2))
plot(model)

# Residuals.
residuals(model)
rstudent(model)

#---------------- Multiple linear regression.
model2 <- lm(medv ??? lstat + age , data = Boston)
summary(model2)

model3 <- lm(medv ??? ., data = Boston)
summary(model3)
vif(model3)

model4 <- lm(medv ??? . - age - indus, data = Boston)
summary(model4)

# interraction terms.
model5 <- lm(medv ???  lstat * age, data = Boston)
summary(model5)

# non linear terms.
model6 <- lm(medv ??? lstat + I(lstat^2))
summary(model6)

# Anova function test if one model is better than the other (the one with less info in the row).
# It tests of the residual sum is lower.
anova(model, model6)

# non linear terms.
model7 <- lm(medv ??? lstat + I(lstat^2) + I(lstat^3))
summary(model7)

# Aumentando i df, R^2 aumenta ma alcune variabili diventano non significative.
for (i in c(1,2,3,4,5,6,7,8,9,10)) {
  model_poly = summary(lm(formula = medv ??? poly(lstat , i)))
  # print(model_poly)
  print(model_poly$r.sq)
}










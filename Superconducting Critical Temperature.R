rm(list = ls())
ls()
Train <- read.csv("C:\\Users\\colli\\OneDrive\\Documents\\train.csv")
Unique_m <- read.csv("C:\\Users\\colli\\OneDrive\\Documents\\unique_m.csv")
summary(Train)

#Merge Data sets together to keep critical temp variable##
##and all variables used for the chemical formula#

df<- merge(Train[ , "critical_temp"], Unique_m,
           by = 'row.names', all = TRUE)
df <- subset(df, select = -c(1,90))

#Split data into training and testing data#

set.seed(941)
filterds <- sample(
  x = c("train","test"),
  size = nrow(Train),
  replace = TRUE,
  prob = c(0.7,0.3)
)
part <- split(
  x = Train,
  f = filterds
)
head(part$train,2)
q <- as.data.frame(part$train)
l <- as.data.frame(part$test)

#Create linear regression model#
lm3 <- lm(critical_temp ~ ., data = q)
sm3<-summary(lm3)
Predicted <- predict(lm3, newdata = l)
rmse <- sqrt(mean((l$critical_temp - Predicted)^2))

#Plot Residuals#
res <- resid(lm3)
qqnorm(res)

#Perform stepwise to find best model#
just <- lm(critical_temp ~ 1, data = q)
all <- lm(critical_temp ~ ., data = q)
forward <- step(just, direction = 'both', scope = formula(all), trace=0)
#Plot Fitted vs risiduals#
plot(lm(critical_temp ~ ., data = q))

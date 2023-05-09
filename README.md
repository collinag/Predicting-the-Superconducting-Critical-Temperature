# Predicting-the-Superconducting-Critical-Temperature
In this project, a linear regression model will be estimated to predict the superconducting critical temperature based on features which were extracted from the superconductor’s chemical formula. 

# Data

The two datasets, train.csv and unique_m.csv will be used to conduct this project. The dataset train.csv contains 81 features extracted from 21,263 different superconductors as well as an 82nd column containing the critical temperatures. Unique_m.csv contains 88 variables that are all the different chemicals that make up the superconductor chemical formula. To begin, the critical temperature variable is merged from the train.csv dataset into the unique_m.csv dataset in order to predict the temperature based off of the broken up chemical formula. Next, the unique_m data is split into a training and testing set where seventy percent of the data is put into the training set and thirty percent of the data is put into the testing set. 

# Model Building

I will make a linear regression model based on the training data that we have taken from the train.csv dataset. This model gives an adjusted R-squared value of 0.731. Plotting the residuals vs the fitted values gives the following plot,

![image](https://user-images.githubusercontent.com/50085554/236976030-4079f1ce-dbeb-4225-ad71-e6732d33026a.png)

In this plot, the red line represents the line of best fit determined by our linear regression model. This tends to folllow the data however our data increases in variance as the number of critical_temp values increases. Now, by plotting the residual QQ Plot below, it can be noted that the residuals seem to be slightly right skewed.

![image](https://user-images.githubusercontent.com/50085554/236976578-05bb0427-c8f6-4419-a737-c98a7ee7a6ad.png)

Finally, stepwise regression is used to determine if there is a better model to be made by dropping any variables. Stepwise regression showed us that no variables need to be dropped from the model and it can finalize that this is the best model.



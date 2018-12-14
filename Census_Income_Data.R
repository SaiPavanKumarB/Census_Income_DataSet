# Sri Census Income Data Analysis

# Set the working directory
install.packages("xlsx")
library("xlsx")
library("ggplot2")
library("gdata")
setwd("D:./Sri_DataScience_Practice/Sri_UCI_ML_Census_Income_Data")

# Load the train & test data sets

train = read.csv("Census_train.csv")
test = read.xlsx2("Sri_UCI_ML_Census_Income_Data_Test.xlsx", sheetIndex = 1)

# Check for data imbalance
str(train)

unique(train$Outcome)
ggplot(data.frame(train$Outcome), aes(x=train$Outcome), colour = "dark red")+geom_bar(stat = "count") 

# Remove that 1 row with blank in the outcome variable
train_1 = train[which(train$Outcome!=""),]
NROW(train_1)
ggplot(data.frame(train_1$Outcome), aes(x=train_1$Outcome), colour = "dark red")+geom_bar(stat = "count") 

# Analyze each column

# Age
NROW(train_1[is.na(train_1$age),])
NROW(train_1[which(train_1$age==0),])
hist(train_1$age, labels = TRUE, breaks = 20, xlim = c(0,100), main = "Age Distribution", xlab = "Age", ylab = 'Frequency', col = "orange")
boxplot(train_1$age, main = "Boxplot for Age", horizontal = TRUE, col = "orange",xlab = "Age", ylab = "count")

#Workclass
unique(train_1$workclass) # ? observed
NROW(train_1[which(trim(train_1$workclass)=="?"),])
ggplot(train_1, aes(x=train_1$workclass), color = "orange")+geom_bar(stat = "count")

#fnlwgt
boxplot(train_1$fnlwgt, main = "FnlWgt", horizontal = TRUE, col = "yellowgreen", ylab = "FnlWgt")
hist(train_1$fnlwgt, labels = TRUE, col = "yellowgreen", main = "FblWgt Distribution", xlab = 'FnlWgt')
NROW(train_1[which(train_1$fnlwgt==0),])






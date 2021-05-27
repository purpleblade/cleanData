# Load and examine data
library(httr)
train <- read.table("./ucihar/train/X_train.txt", fill=TRUE)
test <- read.table("./ucihar/test/X_test.txt", fill=TRUE)
str(test)
str(train)
trainActivities <- read.table("./ucihar/train/Y_train.txt")
testActivities <- read.table("./ucihar/test/Y_test.txt")
trainPpl <- read.table("./ucihar/train/subject_train.txt")
testPpl <- read.table("./ucihar/test/subject_test.txt") 
features <- read.table("./ucihar/features.txt") # variable names for test and train

# Set descriptive variable names
names(train) <-make.names(features[,2],unique=TRUE) 
names(test) <- make.names(features[,2],unique=TRUE)
names(trainPpl) <- "subject"
names(testPpl) <- "subject"
names(trainActivities) <- "activity"
names(testActivities) <- "activity"

# Add the subjects and activities to the test and train data sets
test <- cbind(testPpl,testActivities,test)
train <- cbind(trainPpl,trainActivities,train)

# Merge the 2 sets
all<- rbind(test,train)

# Extract means and standard deviations
library(dplyr)
meanStd <- select(all,contains("mean")|contains("std"))
meanStd


# Rename the activity values to be descriptive
all$activity <- recode(all$activity,"1"="Walking","2"="Walking Upstairs",
     "3"="Walking Downstairs", "4"="Sitting", "5"="Standing","6"="Laying")

# Average by activity and subject
actSub <- group_by(all,activity,subject)
summarized <- actSub %>% mutate(across(1:561,mean,.names = "mean {.col}"),
                         .keep="unused")
summarized


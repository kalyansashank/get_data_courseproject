## Download the zip file containing the samsung data and extract the 
## "UCI HAR Dataset" directory to working directory.
## This code can run as long as the Samsung data is in your working directory.

# If not already done, install the dplyr package.
library(dplyr)
act_lab <- read.table("UCI HAR Dataset/activity_labels.txt")
lev <- act_lab[[1]]
lab <- as.vector(act_lab[[2]])
features <- read.table("UCI HAR Dataset/features.txt")
feat <- as.vector(features[[2]])

## Making test data set.
test_actlab <- read.table("UCI HAR Dataset/test/y_test.txt",
                          col.names = "Activity", colClasses = "factor")
test_actlab <-transform(test_actlab, Activity = factor(Activity, levels = lev, 
                                                       labels = lab))
test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt",
                       col.names = "Subject")
test_feat <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = feat)
test_data <- cbind(test_sub,test_actlab,test_feat)

## Making training data set.
train_actlab <- read.table("UCI HAR Dataset/train/y_train.txt",
                          col.names = "Activity", colClasses = "factor")
train_actlab <-transform(train_actlab, Activity = factor(Activity, levels = lev, 
                                                         labels = lab))
train_sub <- read.table("UCI HAR Dataset/train/subject_train.txt",
                       col.names = "Subject")
train_feat <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = feat)
train_data <- cbind(train_sub,train_actlab,train_feat)

## Merging test and training data sets.
merge_data <- rbind(test_data, train_data)
merge_data <- arrange(merge_data, Subject, Activity)

## Extracting only the measurements on the mean and standard deviation for each 
## measurement. "meanfreq()" measurements are not taken into account. 
select_feat <- lapply(c("mean()","std()"), function(x){feat[grep(x, feat,
                                                                 fixed = T)]})
select_feat <- c(select_feat[[1]],select_feat[[2]])
idx <- feat %in% select_feat # create index of required features.
idx <- c(TRUE,TRUE, idx)     # add two TRUES at the start for Suject and Activity
select_data <- merge_data[,idx]

## Changing variable names to be more descriptive.
colnames(select_data) <- sub("^t","time-", names(select_data))
colnames(select_data) <- sub("^f","frequency-", names(select_data))
colnames(select_data) <- sub("BodyBody","Body", names(select_data))
colnames(select_data) <- sub("Body","body-", names(select_data))
colnames(select_data) <- sub("Gravity","gravity-", names(select_data))
colnames(select_data) <- sub("Acc","accelerometer-", names(select_data))
colnames(select_data) <- sub("Gyro","gyroscope-", names(select_data))
colnames(select_data) <- sub("Jerk","jerk-", names(select_data))
colnames(select_data) <- sub("Mag","magnitude-", names(select_data))
colnames(select_data) <- sub(".mean..","mean", names(select_data))
colnames(select_data) <- sub(".std..","standard_deviation", names(select_data))
colnames(select_data) <- sub(".","-", names(select_data), fixed = T)
## Tidy data set required upto step 4 of Course project guidelines is in select_data

## Independent tidy data set with the average of each variable for each activity
## and each subject.
tidy_data <- select_data %>% group_by(Subject, Activity) %>%
      summarise_each(funs(mean))
## Writing the tidy data to a text file.
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)
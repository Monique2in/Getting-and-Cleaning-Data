## Step One: Merges the training and test sets to create one data set.
## setwd("./UCI HAR Dataset")
## Load training data set and labels
trainData <- read.table("./train/X_train.txt")
trainLabel <- read.table("./train/y_train.txt")
trainSubject <- read.table("./train/subject_train.txt")
## Load test data set and labels
testData <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/y_test.txt")
testSubject <- read.table("./test/subject_test.txt")
## Merge data sets
mergeData <- rbind(trainData, testData)
mergeLabel <- rbind(trainLabel, testLabel)
mergeSubject <- rbind(trainSubject, testSubject)

## Step Two: Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./features.txt")
## Choose only features that measure mean or standard deviation (std). 
selectedFeatures <- (grep("-mean\\(\\)|-std\\(\\)", features[, 2]))
data <- mergeData[, selectedFeatures]

## Step Three: Uses descriptive activity names to name the activities in the data set.
activities1 <- read.table("activity_labels.txt")
## Replace activities labels with the descriptive activity names.
mergeLabel[,1] <- activities1[mergeLabel[,1], 2]
## Clean activity labels to lower case and remove underscores
mergeLabel[,1] <- gsub("_", " ", tolower(as.character(mergeLabel[,1])))

## Step Four: Appropriately labels the data set with descriptive variable names.
## Name data set according to appropriate feature, and clean names.
names(data) <- gsub("\\(\\)", "", features[selectedFeatures, 2])
names(data) <- gsub("-", " ", names(data))
names(data) <- gsub("mean", "Mean", names(data))
names(data) <- gsub("std", "Std", names(data))
names(mergeSubject) <- "Subject"
names(mergeLabel) <- "Activity"
## Combine data set with subject and activity labels
cleanedData <- cbind(mergeSubject, mergeLabel, data)
## Write out the first data set to a text file
write.table(cleanedData, "merged_data.txt")

## Step Five: From the data in Step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
library(reshape2)
id_vars <- c("Activity", "Subject")
measure_vars <- setdiff(colnames(cleanedData), id_vars)
melted.data <- melt(cleanedData, id=id_vars, measures.vars=measure_vars)
tidy.data <- dcast(melted.data, Activity + Subject ~ variable, mean)
write.table(tidy.data, "averages_data_final.txt")
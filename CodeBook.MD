===
CodeBook.md
===

This codebook describes the variables, the data, and any transformations and work that was performed to clean up the data. 

The data was obtained from this site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data utilized for this project can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The run_analysis.R script performs the following steps to clean the data:  
1. Reads X_train.txt, y_train.txt and subject_train.txt and stores them in trainData, trainLabel and trainSubject variables respectively.  
2. Reads X_test.txt, y_test.txt and subject_test.txt and stores them in testData, testLabel and testSubject variables respectively.  
3. Merges the training and test data into mergeData, mergeLabel and mergeSubject variables.  
4. Reads features.txt and selects only features which include an observation Mean (mean) or Standard Deviation (std).   
5. Labels activities with with descriptive labels found in activity_labels.txt  
6. Cleans data names to readable variable descriptors.  
7. Merges data with Subject and Activity labels.  
8. Writes the clean data to a text file merged_data.txt  
9. Uses reshape2 library and melt function to clean data by Activity and Subject labels.  
10. Uses dcast function to cast molten data frame into a data frame.  
11. Writes tidy data to text file averages_data_final.txt  
=> Outcome: Creates a data frame that displats the average for each selected features broken down by each Subject for each Activity.

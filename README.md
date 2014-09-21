Getting and Cleaning Data
=========================

Getting and Cleaning Data Course Project

The purpose of this project is to collect, work with and clean a data set related to wearable computing.

Access the data here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Unzip the data into a folder named "UCI HAR Dataset". 
Set UCI HAR Dataset as the current working directory.
Place the r script run_analysis.R in the working directory.

Use source(run_analysis.R) in R.
Two output files will be generated in the working directory:
    ///merged_data.txt : contains a data frame with selected data for features pertaining to mean and standard deviation.
    averages_data_final.txt: contains a data frame with averages for features sorted by Activity and Subject.
Read the file into R using 
  data <- read.table("averages_data_final.txt") 
  head(data) ## To view the first few rows
In order to obtain the average of each variable for each activity and each subject, 
the data frame contains 180 rows (6 activities * 30 subjects) and 66 columns representing 
all selected features.

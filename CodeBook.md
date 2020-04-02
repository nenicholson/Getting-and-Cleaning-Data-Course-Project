---
title: "CodeBook"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Data set

This table contains the average of each variable for each activity and each subject from the Human Activity Recognition Using Smartphones Dataset.

## Variables

The activity column describes the activity the subject was doing at the time data was recorded: Walking, walking upstairs, walking downstairs, sitting, standing, or laying. 

The subject column is the subject's number.

All other column variables are averages taken from the processed accelerometer and gyroscope data:

### Types of measurements (separate variables for X Y and Z):

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

### Set of variables for each measurement: 

mean(): Mean value  
std(): Standard deviation  



---
title: "Code Book"
output: 
      html_document: 
            keep_md: true
---




## Data processing
The whole processing code is in "run_analysis.R". It requires 2 packages to be installed first: *data.table* and *magrittr*. Mean and std measurement variables are selected by regular expressions: any original variable that had "mean()" or "std()" had been put in clean data sets. In addition to measures new datasets have up to 3 new variables subject, activity type and sample(train/test) variables.



## Files
It doesn't seam clear to me if mean summary in last part of assigment should be calculated for every activity per subject(nested) or mean summaries for each group by itself are required.
So I've caculated both.
By default lets stick with nested summary.


* clean_data.csv - data for means and standard deviations for every case  
* clean_data_means.csv - summarized clean_data.csv with means calculated for every activity for each subject 
* clean_data_subject_means.csv - summarized clean_data.csv with means calculated for each subject
* clean_data_activity_means.csv - summarized clean_data.csv with means calculated for every activity type

## Features

This code book is mostly repeats original with some additions. All new things are described in **New** section. Older things are mentioned in **Old** section.



### New
Current repo contains 4 files: clean_data.csv, clean_data_means.csv, clean_data_activity_means.csv and clean_data_subject_means.csv. In addition to old variables they have new ones: activity, sample, subject. For obvious reasons last 2 files don't have either activity or subject variable.


* activity - labeled original y variable containing info about activity type
* subject - subjects number
* sample - variable showing from which sample(train/test) measurements are


### Old

Notes:  
* Features are normalized and bounded within [-1,1].
* Each feature vector is a column on the csv file.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  

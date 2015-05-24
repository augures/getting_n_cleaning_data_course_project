==================================================================
Tidy dataset for Human Activity Recognition Using Smartphones Dataset (prepared as per requirements of "Getting and Cleaning Data" Coursera course version 14)
==================================================================

Human Activity Recognition Using Smartphones Dataset is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
A full description is avalable at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

A short excerpt from this dataset README.md file, giving an overview of the purpose and experimental design:

<cite>
	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.<br/><br/>
	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
</cite>


Tidy dataset structure
======================

A tidy dataset is prepared as described in README.md file, and saved as UCI_HAR_tidy_dataset.txt file.
This is CSV file (extension "txt" is used as course submission form doesn't accept files with extension "csv")

Data from training and test subsets of original dataset are combined together.

- subject: Integer in a range 1:30 representing a numeric code of participant (corresponds).
- activity: Name of the activity performed by subject. One of the following (corresponds to activity_labels.txt file from original dataset):
	- LAYING
	- SITTING
	- STANDING
	- WALKING
	- WALKING_DOWNSTAIRS
	- WALKING_UPSTAIRS
	
Subsequent 66 columns are constructed in the following manner.

An excerpt from "features_info.txt" file from original dataset describes how original column names were constructed:

<cite>
	The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. <br/><br/>
	Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). <br/><br/>
	Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). <br/><br/>
	These signals were used to estimate variables of the feature vector for each pattern:  
	'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.<br/><br/>
	<ul>
		<li>tBodyAcc-XYZ</li>
		<li>tGravityAcc-XYZ</li>
		<li>tBodyAccJerk-XYZ</li>
		<li>tBodyGyro-XYZ</li>
		<li>tBodyGyroJerk-XYZ</li>
		<li>tBodyAccMag</li>
		<li>tGravityAccMag</li>
		<li>tBodyAccJerkMag</li>
		<li>tBodyGyroMag</li>
		<li>tBodyGyroJerkMag</li>
		<li>fBodyAcc-XYZ</li>
		<li>fBodyAccJerk-XYZ</li>
		<li>fBodyGyro-XYZ</li>
		<li>fBodyAccMag</li>
		<li>fBodyAccJerkMag</li>
		<li>fBodyGyroMag</li>
		<li>fBodyGyroJerkMag</li>
	</ul>
</cite>

Each variable is represented in tidy dataset as two columns:
- Average of mean values (grouped by subject and activity): "_mean() AVG" suffix is applied
- Average of standard deviation (grouped by subject and activity): "_std() AVG" suffix is applied.

A full list of column names is as follows:

- 1:   subject
- 2:   activity
- 3:   tBodyAcc-mean()-X AVG
- 4:   tBodyAcc-mean()-Y AVG
- 5:   tBodyAcc-mean()-Z AVG
- 6:   tBodyAcc-std()-X AVG
- 7:   tBodyAcc-std()-Y AVG
- 8:   tBodyAcc-std()-Z AVG
- 9:   tGravityAcc-mean()-X AVG
- 10:  tGravityAcc-mean()-Y AVG
- 11:  tGravityAcc-mean()-Z AVG
- 12:  tGravityAcc-std()-X AVG
- 13:  tGravityAcc-std()-Y AVG
- 14:  tGravityAcc-std()-Z AVG
- 15:  tBodyAccJerk-mean()-X AVG
- 16:  tBodyAccJerk-mean()-Y AVG
- 17:  tBodyAccJerk-mean()-Z AVG
- 18:  tBodyAccJerk-std()-X AVG
- 19:  tBodyAccJerk-std()-Y AVG
- 20:  tBodyAccJerk-std()-Z AVG
- 21:  tBodyGyro-mean()-X AVG
- 22:  tBodyGyro-mean()-Y AVG
- 23:  tBodyGyro-mean()-Z AVG
- 24:  tBodyGyro-std()-X AVG
- 25:  tBodyGyro-std()-Y AVG
- 26:  tBodyGyro-std()-Z AVG
- 27:  tBodyGyroJerk-mean()-X AVG
- 28:  tBodyGyroJerk-mean()-Y AVG
- 29:  tBodyGyroJerk-mean()-Z AVG
- 30:  tBodyGyroJerk-std()-X AVG
- 31:  tBodyGyroJerk-std()-Y AVG
- 32:  tBodyGyroJerk-std()-Z AVG
- 33:  tBodyAccMag-mean() AVG
- 34:  tBodyAccMag-std() AVG
- 35:  tGravityAccMag-mean() AVG
- 36:  tGravityAccMag-std() AVG
- 37:  tBodyAccJerkMag-mean() AVG
- 38:  tBodyAccJerkMag-std() AVG
- 39:  tBodyGyroMag-mean() AVG
- 40:  tBodyGyroMag-std() AVG
- 41:  tBodyGyroJerkMag-mean() AVG
- 42:  tBodyGyroJerkMag-std() AVG
- 43:  fBodyAcc-mean()-X AVG
- 44:  fBodyAcc-mean()-Y AVG
- 45:  fBodyAcc-mean()-Z AVG
- 46:  fBodyAcc-std()-X AVG
- 47:  fBodyAcc-std()-Y AVG
- 48:  fBodyAcc-std()-Z AVG
- 49:  fBodyAccJerk-mean()-X AVG
- 50:  fBodyAccJerk-mean()-Y AVG
- 51:  fBodyAccJerk-mean()-Z AVG
- 52:  fBodyAccJerk-std()-X AVG
- 53:  fBodyAccJerk-std()-Y AVG
- 54:  fBodyAccJerk-std()-Z AVG
- 55:  fBodyGyro-mean()-X AVG
- 56:  fBodyGyro-mean()-Y AVG
- 57:  fBodyGyro-mean()-Z AVG
- 58:  fBodyGyro-std()-X AVG
- 59:  fBodyGyro-std()-Y AVG
- 60:  fBodyGyro-std()-Z AVG
- 61:  fBodyAccMag-mean() AVG
- 62:  fBodyAccMag-std() AVG
- 63:  fBodyBodyAccJerkMag-mean() AVG
- 64:  fBodyBodyAccJerkMag-std() AVG
- 65:  fBodyBodyGyroMag-mean() AVG
- 66:  fBodyBodyGyroMag-std() AVG
- 67:  fBodyBodyGyroJerkMag-mean() AVG
- 68:  fBodyBodyGyroJerkMag-std() AVG
# Variables
	Mean and Standard Deviations of various measurements as time domain signals (prefix 't' to denote time)
	and as Fast Fourier Transform (FFT) results (Note the 'f' to indicate frequency domain signals).
	Variables are of type numeric.	Also, the last 2 variables are subjectNumber and activity, types numeric and character,
	denote the subject for which the activity was recorded and the activity label for the activty.
	 [1] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"               "tBodyAcc-mean()-Z"              
	 [4] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"           
	 [7] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"           "tBodyAccJerk-mean()-Z"          
	[10] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"             
	[13] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"          "tBodyGyroJerk-mean()-Z"         
	[16] "tBodyAccMag-mean()"              "tGravityAccMag-mean()"           "tBodyAccJerkMag-mean()"         
	[19] "tBodyGyroMag-mean()"             "tBodyGyroJerkMag-mean()"         "fBodyAcc-mean()-X"              
	[22] "fBodyAcc-mean()-Y"               "fBodyAcc-mean()-Z"               "fBodyAcc-meanFreq()-X"          
	[25] "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"          
	[28] "fBodyAccJerk-mean()-Y"           "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-meanFreq()-X"      
	[31] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"       "fBodyGyro-mean()-X"             
	[34] "fBodyGyro-mean()-Y"              "fBodyGyro-mean()-Z"              "fBodyGyro-meanFreq()-X"         
	[37] "fBodyGyro-meanFreq()-Y"          "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"             
	[40] "fBodyAccMag-meanFreq()"          "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-meanFreq()" 
	[43] "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-meanFreq()"     "fBodyBodyGyroJerkMag-mean()"    
	[46] "fBodyBodyGyroJerkMag-meanFreq()" "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"               
	[49] "tBodyAcc-std()-Z"                "tGravityAcc-std()-X"             "tGravityAcc-std()-Y"            
	[52] "tGravityAcc-std()-Z"             "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"           
	[55] "tBodyAccJerk-std()-Z"            "tBodyGyro-std()-X"               "tBodyGyro-std()-Y"              
	[58] "tBodyGyro-std()-Z"               "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"          
	[61] "tBodyGyroJerk-std()-Z"           "tBodyAccMag-std()"               "tGravityAccMag-std()"           
	[64] "tBodyAccJerkMag-std()"           "tBodyGyroMag-std()"              "tBodyGyroJerkMag-std()"         
	[67] "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"                "fBodyAcc-std()-Z"               
	[70] "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"            "fBodyAccJerk-std()-Z"           
	[73] "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"              
	[76] "fBodyAccMag-std()"               "fBodyBodyAccJerkMag-std()"       "fBodyBodyGyroMag-std()"         
	[79] "fBodyBodyGyroJerkMag-std()"      "subjectNumber"                   "activity" 
# Data
## Taken from README.txt and features_info.txt which were provided in the assignment zip file
	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

	Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

	Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
# Data Cleanup/Modifications
	Read in activity label data from activity_labels.txt and stripped line numbers from each line to be left with the activity label string.
	Replaced the activity_label integers read in from test/y_test.txt and train/y_train.txt with the actual activity label string.
	Read in the features/variables from features.txt and stripped the line numbers from each line to be left with the feature string.
	Filtered the features using grep to be left with only features containing 'mean' or 'std'
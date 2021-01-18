# Scripts
	run_analysis.R
		This script must be in the same directory as the following:
			train/X_train.txt
			test/X_test.txt
			train/subject_train.txt
			test/subject_test.txt
			test/y_test.txt
			train/y_train.txt
			activity_labels.txt
			features.txt
		The script reads in the previously mentioned files and performs the Data Cleanup/Modifications described in CodeBook.md.
		The result of the script is, mergedTbl which is the tibble, dplyr data frame, of merged test and training datasets
		with only the mean and standard deviation variables retained, and tidyTbl which is the average of all variables and rows in
		mergedTbl grouped by subjectNumber and activity.
		The tidy data is saved to 'out.txt' in the working directory.
library(dplyr)
# Read in experiment data from training and test data.
train <- read.table('train/X_train.txt', sep="")
test <- read.table('test/X_test.txt', sep="")
# Read in subject number data for each observation
subject_train <- scan('train/subject_train.txt')
subject_test <- scan('test/subject_test.txt')
# Read in the activity label legend and strip line numbers
activity_labels <- sapply(strsplit(scan('activity_labels.txt', what="character",
                                        sep="\n"), " "), tail, 1)
# Read in activity label numbers for each observation
test_activity_labels <- scan('test/y_test.txt')
train_activity_labels <- scan('train/y_train.txt')
# Replace activity label numbers with the actual activity label string from 
# activity_labels
for(i in 1:length(activity_labels)) {
    test_activity_labels[test_activity_labels==i] <- activity_labels[i]
    train_activity_labels[train_activity_labels==i] <- activity_labels[i]
}
# Convert data frames to tidyverse tibble
trainTbl <- tibble(train)
testTbl <- tibble(test)
# Get features/variable names and strip line numbers
features <- scan('features.txt', character(), sep='\n')
feat <- sapply(strsplit(features, " "), tail, 1)
# Set variables in tibbles to features from features.txt
names(trainTbl) <- feat
names(testTbl) <- feat
# Select only variables with mean and std in name. Filter tibbles to only mean 
# and std variables
meanNames <- feat[grep('mean', feat)]
stdNames <- feat[grep('std', feat)]
meanStdNames <- c(meanNames, stdNames)
filteredTrainTbl <- trainTbl[meanStdNames]
filteredTestTbl <- testTbl[meanStdNames]
# add subjectNumber and activity columns to tibbles
mutTrainTbl <- mutate(filteredTrainTbl, subjectNumber = subject_train,
                      activity=train_activity_labels)
mutTestTbl <- mutate(filteredTestTbl, subjectNumber = subject_test,
                     activity=test_activity_labels)
# Merge the training and test tibbles
mergedTbl <- rbind(mutTrainTbl, mutTestTbl)
# Group by subjectNumber and activity to calculate mean of all columns
tidyTbl <- group_by(mergedTbl, subjectNumber, activity) %>% 
    summarise_all(list(mean=mean))
write.table(tidyTbl, row.names = FALSE, file='out.txt')
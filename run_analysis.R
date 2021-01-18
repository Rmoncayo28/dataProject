library(dplyr)
# Read in experiment data from training and test data.
train <- read.table('train/X_train.txt', sep="")
test <- read.table('test/X_test.txt', sep="")
# Read in subject number data for each observation
subject_train <- scan('train/subject_train.txt')
subject_test <- scan('test/subject_test.txt')

activity_labels <- sapply(strsplit(scan('activity_labels.txt', what="character", sep="\n"), " "), tail, 1)
test_activity_labels <- scan('test/y_test.txt')
train_activity_labels <- scan('train/y_train.txt')

for(i in 1:length(activity_labels)) {
    test_activity_labels[test_activity_labels==i] <- activity_labels[i]
    train_activity_labels[train_activity_labels==i] <- activity_labels[i]
}

trainTbl <- tibble(train)
testTbl <- tibble(test)

features <- scan('features.txt', character(), sep='\n')
feat <- sapply(strsplit(features, " "), tail, 1)
names(trainTbl) <- feat
names(testTbl) <- feat

meanNames <- feat[grep('mean', feat)]
stdNames <- feat[grep('std', feat)]
meanStdNames <- c(meanNames, stdNames)
filteredTrainTbl <- trainTbl[meanStdNames]
filteredTestTbl <- testTbl[meanStdNames]

mutTrainTbl <- mutate(filteredTrainTbl, subjectNumber = subject_train, activity=train_activity_labels)
mutTestTbl <- mutate(filteredTestTbl, subjectNumber = subject_test, activity=test_activity_labels)

mergedTbl <- rbind(mutTrainTbl, mutTestTbl)
tidyTbl <- group_by(mergedTbl, subjectNumber, activity) %>% summarise_all(list(mean=mean))
write.table(tidyTbl, row.names = FALSE, file='out.txt')
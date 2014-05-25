# Course Project - Getting and cleaning data

# bring in features file
features <- read.table(file="UCI HAR Dataset/features.txt")
features_list <- as.character(features[,2])

# bring in activities descriptions
activities <- read.table(file="UCI HAR Dataset/activity_labels.txt")
colnames(activities) <- c("Label","Activity")


### Merge ttraining and the test sets to create one data set.
# read in training data
xTrain <- read.table(file="UCI HAR Dataset/train/X_train.txt", row.names=NULL)
yTrain <- read.table(file="UCI HAR Dataset/train/y_train.txt", row.names=NULL)
yTrain <- yTrain[,1]
subjectTrain <- read.table(file="UCI HAR Dataset/train/subject_train.txt", row.names=NULL)
subjectTrain <- subjectTrain[,1]

# take the label and subject files and add them as columns to the x data frame
xTrain$Label <- yTrain
xTrain$Subject <- subjectTrain

# rename x data frame with features_list
colnames(xTrain) <- c(features_list, "Label", "Subject")

# read in test data
xTest <- read.table(file="UCI HAR Dataset/test/X_test.txt", row.names=NULL)
yTest <- read.table(file="UCI HAR Dataset/test/y_test.txt", row.names=NULL)
yTest <- yTest[,1]
subjectTest <- read.table(file="UCI HAR Dataset/test/subject_test.txt", row.names=NULL)
subjectTest <- subjectTest[,1]

# make columns in x data frame
xTest$Label <- yTest
xTest$Subject <- subjectTest 

# rename x data frame with features_list
colnames(xTest) <- c(features_list, "Label", "Subject")


#### bind into one data frame
allData <- rbind(xTrain, xTest)


# Extracts only the measurements on the mean and standard deviation for each measurement. 
# extract only mean and standard deviation results
# which features have the expression 'mean()' or 'std()' ?
features_index <- grep("mean()", features_list, fixed=T)
features_index2 <- grep("std()", features_list, fixed=T)

# now create a master column index
index <- c(features_index, features_index2, 562, 563)
index <- sort(index)

# create subsets with the limited columns
allDataSub <- allData[,index]

# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names.
allDataSub2 <- merge(allDataSub, activities, by="Label", all.x=T)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidyData <- aggregate(allDataSub2, by=list(allDataSub2$Activity, allDataSub2$Subject), FUN="mean")
tidyData <- tidyData[,-3]
tidyData <- tidyData[,1:68]
colnames(tidyData)[1] <- "Activity"
colnames(tidyData)[2] <- "SubjectID"


#output CSV file
write.table(tidyData, file = "tidyData.txt", append = FALSE, quote = TRUE, sep = ",", row.names = F,
            col.names = TRUE)

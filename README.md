This is code for the Getting and Cleaning Data Coursera Course

Broadly, it accomplishes these steps:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The final output is included here with .CSV and .TXT formats. This gives the final tidy data requested and can now be used for further machine learning.

Some details on the analysis steps:
bring in features file
bring in activities descriptions
Merge ttraining and the test sets to create one data set.
read in training data
take the label and subject files and add them as columns to the x data frame
rename x data frame with features_list
read in test data
make columns in x data frame
rename x data frame with features_list
bind into one data frame
Extracts only the measurements on the mean and standard deviation for each measurement. 
extract only mean and standard deviation results
which features have the expression 'mean()' or 'std()' ?
now create a master column index
create subsets with the limited columns
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
output CSV file

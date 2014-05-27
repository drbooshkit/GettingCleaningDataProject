This is code for the Getting and Cleaning Data Coursera Course

Broadly, it accomplishes these steps:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The final output is included here with .CSV and .TXT formats. This gives the final tidy data requested and can now be used for further machine learning.

Some details on the analysis steps:
1. bring in features file
2. bring in activities descriptions
3. read in training data
4. start to merge training and the test sets to create one data set.
5. take the label and subject files and add them as columns to the x data frame
6. rename x data frame with features_list
7. read in test data
8. make columns in x data frame
9. rename x data frame with features_list
10. bind into one data frame
11. Extracts only the measurements on the mean and standard deviation for each measurement. 
12. Extract only mean and standard deviation results
13. find which features have the expression 'mean()' or 'std()' ?
14. now create a master column index
15. create subsets with the limited columns
16. Appropriately labels the data set with descriptive activity names.
17. output CSV file

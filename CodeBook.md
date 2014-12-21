---
title: "Code book, Getting and Cleaning Data Course Project"
author: "Meryem Sah"
date: "Sunday, December 21, 2014"
output: html_document
---

###run_analysis.R

1. Merge the training and the test sets to create one data set
- using `rbind()`
2. Extract only the measurements on the mean and standard deviation for each measurement
- using the correct names from the `features.txt` file
3. Use descriptive activity names to name the activities in the data set
- taking from the `activity_labels.txt` file
4. Appropriately labels the data set with descriptive variable names
- assigning new names
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
- using `write.table()`


###Variables

- `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
- `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
- features contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
- A similar approach is taken with activity names through the `activities` variable.
- `final_data` merges `x_data`, `y_data` and `subject_data` in a big dataset.
- `tidydata` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the `plyr` package is used to apply `colMeans()` and ease the development.

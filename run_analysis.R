#Load the needed library
library(plyr)


#1. Merge the training and the test sets to create one data set

# Read the training data set
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read the test data set
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge the "x" from each data set and create one data set
x_data <- rbind(x_train, x_test)

# Merge the "y" from each data set and create one data set
y_data <- rbind(y_train, y_test)

# Merge the "subject" from each data and create one data set
subject_data <- rbind(subject_train, subject_test)


#2. Extract only the measurements on the mean and standard deviation for each measurement 

# Read the features data set
features <- read.table("UCI HAR Dataset/features.txt")

# Get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset the desired columns
x_data <- x_data[, mean_and_std_features]

# Correct the column names
names(x_data) <- features[mean_and_std_features, 2]


#3. Use descriptive activity names to name the activities in the data set

# Read the activity_labels data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# Update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"


#4. Appropriately label the data set with descriptive variable names

# Correct column name
names(subject_data) <- "subject"

# Bind all the data in a single data set
final_dataset <- cbind(x_data, y_data, subject_data)


#5.Create a second, independent tidy data set with the average of each variable for each activity and each subject

# 66 <- 68 columns but last two (activity & subject)
tidydata <- ddply(final_dataset, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidydata, "tidydata.txt", row.name=FALSE)
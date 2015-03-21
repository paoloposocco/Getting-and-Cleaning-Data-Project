###############################################################
# 0 - install plyr and load data                              #
###############################################################

if (!require(plyr)) {
        install.packages("plyr")
}

library(plyr)

# load train data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# load test data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# load features
features <- read.table("./UCI HAR Dataset/features.txt")

# load 
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")


###############################################################
# 1 - Merge the training and test sets to create one data set #
###############################################################

# append test data to train data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

###############################################################
# 2 - Extracts only the measurements on the mean and          #
# standard deviation for each measurement.                    #
###############################################################

# take just the columns with mean() or std() in the names
meanStdColumns <- grep("mean\\(\\)|std\\(\\)", features[, 2])


x_data_meanStd <- x_data[, meanStdColumns]


# use the correct column names
names(x_data_meanStd) <- features[meanStdColumns, 2]

###############################################################
# 3 - Uses descriptive activity names to name the activities  #
# in the data set                                             #
###############################################################

# assign activity names to the relative numbers
y_data[, 1] <- activityLabels[y_data[, 1], 2]

# change column name
names(y_data) <- "activity"

###############################################################
# 4- Appropriately labels the data set with descriptive       #
# variable names.                                             #
###############################################################

# correct column name
names(subject_data) <- "subject"

# merge all the data
mergedData <- cbind(x_data_meanStd, y_data, subject_data)

###############################################################
# 5- From the data set in step 4, creates a second,           #
# independent tidy data set with the average of each variable #
# for each activity and each subject.                         #
###############################################################


final_data <- ddply(mergedData, .(subject, activity), function(x) colMeans(x[, 1:66]))

# export final data using row.name=FALSE as required
write.table(final_data, "final_data.txt", row.name=FALSE)
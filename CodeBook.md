---
title: "CodeBook.md"
author: "Paolo Posocco"
date: "Saturday, March 21, 2015"
output: html_document
---
### Raw Data
The `UCI HAR Dataset` folder includes these files:

* `train/X_train.txt`: Training set.

* `train/y_train.txt`: Training labels.

* `train/X_train.txt`: Training set.

* `train/y_train.txt`: Training labels.

* `test/X_test.txt`: Test set.

* `test/y_test.txt`: Test labels.

* `test/X_test.txt`: Test set.

* `test/y_test.txt`: Test labels.

* `README.txt` information about the dataset.

* `features_info.txt`: describe the variables used in the feature vector.

* `features.txt`: Features' list.

* `activity_labels.txt`: Labels-activity relationship table.

### Variables used in the run_analysis.R script

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` are the cariables relative to the files in the `UCI HAR Dataset` folder.
* `x_data`, `y_data` and `subject_data`  are used to append test data to train data.
* `features` and `activities` are the dataframes containing correct names for features and activities.
* `x_data_meanStd` subset the columns of `x_data` which contains mean() or std() in the names.
* `mergedData` contains merged data of  `x_data_meanStd`, `y_data` and `subject_data`.
* `final_data` contains the independent tidy data set with the average of each variable for each activity and each subject.      


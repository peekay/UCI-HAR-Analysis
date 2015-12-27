# R script to process UCI HAR dataset 
# Coursera Getting and Cleaning Data
#
# This script produces a new tidy dataset containing summary calculation for each
# subject and activity.
#
# Requirements:
#   - This script depends on the dplyr and reshape2 libraries
#   - This script should be run from a directory containing UCI HAR dataset
#
# Implementation Notes:
#   Part 1: loads metadata such as feature descriptions, descriptive labels, etc.
#   Part 2: loads and processes the training data set (training_set)
#   Part 3: loads and processes the test data set (test_set)
#   Part 4: combines both data sets into one data frame (uci_har_set)
#   Part 5: extract only -mean and -std columns
#   Part 6: summarizes the data for each subject and activity
#   Part 7: writes the new tidy summary into a file

library(dplyr)
library(reshape2)

#----Part 1----
# Load metadata such as feature descriptions, descriptive labels, etc.

feature_labels <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

#----Part 2----
# Load and processes the training data set (training_set)

train_data <- read.table("train/X_train.txt")
train_labels <- read.table("train/y_train.txt")
train_subjects <- read.table("train/subject_train.txt")
#Replace test data feature codes with descriptive names
names(train_data) <- feature_labels[[2]]
#Replace test_subject column with a descriptive name
names(train_subjects) <- "subject"
#Replace test labels with descriptive names instead of numeric codes
names(train_labels) <- "activity"
train_labels$activity <- as.character(activity_labels[train_labels$activity,"V2"])
#Combine all test data into a test set
train_set <- cbind(train_subjects, train_labels, train_data)

#----Part 3----
# Load and processes the test data set (test_set)

test_data <- read.table("test/X_test.txt")
test_labels <- read.table("test/y_test.txt")
test_subjects <- read.table("test/subject_test.txt")
#Replace test data feature codes with descriptive names
names(test_data) <- feature_labels[[2]]
#Replace test_subject column with a descriptive name
names(test_subjects) <- "subject"
#Replace test labels with descriptive names instead of numeric codes
names(test_labels) <- "activity"
test_labels$activity <- as.character(activity_labels[test_labels$activity,"V2"])
#Combine all test data into a test set
test_set <- cbind(test_subjects, test_labels, test_data)

#----Part 4----
# Combine both data sets into one data frame (uci_har_set)

uci_har_set <- rbind(train_set, test_set)

#----Part 5----
# Extract -mean and -std columns using regular expressions
extract_columns <- grep('^subject$|^activity$|-mean|-std',names(uci_har_set))
uci_har_set <- uci_har_set[,extract_columns]

#----Part 6----
# Summarize the data for each subject and activity

#Group by subject and activity using reshape2 melt and dplyr group_by
melted <- melt(uci_har_set, id.vars=c('subject', 'activity'))
grouped <- group_by(melted, subject, activity, variable)

#Summarize averages by subject and activity
summary <- summarize(grouped, mean=mean(value))

#----Part 7----
# Write the new tidy summary into a file
write.table(uci_har_set, file="uci_har_analysis.txt", row.names = FALSE)

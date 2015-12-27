
Analysis Script for UCI HAR dataset
===================================

Coursera Getting and Cleaning Data
Version 0.1

Description
-----------

This project contains an R script called *run_analysis.R*, used to analyze the UCI HAR (Human Activity Recognition) dataset.  The script produces a summary output file called *uci_har_analysis.txt*.  Only the "mean" and "standard deviation" variables are processed. The *codebook.txt* file describes the analysis output variables.

The UCI HAR dataset
-------------------

The UCI HAR dataset can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Below is a description of the HAR expirement extracted from the zip file above:

> The UCI HAR dataset contains experiments have been carried out with a group of 30 
> volunteers within an age bracket of 19-48 years. Each person performed six activities 
> (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
> smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and 
> gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a 
> constant rate of 50Hz. The experiments have been video-recorded to label the data 
> manually. The obtained dataset has been randomly partitioned into two sets, where 
> 70% of the volunteers was selected for generating the training data and 30% the test 
> data. 

A full description of the dataset can be obtained from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Prerequisites
-------------

In addition to the UCI HAR dataset, this script requires the dplyr and reshape2 R libraries (available from CRAN).

Usage
-----

1. Ensure the *dplyer* and *reshape2* libraries are installed
2. Download and unpack the UCI HAR dataset from the zip archive above
3. Change the R working directory to the root of the UCI HAR dataset (containing *test* and *train* directories).
4. Execute the *run_analysis.R* script
5. The script outputs a file called *uci_har_analysis.txt* in the same directory
6. Additionally, if run from an interactive environment (e.g., RStudio), R variables called *test_set*, *train_set*, and *uci_har_set* will also be available.  These variables contains the test set, training set and the combined dataset, respectively.

Analysis Script
---------------

The analysis script performs the following steps to analyze the UCI HAR dataset:

1. Load UCI HAR metadata such as feature descriptions, descriptive labels, etc.
2. Load and processes the training data set (training_set)
3. Load and processes the test data set (test_set)
4. Combine both data sets into one data frame (uci_har_set)
5. Extract only -mean and -std columns
6. Summarize the data for each subject and activity using reshape2 and dplyr
7. Write the new tidy summary into the *uci_har_analysis.txt* file


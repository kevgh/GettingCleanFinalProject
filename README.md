---
title: "Final Project Readme file"
author: "kevgh"
date: "Thursday, May 14, 2015"
output: html_document
---

# Final Project run_analysis.R Description

This file describes the R code used in the final project.

There are two main actions the code is performing.

1. Assembling the HAR dataset
2. Cleaning the HAR dataset into the tidy_data as described in the assignment.

## Assignment Text

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Invocation

* Source the file run_analysis.R (in this directory)
* Invoke the function run_analysis.
* The script assumes that the UCI HAR Dataset directory is located in the
current directory. If not, it will download and unzip the file from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Step 1

I am including the reading of the data as part of this step

There is a function to get the partial data set (either test or train). It makes
use of functions to get the X (measurement) and y (activity) and subject data.
Since both the train and test data is structured the same, I passed the name
to the function and used it for both.

* Test and Train data is merged using rbind.

## Step 2

* The data for mean and std measurements is extracted using grep. This is stored
in mean_std_data_only.

## Step 3

* The activity names are changed to lower case and "_" is removed. I felt that
the text of the names is an adequate description.

## Step 4

The features names are composed in function clean_measure_names as follows:

* Converted to lower case
* Removed hyphens and parentheses
* Split the names using a period (.) to make it easier to read (at least for me)
between the type of measure, the summarizing function and in some cases, the
dimension (X, Y, or Z).
* Prepend "mean." since we are computing the mean of the original measure.

## Step 5

Tidy and clean ...

* Bind the mean_std_data with the subject and activity vectors and create
a tbl_df wrapper
* Note that this is done as the initial step in a chained operation.
* Group the wrapper by activity and subject.
* Summarise the measures using the mean function
* Finally, arrange the data by activity and subject.
* Write the result using write.table

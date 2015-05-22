---
title: "Final Project Code Book"
author: "kevgh"
date: "Thursday, May 14, 2015"
output: html_document
---
 
## Project Description
This describes the Final Project for Getting and Cleaning Data Course. There are
two major portions to the project:

1. Download, unzip, read, and subset the UCI HAR Dataset (HAR)

2. Create a tidy dataset based on the dataset created in step 1, with means for
the measured features with either a mean or std on a per subject and activity
basis.

### Notes on the original HAR data

* HAR is spread over multiple files and directories.
* For a full description of HAR dataset you can read the following files in the
directory containing the unzipped data: README.txt and features_info.txt or
for a full description of the HAR dataset, refer to the following link 
https://github.com/kevgh/GettingCleanFinalProject.
 

## Creating the HAR dataset

1. Download the zipped data file from http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the downloaded file.

There are files for measured features, activities (6) performed during the measurements,
and subjects (30).

3. Read the training data and merge it together (X, y, and subjects)

* X contains the data values for the features that were measured for the dataset.
* y contains the activities that were performed when generating the values in X
* subjects indicates which subject performed the activity being measured.
* Use cbind to merge the measured data, activity and subject columns
* Add subject and activity columns as factors.

4. Read the test data and merge it together (X, y, and subjects)

* This process is the same as in step 3 but the test data is in a separate
sub-directory.

5. Now merge the test and training data together to form the HAR dataset.

* Use rbind to merge test and training

### Cleaning of the data

#### Clean HAR

The HAR dataset has many features we do not wish to include in the tidy data.
Additionally, we want to compute the mean per subject and activity for each of
the retained measurements.

1. Extract the columns of interest using grep and a regular expression.

The columns of interest are those that compute only the mean or standard
deviation of the measurements in the HAR dataset.

2. Convert the activity names to lower case. Retain the actual words as I find
them to be sufficiently description

3. Convert the measurement names to lower case, remove parentheses, and add a
period between the measurement type, the aggregate (mean or std), and the
dimension (XYZ).

The tidy dataset should contain only the means of the measurements per subject
and activity.

* Group the data on subject and activity
* Compute the mean for the actual measurements
* Arrange by activity and subject
 
## Description of the variables in the tidy_data.txt file

* tidy_data is a tbl_df wrapper for data.frame with dimensions [180 x 67]

### Activity (factor)

The original measurements were made while the subject performed one of six
activities.

1. laying
2. sitting
3. standing
4. walking
5. walkingdownstairs
6. walkingupstairs

### Subject (factor)

The original measurements were performed by a total of 30 subjects. Some
performed during the test phase and some performed during the training phase.
All are included in the tidy_data result.

### Notes on remaining variables

* All of the remaining variables are in the form
mean.<original measurement name>
* All of them represent the mean of the original measurement values for a
specific combination of subject and activity.
* Since the original measurements were coerced to the range [-1:1] and the new
variables are all means of that data they must also lie in that range.

### Measurement Variable Naming

The variables are named based on the original name of the measurements in the
HAR dataset. The original name was prepended by "mean." to indicate the variable
is the mean of the measurement. I felt this was representative of what the
column contains and the use of periods to separate the various portions of the
measurement name helped me when trying to read the names.

### mean.tbodyacc.mean.x
The mean of measurement tbodyacc.mean.x for the given activity and subject.

### mean.tbodyacc.mean.y
The mean of measurement tbodyacc.mean.y for the given activity and subject.

### mean.tbodyacc.mean.z
The mean of measurement tbodyacc.mean.z for the given activity and subject.

### mean.tbodyacc.std.x
The mean of measurement tbodyacc.std.x for the given activity and subject.

### mean.tbodyacc.std.y
The mean of measurement tbodyacc.std.y for the given activity and subject.

### mean.tbodyacc.std.z
The mean of measurement tbodyacc.std.z for the given activity and subject.

### mean.tgravityacc.mean.x
The mean of measurement tgravityacc.mean.x for the given activity and subject.

### mean.tgravityacc.mean.y
The mean of measurement tgravityacc.mean.y for the given activity and subject.

### mean.tgravityacc.mean.z
The mean of measurement tgravityacc.mean.z for the given activity and subject.

### mean.tgravityacc.std.x
The mean of measurement tgravityacc.std.x for the given activity and subject.

### mean.tgravityacc.std.y
The mean of measurement tgravityacc.std.y for the given activity and subject.

### mean.tgravityacc.std.z
The mean of measurement tgravityacc.std.z for the given activity and subject.

### mean.tbodyaccjerk.mean.x
The mean of measurement tbodyaccjerk.mean.x for the given activity and subject.

### mean.tbodyaccjerk.mean.y
The mean of measurement tbodyaccjerk.mean.y for the given activity and subject.

### mean.tbodyaccjerk.mean.z
The mean of measurement tbodyaccjerk.mean.z for the given activity and subject.

### mean.tbodyaccjerk.std.x
The mean of measurement tbodyaccjerk.std.x for the given activity and subject.

### mean.tbodyaccjerk.std.y
The mean of measurement tbodyaccjerk.std.y for the given activity and subject.

### mean.tbodyaccjerk.std.z
The mean of measurement tbodyaccjerk.std.z for the given activity and subject.

### mean.tbodygyro.mean.x
The mean of measurement tbodygyro.mean.x for the given activity and subject.

### mean.tbodygyro.mean.y
The mean of measurement tbodygyro.mean.y for the given activity and subject.

### mean.tbodygyro.mean.z
The mean of measurement tbodygyro.mean.z for the given activity and subject.

### mean.tbodygyro.std.x
The mean of measurement tbodygyro.std.x for the given activity and subject.

### mean.tbodygyro.std.y
The mean of measurement tbodygyro.std.y for the given activity and subject.

### mean.tbodygyro.std.z
The mean of measurement tbodygyro.std.z for the given activity and subject.

### mean.tbodygyrojerk.mean.x
The mean of measurement tbodygyrojerk.mean.x for the given activity and subject.

### mean.tbodygyrojerk.mean.y
The mean of measurement tbodygyrojerk.mean.y for the given activity and subject.

### mean.tbodygyrojerk.mean.z
The mean of measurement tbodygyrojerk.mean.z for the given activity and subject.

### mean.tbodygyrojerk.std.x
The mean of measurement tbodygyrojerk.std.x for the given activity and subject.

### mean.tbodygyrojerk.std.y
The mean of measurement tbodygyrojerk.std.y for the given activity and subject.

### mean.tbodygyrojerk.std.z
The mean of measurement tbodygyrojerk.std.z for the given activity and subject.

### mean.tbodyaccmag.mean
The mean of measurement tbodyaccmag.mean for the given activity and subject.

### mean.tbodyaccmag.std
The mean of measurement tbodyaccmag.std for the given activity and subject.

### mean.tgravityaccmag.mean
The mean of measurement tgravityaccmag.mean for the given activity and subject.

### mean.tgravityaccmag.std
The mean of measurement tgravityaccmag.std for the given activity and subject.

### mean.tbodyaccjerkmag.mean
The mean of measurement tbodyaccjerkmag.mean for the given activity and subject.

### mean.tbodyaccjerkmag.std
The mean of measurement tbodyaccjerkmag.std for the given activity and subject.

### mean.tbodygyromag.mean
The mean of measurement tbodygyromag.mean for the given activity and subject.

### mean.tbodygyromag.std
The mean of measurement tbodygyromag.std for the given activity and subject.

### mean.tbodygyrojerkmag.mean
The mean of measurement tbodygyrojerkmag.mean for the given activity and subject.

### mean.tbodygyrojerkmag.std
The mean of measurement tbodygyrojerkmag.std for the given activity and subject.

### mean.fbodyacc.mean.x
The mean of measurement fbodyacc.mean.x for the given activity and subject.

### mean.fbodyacc.mean.y
The mean of measurement fbodyacc.mean.y for the given activity and subject.

### mean.fbodyacc.mean.z
The mean of measurement fbodyacc.mean.z for the given activity and subject.

### mean.fbodyacc.std.x
The mean of measurement fbodyacc.std.x for the given activity and subject.

### mean.fbodyacc.std.y
The mean of measurement fbodyacc.std.y for the given activity and subject.

### mean.fbodyacc.std.z
The mean of measurement fbodyacc.std.z for the given activity and subject.

### mean.fbodyaccjerk.mean.x
The mean of measurement fbodyaccjerk.mean.x for the given activity and subject.

### mean.fbodyaccjerk.mean.y
The mean of measurement fbodyaccjerk.mean.y for the given activity and subject.

### mean.fbodyaccjerk.mean.z
The mean of measurement fbodyaccjerk.mean.z for the given activity and subject.

### mean.fbodyaccjerk.std.x
The mean of measurement fbodyaccjerk.std.x for the given activity and subject.

### mean.fbodyaccjerk.std.y
The mean of measurement fbodyaccjerk.std.y for the given activity and subject.

### mean.fbodyaccjerk.std.z
The mean of measurement fbodyaccjerk.std.z for the given activity and subject.

### mean.fbodygyro.mean.x
The mean of measurement fbodygyro.mean.x for the given activity and subject.

### mean.fbodygyro.mean.y
The mean of measurement fbodygyro.mean.y for the given activity and subject.

### mean.fbodygyro.mean.z
The mean of measurement fbodygyro.mean.z for the given activity and subject.

### mean.fbodygyro.std.x
The mean of measurement fbodygyro.std.x for the given activity and subject.

### mean.fbodygyro.std.y
The mean of measurement fbodygyro.std.y for the given activity and subject.

### mean.fbodygyro.std.z
The mean of measurement fbodygyro.std.z for the given activity and subject.

### mean.fbodyaccmag.mean
The mean of measurement fbodyaccmag.mean for the given activity and subject.

### mean.fbodyaccmag.std
The mean of measurement fbodyaccmag.std for the given activity and subject.

### mean.fbodybodyaccjerkmag.mean
The mean of measurement fbodybodyaccjerkmag.mean for the given activity and 
subject.

### mean.fbodybodyaccjerkmag.std
The mean of measurement fbodybodyaccjerkmag.std for the given activity and 
subject.

### mean.fbodybodygyromag.mean
The mean of measurement fbodybodygyromag.mean for the given activity and 
subject.

### mean.fbodybodygyromag.std
The mean of measurement fbodybodygyromag.std for the given activity and subject.

### mean.fbodybodygyrojerkmag.mean
The mean of measurement fbodybodygyrojerkmag.mean for the given activity and 
subject.

### mean.fbodybodygyrojerkmag.std 
The mean of measurement fbodybodygyrojerkmag.std for the given activity and 
subject.
 
## Sources

* Coursera course Getting and Cleaning Data lectures and project documents.
* HAR dataset, link is above

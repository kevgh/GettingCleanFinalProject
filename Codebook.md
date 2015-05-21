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

* There are files for measured features, activities (6) performed during the measurements,
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

* The columns of interest are those that compute only the mean or standard
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

* tidy_data is a tbl_df wrapper for data.fram with dimensions [180 x 67]

### str(tidy_data)

Here is the output of str for tidy_data.

Classes 'grouped_df', 'tbl_df', 'tbl' and 'data.frame':    180 obs. of  67 variables:
 $ activity                      : Factor w/ 6 levels "laying","sitting",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ subject                       : Factor w/ 30 levels "1","3","5","6",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ mean.tbodyacc.mean.x          : num  0.222 0.276 0.278 0.249 0.25 ...
 $ mean.tbodyacc.mean.y          : num  -0.0405 -0.019 -0.0183 -0.0103 -0.0204 ...
 $ mean.tbodyacc.mean.z          : num  -0.113 -0.101 -0.108 -0.133 -0.101 ...
 $ mean.tbodyacc.std.x           : num  -0.928 -0.983 -0.966 -0.934 -0.937 ...
 $ mean.tbodyacc.std.y           : num  -0.837 -0.962 -0.969 -0.925 -0.926 ...
 $ mean.tbodyacc.std.z           : num  -0.826 -0.964 -0.969 -0.925 -0.953 ...
 $ mean.tgravityacc.mean.x       : num  -0.249 -0.242 -0.483 -0.477 -0.503 ...
 $ mean.tgravityacc.mean.y       : num  0.706 0.837 0.955 0.957 0.393 ...
 $ mean.tgravityacc.mean.z       : num  0.446 0.489 0.264 0.176 0.908 ...
 $ mean.tgravityacc.std.x        : num  -0.897 -0.983 -0.946 -0.888 -0.914 ...
 $ mean.tgravityacc.std.y        : num  -0.908 -0.981 -0.986 -0.959 -0.956 ...
 $ mean.tgravityacc.std.z        : num  -0.852 -0.965 -0.977 -0.928 -0.962 ...
 $ mean.tbodyaccjerk.mean.x      : num  0.0811 0.077 0.0848 0.0963 0.0969 ...
 $ mean.tbodyaccjerk.mean.y      : num  0.00384 0.0138 0.00747 -0.00115 0.02506 ...
 $ mean.tbodyaccjerk.mean.z      : num  0.01083 -0.00436 -0.00304 0.00329 -0.01317 ...
 $ mean.tbodyaccjerk.std.x       : num  -0.958 -0.981 -0.983 -0.966 -0.981 ...
 $ mean.tbodyaccjerk.std.y       : num  -0.924 -0.969 -0.965 -0.934 -0.973 ...
 $ mean.tbodyaccjerk.std.z       : num  -0.955 -0.982 -0.985 -0.96 -0.973 ...
 $ mean.tbodygyro.mean.x         : num  -0.01655 -0.02082 -0.02189 -0.00796 -0.00283 ...
 $ mean.tbodygyro.mean.y         : num  -0.0645 -0.0719 -0.0799 -0.1072 -0.1336 ...
 $ mean.tbodygyro.mean.z         : num  0.149 0.138 0.16 0.179 0.156 ...
 $ mean.tbodygyro.std.x          : num  -0.874 -0.975 -0.979 -0.955 -0.96 ...
 $ mean.tbodygyro.std.y          : num  -0.951 -0.977 -0.977 -0.944 -0.945 ...
 $ mean.tbodygyro.std.z          : num  -0.908 -0.964 -0.961 -0.939 -0.955 ...
 $ mean.tbodygyrojerk.mean.x     : num  -0.107 -0.1 -0.102 -0.111 -0.106 ...
 $ mean.tbodygyrojerk.mean.y     : num  -0.0415 -0.039 -0.0404 -0.0424 -0.0359 ...
 $ mean.tbodygyrojerk.mean.z     : num  -0.0741 -0.0687 -0.0708 -0.0718 -0.0672 ...
 $ mean.tbodygyrojerk.std.x      : num  -0.919 -0.98 -0.983 -0.94 -0.974 ...
 $ mean.tbodygyrojerk.std.y      : num  -0.968 -0.987 -0.984 -0.959 -0.976 ...
 $ mean.tbodygyrojerk.std.z      : num  -0.958 -0.983 -0.99 -0.96 -0.989 ...
 $ mean.tbodyaccmag.mean         : num  -0.842 -0.973 -0.967 -0.919 -0.936 ...
 $ mean.tbodyaccmag.std          : num  -0.795 -0.964 -0.959 -0.897 -0.907 ...
 $ mean.tgravityaccmag.mean      : num  -0.842 -0.973 -0.967 -0.919 -0.936 ...
 $ mean.tgravityaccmag.std       : num  -0.795 -0.964 -0.959 -0.897 -0.907 ...
 $ mean.tbodyaccjerkmag.mean     : num  -0.954 -0.979 -0.98 -0.955 -0.98 ...
 $ mean.tbodyaccjerkmag.std      : num  -0.928 -0.976 -0.977 -0.95 -0.967 ...
 $ mean.tbodygyromag.mean        : num  -0.875 -0.952 -0.947 -0.909 -0.916 ...
 $ mean.tbodygyromag.std         : num  -0.819 -0.954 -0.958 -0.921 -0.919 ...
 $ mean.tbodygyrojerkmag.mean    : num  -0.963 -0.987 -0.986 -0.956 -0.983 ...
 $ mean.tbodygyrojerkmag.std     : num  -0.936 -0.983 -0.984 -0.953 -0.971 ...
 $ mean.fbodyacc.mean.x          : num  -0.939 -0.981 -0.969 -0.939 -0.953 ...
 $ mean.fbodyacc.mean.y          : num  -0.867 -0.961 -0.965 -0.924 -0.942 ...
 $ mean.fbodyacc.mean.z          : num  -0.883 -0.968 -0.977 -0.938 -0.959 ...
 $ mean.fbodyacc.std.x           : num  -0.924 -0.984 -0.965 -0.932 -0.931 ...
 $ mean.fbodyacc.std.y           : num  -0.834 -0.964 -0.973 -0.93 -0.923 ...
 $ mean.fbodyacc.std.z           : num  -0.813 -0.963 -0.966 -0.924 -0.953 ...
 $ mean.fbodyaccjerk.mean.x      : num  -0.957 -0.981 -0.983 -0.967 -0.98 ...
 $ mean.fbodyaccjerk.mean.y      : num  -0.922 -0.969 -0.965 -0.936 -0.973 ...
 $ mean.fbodyaccjerk.mean.z      : num  -0.948 -0.979 -0.983 -0.954 -0.97 ...
 $ mean.fbodyaccjerk.std.x       : num  -0.964 -0.983 -0.986 -0.969 -0.984 ...
 $ mean.fbodyaccjerk.std.y       : num  -0.932 -0.971 -0.966 -0.936 -0.976 ...
 $ mean.fbodyaccjerk.std.z       : num  -0.961 -0.984 -0.986 -0.964 -0.975 ...
 $ mean.fbodygyro.mean.x         : num  -0.85 -0.97 -0.976 -0.935 -0.954 ...
 $ mean.fbodygyro.mean.y         : num  -0.952 -0.978 -0.978 -0.942 -0.958 ...
 $ mean.fbodygyro.mean.z         : num  -0.909 -0.962 -0.963 -0.933 -0.957 ...
 $ mean.fbodygyro.std.x          : num  -0.882 -0.976 -0.981 -0.962 -0.962 ...
 $ mean.fbodygyro.std.z          : num  -0.917 -0.967 -0.963 -0.947 -0.959 ...
 $ mean.fbodyaccmag.mean         : num  -0.862 -0.966 -0.962 -0.912 -0.928 ...
 $ mean.fbodyaccmag.std          : num  -0.798 -0.968 -0.963 -0.905 -0.911 ...
 $ mean.fbodybodyaccjerkmag.mean : num  -0.933 -0.976 -0.977 -0.949 -0.968 ...
 $ mean.fbodybodyaccjerkmag.std  : num  -0.922 -0.975 -0.976 -0.952 -0.965 ...
 $ mean.fbodybodygyromag.mean    : num  -0.862 -0.965 -0.968 -0.93 -0.941 ...
 $ mean.fbodybodygyromag.std     : num  -0.824 -0.955 -0.959 -0.929 -0.919 ...
 $ mean.fbodybodygyrojerkmag.mean: num  -0.942 -0.984 -0.985 -0.954 -0.974 ...
 $ mean.fbodybodygyrojerkmag.std : num  -0.933 -0.983 -0.983 -0.956 -0.969 ...
 - attr(*, "vars")=List of 1
  ..$ : symbol activity
 - attr(*, "indices")=List of 6
  ..$ : int  0 1 2 3 4 5 6 7 8 9 ...
  ..$ : int  30 31 32 33 34 35 36 37 38 39 ...
  ..$ : int  60 61 62 63 64 65 66 67 68 69 ...
  ..$ : int  90 91 92 93 94 95 96 97 98 99 ...
  ..$ : int  120 121 122 123 124 125 126 127 128 129 ...
  ..$ : int  150 151 152 153 154 155 156 157 158 159 ...
 - attr(*, "group_sizes")= int  30 30 30 30 30 30
 - attr(*, "biggest_group_size")= int 30
 - attr(*, "labels")='data.frame':	6 obs. of  1 variable:
  ..$ activity: Factor w/ 6 levels "laying","sitting",..: 1 2 3 4 5 6
  ..- attr(*, "vars")=List of 1
  .. ..$ : symbol activity

### Variable Naming

The variables are named based on the original name of the measurements in the
HAR dataset. The original name was prepended by "mean." to indicate the variable
is the mean of the measurement. I felt this was representative of what the
column contains and the use of periods to separate the various portions of the
measurement name helped me when trying to read the names.
 
### Activity (factor)

* The original measurements were made while the subject performed one of six
activities.

1. laying
2. sitting
3. standing
4. walking
5. walkingdownstairs
6. walkingupstairs

### Subject (factor)

* The original measurements were performed by a total of 30 subjects. Some
performed during the test phase and some performed during the training phase.
All are included in  the tidy_data result.

### Notes on remaining variables

* All of the remaining variables are in the form
mean.<original measurement name>
* All of them represent the mean of the original measurement values for a
specific combination of subject and activity.
* Since the original measurements were coerced to the range [-1:1] and the new
variables are all means of that data they must also lie in that range.

### mean.tbodyacc.mean.x
* the mean of measurement tbodyacc.mean.x for the given activity and subject
### mean.tbodyacc.mean.y
* the mean of measurement tbodyacc.mean.y for the given activity and subject
### mean.tbodyacc.mean.z
* the mean of measurement tbodyacc.mean.z for the given activity and subject
### mean.tbodyacc.std.x
* the mean of measurement tbodyacc.std.x for the given activity and subject
### mean.tbodyacc.std.y
* the mean of measurement tbodyacc.std.y for the given activity and subject
### mean.tbodyacc.std.z
* the mean of measurement tbodyacc.std.z for the given activity and subject
### mean.tgravityacc.mean.x
* the mean of measurement tgravityacc.mean.x for the given activity and subject
### mean.tgravityacc.mean.y
* the mean of measurement tgravityacc.mean.y for the given activity and subject
### mean.tgravityacc.mean.z
* the mean of measurement tgravityacc.mean.z for the given activity and subject
### mean.tgravityacc.std.x
* the mean of measurement tgravityacc.std.x for the given activity and subject
### mean.tgravityacc.std.y
* the mean of measurement tgravityacc.std.y for the given activity and subject
### mean.tgravityacc.std.z
* the mean of measurement tgravityacc.std.z for the given activity and subject
### mean.tbodyaccjerk.mean.x
* the mean of measurement tbodyaccjerk.mean.x for the given activity and subject
### mean.tbodyaccjerk.mean.y
* the mean of measurement tbodyaccjerk.mean.y for the given activity and subject
### mean.tbodyaccjerk.mean.z
* the mean of measurement tbodyaccjerk.mean.z for the given activity and subject
### mean.tbodyaccjerk.std.x
* the mean of measurement tbodyaccjerk.std.x for the given activity and subject
### mean.tbodyaccjerk.std.y
* the mean of measurement tbodyaccjerk.std.y for the given activity and subject
### mean.tbodyaccjerk.std.z
* the mean of measurement tbodyaccjerk.std.z for the given activity and subject
### mean.tbodygyro.mean.x
* the mean of measurement tbodygyro.mean.x for the given activity and subject
### mean.tbodygyro.mean.y
* the mean of measurement tbodygyro.mean.y for the given activity and subject
### mean.tbodygyro.mean.z
* the mean of measurement tbodygyro.mean.z for the given activity and subject
### mean.tbodygyro.std.x
* the mean of measurement tbodygyro.std.x for the given activity and subject
### mean.tbodygyro.std.y
* the mean of measurement tbodygyro.std.y for the given activity and subject
### mean.tbodygyro.std.z
* the mean of measurement tbodygyro.std.z for the given activity and subject
### mean.tbodygyrojerk.mean.x
* the mean of measurement tbodygyrojerk.mean.x for the given activity and subject
### mean.tbodygyrojerk.mean.y
* the mean of measurement tbodygyrojerk.mean.y for the given activity and subject
### mean.tbodygyrojerk.mean.z
* the mean of measurement tbodygyrojerk.mean.z for the given activity and subject
### mean.tbodygyrojerk.std.x
* the mean of measurement tbodygyrojerk.std.x for the given activity and subject
### mean.tbodygyrojerk.std.y
* the mean of measurement tbodygyrojerk.std.y for the given activity and subject
### mean.tbodygyrojerk.std.z
* the mean of measurement tbodygyrojerk.std.z for the given activity and subject
### mean.tbodyaccmag.mean
* the mean of measurement tbodyaccmag.mean for the given activity and subject
### mean.tbodyaccmag.std
* the mean of measurement tbodyaccmag.std for the given activity and subject
### mean.tgravityaccmag.mean
* the mean of measurement tgravityaccmag.mean for the given activity and subject
### mean.tgravityaccmag.std
* the mean of measurement tgravityaccmag.std for the given activity and subject
### mean.tbodyaccjerkmag.mean
* the mean of measurement tbodyaccjerkmag.mean for the given activity and subject
### mean.tbodyaccjerkmag.std
* the mean of measurement tbodyaccjerkmag.std for the given activity and subject
### mean.tbodygyromag.mean
* the mean of measurement tbodygyromag.mean for the given activity and subject
### mean.tbodygyromag.std
* the mean of measurement tbodygyromag.std for the given activity and subject
### mean.tbodygyrojerkmag.mean
* the mean of measurement tbodygyrojerkmag.mean for the given activity and subject
### mean.tbodygyrojerkmag.std
* the mean of measurement tbodygyrojerkmag.std for the given activity and subject
### mean.fbodyacc.mean.x
* the mean of measurement fbodyacc.mean.x for the given activity and subject
### mean.fbodyacc.mean.y
* the mean of measurement fbodyacc.mean.y for the given activity and subject
### mean.fbodyacc.mean.z
* the mean of measurement fbodyacc.mean.z for the given activity and subject
### mean.fbodyacc.std.x
* the mean of measurement fbodyacc.std.x for the given activity and subject
### mean.fbodyacc.std.y
* the mean of measurement fbodyacc.std.y for the given activity and subject
### mean.fbodyacc.std.z
* the mean of measurement fbodyacc.std.z for the given activity and subject
### mean.fbodyaccjerk.mean.x
* the mean of measurement fbodyaccjerk.mean.x for the given activity and subject
### mean.fbodyaccjerk.mean.y
* the mean of measurement fbodyaccjerk.mean.y for the given activity and subject
### mean.fbodyaccjerk.mean.z
* the mean of measurement fbodyaccjerk.mean.z for the given activity and subject
### mean.fbodyaccjerk.std.x
* the mean of measurement fbodyaccjerk.std.x for the given activity and subject
### mean.fbodyaccjerk.std.y
* the mean of measurement fbodyaccjerk.std.y for the given activity and subject
### mean.fbodyaccjerk.std.z
* the mean of measurement fbodyaccjerk.std.z for the given activity and subject
### mean.fbodygyro.mean.x
* the mean of measurement fbodygyro.mean.x for the given activity and subject
### mean.fbodygyro.mean.y
* the mean of measurement fbodygyro.mean.y for the given activity and subject
### mean.fbodygyro.mean.z
* the mean of measurement fbodygyro.mean.z for the given activity and subject
### mean.fbodygyro.std.x
* the mean of measurement fbodygyro.std.x for the given activity and subject
### mean.fbodygyro.std.y
* the mean of measurement fbodygyro.std.y for the given activity and subject
### mean.fbodygyro.std.z
* the mean of measurement fbodygyro.std.z for the given activity and subject
### mean.fbodyaccmag.mean
* the mean of measurement fbodyaccmag.mean for the given activity and subject
### mean.fbodyaccmag.std
* the mean of measurement fbodyaccmag.std for the given activity and subject
### mean.fbodybodyaccjerkmag.mean
* the mean of measurement fbodybodyaccjerkmag.mean for the given activity and subject
### mean.fbodybodyaccjerkmag.std
* the mean of measurement fbodybodyaccjerkmag.std for the given activity and subject
### mean.fbodybodygyromag.mean
* the mean of measurement fbodybodygyromag.mean for the given activity and subject
### mean.fbodybodygyromag.std
* the mean of measurement fbodybodygyromag.std for the given activity and subject
### mean.fbodybodygyrojerkmag.mean
* the mean of measurement fbodybodygyrojerkmag.mean for the given activity and subject
### mean.fbodybodygyrojerkmag.std 
* the mean of measurement fbodybodygyrojerkmag.std for the given activity and subject

 
## Sources

* Coursera course Getting and Cleaning Data lectures and project documents.
* HAR dataset, link is above

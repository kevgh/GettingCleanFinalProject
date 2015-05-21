# code for final project for Getting and Cleaning Data course

# use dplyr to build tidy data set
require("dplyr")

# Download and extract the data from the zip file
download_data <- function () {
    if(!file.exists("UCI HAR Dataset")) {
        fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, "dataset.zip")
        unzip("dataset.zip")
        file.remove("dataset.zip")
    } else {
        print("Dataset already downloaded.")
    }
}


# read activity labels and return as character vector
get_activity_labels <- function() {
    tmp <- read.table("activity_labels.txt", sep = "")
    as.character(tmp$V2)
}

# read features and return as character vector
get_feature_names <- function() {
    tmp <- read.table("features.txt", sep = "")
    as.character(tmp$V2)
}

# read x data from the given subdirectory, add labels and return the table
get_x <- function(feature_names, dir) {
    x_file <- paste(dir, "/X_", dir, ".txt", sep = "")
    x_data <- read.table(x_file, sep = "")
    names(x_data) <- feature_names
    x_data
}

# read y data from given dir, add the activity_labels and return the table
get_y <- function(activity_labels, dir) {
    y_file <- paste(dir, "/y_", dir, ".txt", sep = "")
    y_data <- read.table(y_file, sep = "")
    names(y_data) <- "Activity"
    y_data$Activity <- as.factor(y_data$Activity)
    levels(y_data$Activity) <- activity_labels
    y_data
}

get_subjects <- function(dir) {
    # read subject data file, add a label, convert to factors, return the table
    table_file <- paste(dir, "/subject_", dir, ".txt", sep = "")
    subjects = read.table(table_file, sep = "")
    names(subjects) = "Subject"
    subjects$Subject = as.factor(subjects$Subject)
    subjects
}

# transform the names from a combination of upper/lower case, with hyphens and
# parentheses embedded in the names to something more readable.
#
# Add '.' between the sections of the name for easy reading (in my opinion)
# Replace the "-" before [XYZ] with "."
# convert to lower case and remove the parentheses
# add "mean." to front of name of measurements since we will be computing the
# mean of the measurements
clean_measure_names <- function(dirty_names) {
    phase1_names <- gsub("-([XYZ])$", ".\\1", dirty_names)
    phase2_names <- tolower(gsub("-(mean|std)\\(\\)", ".\\1", phase1_names))
    sub("^(.*)$", "mean.\\1", phase2_names)    
}

get_partial_dataset <- function(dir) {
    xtrain <- get_x(feature_names, sub_dir)
    ytrain <- get_y(activity_labels, sub_dir)
    train_subjects <- get_subjects(sub_dir)
    cbind(xtrain, train_subjects, ytrain)
}
# the main function that processes the data from the various files
run_analysis <- function() {
    download_data()
    setwd("./UCI\ HAR\ Dataset") # makes it easier to access the data files
    print("Reading HAR dataset components")
    activity_labels <- get_activity_labels()
    feature_names <- get_feature_names()
    
    train <- get_partial_dataset("train")
    test  <- get_partial_dataset("test")    
    setwd("..") # done with reading the HAR data
    
    # 1: kahuna, as in the big kahuna, contains all of train & test 
    kahuna <- rbind(train, test)
    # 2: Extracts only the measurements on the mean and standard deviation
    # for each measurement.
    mean_std_data_only <- kahuna[, grep("^[a-zA-z]*-(mean|std)\\(\\)", names(kahuna))]

    # 3: Uses descriptive activity names to name the activities in the
    # data set
    # Convert activity to lower case and keep the text the same, remove "_"
    activity <- factor(tolower(gsub("_", "", as.character(kahuna$Activity))))
    
    # 4: Appropriately labels the data set with descriptive variable names
    names(mean_std_data_only) <- clean_measure_names(names(mean_std_data_only))
    subject <- kahuna$Subject

    # 5: From the data set in step 4, creates a second, independent tidy data
    # set with the average for each variable for each activity and each subject.
    print("Tidying, cleaning and summarizing HAR data for new tidy dataset")
    tidy_and_clean <- tbl_df(cbind(mean_std_data_only, activity, subject)) %>%
        group_by(activity, subject) %>%
        summarise_each(c("mean"),
                       mean.tbodyacc.mean.x:mean.fbodybodygyrojerkmag.std) %>%
        arrange(activity, subject)
    
    # done cleaning, write out the table
    write.table(tidy_and_clean, "tidy_data.txt", row.names = FALSE)
    tidy_and_clean
}


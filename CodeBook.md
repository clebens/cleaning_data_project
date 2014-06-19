# Code Book for Course Project

## Summary

This project includes a single source script, run_analysis.R, that is configured to extract and clean data collected from accelerometers from a Samsung Galaxy S smartphone. The source data is contained in a data/ subdirectory of the working directory of the run_analysis.R script. Cleaned data is output in CSV format in an output/ subdirectory of the working directory of the run_analysis.R script.

## Variables

* **data_dir** - directory containing the data sources

* **output_dir** - directory in which output files will be output; output files will be output in CSV format

* **activities** - vector of the activities indexed by the corresponding activity identifier

* **x_[test/train]** - includes raw accelerometer data extracted from a corresponding file located at "data/train/X_train.txt" or "data/test/X_test.txt"

* **y_[test/train]** - includes an acitivity identifier associated with the extracted accelerometer data; row-aligned with the accelerometer data

* **s_[test/train]** - includes a subject identifier associated with the extracted accelerometer data; row-aligned with the accelerometer data

* **test_data** - includes all of the test data with the x_test data simplified to include only the average and standard deviation of each measurement

* **train_data** - includes all of the training data with the x_train data simplified to include only the average and standard deviation of each measurement

* **combinded_data** - includes test_data combined with train_data to create a single dataset in the format: Subject, Activity, Mean of Test Data, Standard Deviation of Test Data

* **tidy_data** - includes a tidy data set with the average of each variale for each activity and each subject

## Methodology

* Declare Helper Variables
* Load data from source files
* Rename columns for Subject and Activity Datasets
* Reset values for Activity from indexes to descriptive activity names
* Find mean and standard deviation for each reading
* Combine subject, activity, mean, and standard deviation into a single test_data data frame representing the test data
* Combine subject, activity, mean, and standard deviation into a single train_data data fram representing the simplified training data
* Combine the rows of test_data and train_data to create a single completed_data data frame representing both the test_data and train_data data frames
* Output the combined_data data frame to an output file
* Get the averages for each activity of each subject, and store the results in a tidy_data data frame
* Output the tidy_data data frame to a file

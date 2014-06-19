# Getting and Cleaning Data Course Project

## Summary

This project includes a single source script, run_analysis.R, that is configured to extract and clean data collected from accelerometers from a Samsung Galaxy S smartphone. The script is configured to operate on source data contained in the working directory of the run_analysis.R script. Cleaned data is output in CSV format in an output/ subdirectory of the working directory of the run_analysis.R script.

Assuming the script is present in the base directory of the dataset provided for this project (i.e. in the same directory as README.txt), executing 'R run_analysis.R' should perform the script and output to an './output/' subdirectory. If command line R is not present, the 'data_dir' and 'output_dir' variables can be adjusted to target different data source and output directories.

## Output Data

### combined_data.csv

Includes accelerometer data indexed by subject and activity. Each subject includes multiple readings associated with each activity. Each reading includes an average and standard deviation of 561 acquired measurements associated with the reading.

Configured to be output to output/combined_data.csv by default. 

#### Data Format:

| Subject 	| Activity | Mean | Std.Dev |
| --------- | -------- | ---- | ------- |

* Subject - numerical index associated with a subject from whom the measurements were acquired
* Activity - descriptive name of the activity performed by the subject during the measurements acquired for the reading
* Mean - the mean of the measurements acquired as the subject performed the activity
* Std.Dev - the standard deviation of the measurements acquired as the subject performed the activity

### tidy_data.csv

Includes data defining the average readings of each subject's measurements associated with a particular activity. There is exactly one row associated with each activity performed by each subject.

#### Data Format:

| Subject | Activity | Mean |

* Subject - numerical index associated with a subject from whom the measurements were acquired
* Activity - descriptive name of the activity performed by the subject during the measurements acquired for the readings
* Mean - the mean of the measurements acquired for all readings associated with a subject performing the associated activity

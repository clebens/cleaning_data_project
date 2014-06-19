# Variables

data_dir <- "./"

output_dir <- "./output/"
if (!file.exists(output_dir)) {
  dir.create(output_dir)
}

activities <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                "SITTING", "STANDING", "LAYING")


# Load Files
s_train_file <- paste(data_dir, "train/subject_train.txt", sep="")
s_train <- read.table(s_train_file, sep="", header=FALSE)

x_train_file <- paste(data_dir, "train/X_train.txt", sep="")
x_train <- read.table(x_train_file, sep="", header=FALSE)

y_train_file <- paste(data_dir, "train/Y_train.txt", sep="")
y_train <- read.table(y_train_file, sep="", header=FALSE)

s_test_file <- paste(data_dir, "test/subject_test.txt", sep="")
s_test <- read.table(s_test_file, sep="", header=FALSE)

x_test_file <- paste(data_dir, "test/X_test.txt", sep="")
x_test <- read.table(x_test_file, sep="", header=FALSE)

y_test_file <- paste(data_dir, "test/Y_test.txt", sep="")
y_test <- read.table(y_test_file, sep="", header=FALSE)

# Rename Meaningful Columns

colnames(s_train)[1] <- "Subject"
colnames(y_train)[1] <- "Activity"

colnames(s_test)[1] <- "Subject"
colnames(y_test)[1] <- "Activity"

# Replace Activity Labels with Activity Names
# Only 6 cases -> elected to hard code for simplicity

y_train[y_train$Activity == 1, "Activity"] <- "WALKING"
y_train[y_train$Activity == 2, "Activity"] <- "WALKING_UPSTAIRS"
y_train[y_train$Activity == 3, "Activity"] <- "WALKING_DOWNSTAIRS"
y_train[y_train$Activity == 4, "Activity"] <- "SITTING"
y_train[y_train$Activity == 5, "Activity"] <- "STANDING"
y_train[y_train$Activity == 6, "Activity"] <- "LAYING"

y_test[y_test$Activity == 1, "Activity"] <- "WALKING"
y_test[y_test$Activity == 2, "Activity"] <- "WALKING_UPSTAIRS"
y_test[y_test$Activity == 3, "Activity"] <- "WALKING_DOWNSTAIRS"
y_test[y_test$Activity == 4, "Activity"] <- "SITTING"
y_test[y_test$Activity == 5, "Activity"] <- "STANDING"
y_test[y_test$Activity == 6, "Activity"] <- "LAYING"

# Find mean and std_dev for x measurements, store in tidy table
x_test_mean <- rowMeans(x_test)
x_test_sd <- apply(x_test, 1, sd)
x_test_tidy <- cbind(x_test_mean, x_test_sd)
colnames(x_test_tidy) <- c("Mean", "Std.Dev")
  
x_train_mean <- rowMeans(x_train)
x_train_sd <- apply(x_train, 1, sd)
x_train_tidy <- cbind(x_train_mean, x_train_sd)
colnames(x_train_tidy) <- c("Mean", "Std.Dev")

# Combined Test Data including:
# Subject, Activity, Mean of Test Data, Standard Dev. of Test Data
test_data <- cbind(s_test, y_test, x_test_tidy)

# Combined Train Data including:
# Subject, Activity, Mean of Test Data, Standard Dev. of Test Data
train_data <- cbind(s_train, y_train, x_train_tidy)

# Combined Test Data and Train Data rbinded to form
# A single data set
combined_data <- rbind(test_data, train_data)

# Write Combined Data to CSV file
output_file <- paste(output_dir, "/combined_data.csv", sep="")
write.table(combined_data, output_file, sep=",")

# Get Averages for Subject

tidy_data <- data.frame(Subject=as.numeric(), Activity=character(), Mean=as.numeric())
  
for (subject in 1:30) {
 for (activity in activities) {
   cur_entry <- combined_data[combined_data$Activity == activity & 
                   combined_data$Subject == subject, "Mean"]
   cur_mean <- mean(cur_entry)
   cur_data <- data.frame(Subject=subject, Activity=activity, Mean=cur_mean)
   tidy_data <- rbind(tidy_data, cur_data)
 } 
}

# Write Tidy Data to CSV file
output_file <- paste(output_dir, "/tidy_data.csv", sep="")
write.table(tidy_data, output_file, sep=",")

library(dplyr)
("C:/Users/rjani/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
#install.packages("data.table")
library(data.table)

#1  Merge Training and Test data

# Define data paths
# data_path <- "C:/Users/rjani/Downloads/getdata_projectfiles_UCI HAR Dataset"

#Read Features and Activity labels
features <- read.table("C:/Users/rjani/Downloads/UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("C:/Users/rjani/Downloads/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity")) 

# Read Training data
subject_train <- read.table("C:/Users/rjani/Downloads/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("C:/Users/rjani/Downloads/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("C:/Users/rjani/Downloads/UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Read test data
subject_test <- read.table("C:/Users/rjani/Downloads/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("C:/Users/rjani/Downloads/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("C:/Users/rjani/Downloads/UCI HAR Dataset/test/y_test.txt", col.names = "code")

# Combine training and test datasets
X_data <- rbind(x_train, x_test)
Y_data <- rbind(y_train, y_test)
Subject_data <- rbind(subject_train, subject_test)

#Merge data into one dataset
Merged_Data <- cbind(Subject_data, Y_data, X_data)

# Check missing data values
missing_data_check <- sum(is.na(Merged_Data))
if (missing_data_check > 0) {
  print(paste("Number of missing data values found in Merged_Data:", missing_data_check))
} else {
  print("No missing data values found in merged dataset.")
}

#2  Extract Relevant Measurements for mean and sd

#Select columns containing mean and sd

# Extract measurements on mean and sd
Tidy_Data <- Merged_Data %>%
  select(matches("subject|code|mean|std"))

#3  Use Descriptive Activity Names

# Replace activity codes with descriptive activity names
Tidy_Data$code <- activities[Tidy_Data$code, 2]


#4  Label Dataset with Descriptive Variable Names

#Rename 'code' column to 'activity'
names(Tidy_Data)[2] = "activity"

#Clean up variable names for better readability
names(Tidy_Data) <- gsub("Acc", "Accelerometer", names(Tidy_Data))
names(Tidy_Data) <- gsub("Gyro", "Gyroscope", names(Tidy_Data))
names(Tidy_Data) <- gsub("BodyBody", "Body", names(Tidy_Data))
names(Tidy_Data) <- gsub("Mag", "Magnitude", names(Tidy_Data))
names(Tidy_Data) <- gsub("tBody", "TimeBody", names(Tidy_Data))
names(Tidy_Data) <- gsub(".mean", "Mean", names(Tidy_Data))
names(Tidy_Data) <- gsub(".std", "STD", names(Tidy_Data))
names(Tidy_Data) <- gsub(".freq", "Frequency", names(Tidy_Data))
names(Tidy_Data) <- gsub("angle", "Angle", names(Tidy_Data))
names(Tidy_Data) <- gsub("gravity", "Gravity", names(Tidy_Data))
names(Tidy_Data) <- gsub("^t", "Time", names(Tidy_Data))
names(Tidy_Data) <- gsub("^f", "Frequency", names(Tidy_Data))

#5  Create Tidy Data Set with Averages

# Group by subject and activity, then calculate mean
Final_Tidy_Data <- Tidy_Data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Write final tidy dataset to file
write.table(Final_Tidy_Data, "Final_Tidy_Data.txt", row.name = FALSE)

# View first few rows of final tidy dataset
head(Final_Tidy_Data, 10)
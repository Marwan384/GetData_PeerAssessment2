####################################################################################
#Reading files.
##Reading Training files
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_train <- read.table("UCI HAR Dataset/train/x_train.txt")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")


##Reading Test files
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_test <- read.table("UCI HAR Dataset/test/x_test.txt")

y_test <- read.table("UCI HAR Dataset/test/y_test.txt")


####################################################################################
#Assign the variables names
##Assign Train variables names
Features <- read.table("UCI HAR Dataset/features.txt")


colnames(subject_train) <- "Subject_ID"
colnames(x_train) <- c(as.vector(Features$V2))
colnames(y_train) <- "Activity_ID"


##Assign Test variables names
colnames(subject_test) <- "Subject_ID"
colnames(x_test) <- c(as.vector(Features$V2))
colnames(y_test) <- "Activity_ID"


####################################################################################
#Merge Files
##Join the training files
Data_Training <- cbind(x_train, y_train, subject_train)


##Join the test files
Data_Test <- cbind(x_test, y_test, subject_test)


Data <- rbind(Data_Training, Data_Test)

rm(Data_Test, Data_Training, x_test, y_test, x_train, y_train, subject_test, subject_train)


####################################################################################
#Extract only the mean and std measires from dataset
Col_IDs <- grep("mean()", Features$V2)
Col_IDs <- c(Col_IDs, grep("std()", Features$V2), 562, 563)

Data_Sub <- Data[,Col_IDs]


####################################################################################
#Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

colnames(activity_labels) <- c("Activity_ID", "Activity_Name")

Data_Sub <- merge(Data_Sub,activity_labels, "Activity_ID" )


####################################################################################
#Average of each variable for each activity and each subject.
library(data.table)

Data_Sub <- as.data.table(Data_Sub)

Data_Mean <- Data_Sub[, lapply(.SD,mean), by = list(Subject_ID, Activity_ID, Activity_Name)]

write.table(Data_Mean, "Data_Mean.txt",  sep = ",", row.names = FALSE)
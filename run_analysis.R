#Loading Libraries
library(dplyr,stringr)

#Reading the data
subject_data_test <- read.table("SamsungData\\test\\subject_test.txt", col.names = "Subject")
subject_data_train <- read.table("SamsungData\\train\\subject_train.txt", col.names = "Subject")

activities_test <- read.table("SamsungData\\test\\y_test.txt",col.names = "Activity")
activities_train <- read.table("SamsungData\\train\\y_train.txt",col.names = "Activity")

features_test <- read.table("SamsungData\\test\\X_test.txt")
features_train <- read.table("SamsungData\\train\\X_train.txt")

#Renaming Features Columns
features_names <- read.table("SamsungData\\features.txt")
colnames(features_test) <- features_names$V2
colnames(features_train) <- features_names$V2

#Merging Train and Test Data
train_data <- bind_cols(subject_data_train,activities_train,features_train)
test_data <- bind_cols(subject_data_test,activities_test,features_test)
tidy_data1 <- bind_rows(test_data,train_data)

#Extracting mean() and std() features.
tidy_data1 <- select(tidy_data1, Subject, Activity,contains("mean()"),contains("std()"))

#Reading the activities labels
activities <- read.table("SamsungData\\activity_labels.txt")
activities <- activities[,2]

#Replacing Activity Labels for activity names
tidy_data1$Activity <- activities[as.numeric(tidy_data1$Activity)]
colnames(tidy_data1)<- str_replace_all(colnames(tidy_data1),c("tB"="TimeB","tG" = "TimeG", "fB" = "FreqB"))
tidy_data1 <- arrange(tidy_data1, Subject)

#For the second tidy data set
tidy_data2 <- tidy_data1 %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))

#Removing additional variables and Writing the final file.
remove(activities_test,activities_train,features_names,features_test,features_train,subject_data_test, subject_data_train, test_data, train_data)
write.table(tidy_data2,"TidyData.txt",row.name=FALSE)
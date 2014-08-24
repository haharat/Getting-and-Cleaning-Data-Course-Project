## step 1, 4
features = read.table("features.txt", sep = "")

# replace "-", "()", "," in the feature with "." which is legal in R, to be used as column names later on
newfeatures = gsub("-|\\()-|\\,", ".", features$V2)
activity_labels = read.table("activity_labels.txt", sep = "", col.names = c("label", "activity"))
x_train = read.table("X_train.txt", sep = "", col.names = newfeatures) # using "newfeatures" as column names so that column names do not contain illegal symbols
x_test = read.table("X_test.txt", sep = "", col.names = newfeatures)
y_train = read.table("Y_train.txt", sep = "", col.names = "activity.labels")
y_test = read.table("Y_test.txt", sep = "", col.names = "activity.labels")
subject_train = read.table("subject_train.txt", sep = "", col.names = "subject")
subject_test = read.table("subject_test.txt", sep = "", col.names = "subject")
train = cbind(subject_train, y_train, x_train)
test = cbind(subject_test, y_test, x_test)
combine = rbind(train, test)


## step 2

# find column numbers corresponding to columns contain only mean and standard deviation for each measurement, which is the same as the row number in the feature data table
mean = grep("mean()", features$V2, fixed = T)
std = grep("std()", features$V2, fixed = T)
mean.std = c(grep("mean()", features$V2, fixed=T), grep("std()", features$V2, fixed = T))

# creat a new table named "tidy1" that contains data only on mean and std by subsetting the "combine" table. I also included the two columns of subject and activity as the first two columns. Therefore "mean.std+2" are the real column numbers to be subsetted in the "combine" dataset
tidy1 = combine[, c(1, 2, mean.std+2)]


## step 3

# replace activity codes and the activity names in the "activity.labels" column
for (i in 1:nrow(activity_labels)) {
    id = which(combine$activity.labels==i)
    combine$activity.labels[id] = as.character(activity_labels$activity[i])
}


# step 5

# creat a new data table named "tidy2" with the average of each variable for each activity and each subject
tidy2 = aggregate(tidy1[, 3:68], by = list(subject = tidy1$subject, activity = tidy1$activity.labels), FUN = mean)

# creat a file with "tidy2" dataset
write.table(tidy2, "tidy2.txt", sep = "", row.name=FALSE)

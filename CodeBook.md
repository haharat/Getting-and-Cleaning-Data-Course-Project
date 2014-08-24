Getting and cleaning data - course project code book
========================================================
## Data frames created

* features: the 561 types of features recorded in the experiment
* newfeatures: the name of features containing legal symbols only in R
* activity_labels: the types of activity recorded and their digital labels
* x_train: the training dataset
* x_test: the testing dataset
* y_train: the training labels
* y_test: the testing labels
* subject_train: the subjects whose activities are used as the training set
* subject_test: the subjects whose activities are used as the testing set
* train: the dataset containing subject, activity, and measurements in the training set
* test: the dataset containing subject, activity, and measurements in the testing set
* combine: the combined data of both training and testing set
* tidy1: the tidy dataset with only the measurements on the mean and standard deviation for each measurement
* tidy2: the tidy dataset with the average of each variable for each activity and each subject


## Variable description in the data frames

* subject: the code labeling the volunteers participating in the experiment. The value ranging from 1-30 indicating 30 volunteers
* activity.labels: the type of actity recorded. These include: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* the remaining variables(columns): the 561 features and their measurements

## Data transformation

1. First, I replaced "-", "()", "," in the feature with "." which is legal in R, to be used as column names later on, and stored them in a new dataset named "newfeatures"
2. I then used grep() to find column numbers corresponding to columns contain only mean and standard deviation for each measurement, which is the same as the row number in the feature data table
3. Next, I created a new table named "tidy1" that contains data only on mean and std by subsetting the "combine" table. I also included the two columns of subject and activity as the first two columns. Therefore "mean.std+2" are the real column numbers to be subsetted in the "combine" dataset
4. I then replaced activity codes with activity names in the "activity.labels" column so that the values are descriptive
5. Lastly, I created a new data table named "tidy2" with the average of each variable for each activity and each subject

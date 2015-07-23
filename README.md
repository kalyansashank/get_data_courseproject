##README
This is the README file to explain how to use the R scripts which can be found in the same repository as this README.md file.

###Scripts submitted

* download_samsungdata.R
* run_analysis.R

###download_samsungdata.R

####Additional R Packages needed to run this script: None

####Working
* This script downloads the .zip file containing the UCI HAR Dataset to a down_zipfile.zip in the working directory.
* Then the  directory "UCI HAR Dataset" is extracted from down_zipfile.zip to the working directory.
* There is no need to run this code if the "UCI HAR Dataset" directory containing the proper samsung data is already present in the working directory.

###run_analysis.R

####Additional R Packages needed to run this script: dplyr

####Prerequisites
* Install dplyr package if it is not already installed.
* This script can run as long as the Samsung data is in your working directory.

####Working

* activity_labels.txt is read into R workspace as a dataframe and data regarding activity labels is obtained from this data frame.
* features.txt is read into R workspace as a dataframe and data regarding the feature names( variable names) is obtained from this data frame.

1. Preparing separate dataset for test data.
   * The data frame in y_test.txt containing test activity labels is read. The activity labels column is transformed to factor with levels and labels obtained from activity labels data frame above.  
   * The data frame in subject_test.txt is read in which each row identifies the subject who performed the activity for each window sample.
   * The data frame in X_test.txt is read which contain the feature vectors. The proper column names are given to this data frame by using feature names obtained from features data frame.
   * These these three data frames containing subject, activity and feature data are merged to gether by cbind to obtain test data.
2. Preparing separate dataset for train data.
   * The data frame in y_train.txt containing test activity labels is read. The activity labels column is transformed to factor with levels and labels obtained from activity labels data frame above.  
   
   * The data frame in subject_train.txt is read in which each row identifies the subject who performed the activity for each window sample.
   * The data frame in X_train.txt is read which contain the feature vectors. The proper column names are given to this data frame by using feature names obtained from features data frame.
   * These these three data frames containing subject, activity and feature data are merged to gether by cbind to obtain train data.
3. Merging test and training data sets.
   * The test and training data sets are merged using rbind.
   * The merged data set is then arranged using Subject and Activity columns.
4. Extracting only the measurements on the mean and standard deviation for each measurement. __"meanfreq()" measurements are not taken into account. "Mean" in angle functions are also not taken.__
   * The grep function is used along with lapply to subset the feature names containig "mean()" and "std()" only.
   * Then and index of selected features is prepared and the merged data set is subsetted based on this index.
5. Changing variable names to be more descriptive.
   * The variable name are changed to more descriptive names by using sub fuction.
   * __Now we have a tidy data set.__
6. Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
   * We use dplyr functions here.
   * We group the tidy data in above step by Subject and Activity and summarise the mean of each variable by these.
   *__Here, we have the final tidy data set.__
7. Writing the tidy data to a text file.
   * Write the final tidy data to tidy_data.txt



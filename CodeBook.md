Codebook for tidy_data.txt created for Getting and Cleaning Course Project on Coursera 
---
Author: "Kalyan S Mupparaju" Date: "23 July 2015"

## Project Description
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

##Study design and data processing

###Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

###Description of variables in the raw data
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


###Notes on the original (raw) data 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


##Creating the tidy datafile

###Guide to create the tidy data file

1. Download the zipfile containing the data.
2. Extract the "UCI HAR Dataset" directory to your working directory.
3. Merge the training and the test sets to create one data set.
4. Extract only the measurements on the mean and standard deviation for each measurement. 
5. Use descriptive activity names to name the activities in the data set.
6. Appropriately label the data set with descriptive variable names. 
7. From the data set in above step , create a second, independent tidy data set with the average of each variable for each activity and each subject.


###Cleaning of the data
The entire cleaning process is described in detail in the README.md file which can be found in the same repo as this Codebook.md.  

##Description of the variables in the tidy_data.txt file

Dimensions of the dataset : [180,68] i.e. 180 obs. of 68 variables.

###Explanation of the schema in the variable name:
The variable names of the columns from the third column onwards have a specific schema which makes the variable names to be somewhat compact as well as easily understood.

* **time**: time domain signal obtained from raw signals
* **frequency**: frequency domain signal obtained by applying a Fast Fourier Transform (FFT) to time domain signals.
* **body**: the acceleration or angular velocity signal of the body alone.
* **gravity**: the acceleration signal due to the gravity.
* **accelerometer**: the accelerometer signal which is the acceleration.
* **gyroscope**: the gyroscope signal which is the angular velocity.
* **jerk**: jerk signals which are the derivatives of the acceleration or angular velocity signals
* **magnitute**: magnitude of the three dimentional signals calculated using Euclidean norm.
* **mean**: mean of the signals of each particular type.
* **standard_deviation**: standard deviation mean of the signals of each particular type.
* **X/Y/Z**: to indicate the signal along X or Y or Z axis of the device.

###Subject
An identifier of the subject who carried out the experiment.

* Class: integer
* Unique values: 1 2 3 ... 29 30

###Activity
Activity label.

* Class: factor
* Levels: 

   1. WALKING
   2. WALKING_UPSTAIRS

   3. WALKING_DOWNSTAIRS
   4. SITTING 
   5. 
STANDING
   6. LAYING


###time-body-accelerometer-mean-X
The mean of time domain body acceleration signal along X axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-mean-Y
The mean of time domain body acceleration signal along Y axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-mean-Z
The mean of time domain body acceleration signal along Z axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-standard_deviation-X
The standard deviation of time domain body acceleration signal along X axis.

* Class: numeric 
* Units: seconds(not sure about this)

###time-body-accelerometer-standard_deviation-Y
The standard deviation of time domain body acceleration signal along Y axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-standard_deviation-Z
The standard deviation of time domain body acceleration signal along Z axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-gravity-accelerometer-mean-X
The mean of time domain gravity acceleration signal along X axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-gravity-accelerometer-mean-Y
The mean of time domain gravity acceleration signal along Y axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-gravity-accelerometer-mean-Z
The mean of time domain gravity acceleration signal along Z axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-gravity-accelerometer-standard_deviation-X
The standard deviation of time domain gravity acceleration signal along X axis.

* Class: numeric
* Units: seconds(not sure about this) 

###time-gravity-accelerometer-standard_deviation-Y
The standard deviation of time domain gravity acceleration signal along Y axis.

* Class: numeric
* Units: seconds(not sure about this) 

###time-gravity-accelerometer-standard_deviation-Z
The standard deviation of time domain gravity acceleration signal along Z axis.

* Class: numeric 
* Units: seconds(not sure about this)

###time-body-accelerometer-jerk-mean-X
The mean of time domain jerk signal derived from body acceleration signal along X axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-jerk-mean-Y
The mean of time domain jerk signal derived from body acceleration signal along Y axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-jerk-mean-Z
The mean of time domain jerk signal derived from body acceleration signal along Z axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-jerk-standard_deviation-X
The standard deviation of time domain jerk signal derived from body acceleration signal along X axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-jerk-standard_deviation-Y
The standard deviation of time domain jerk signal derived from body acceleration signal along Y axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-jerk-standard_deviation-Z
The standard deviation of time domain jerk signal derived from body acceleration signal along Z axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-mean-X
The mean of time domain body angular velocity signal along X axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-mean-Y
The mean of time domain body angular velocity signal along Y axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-mean-Z
The mean of time domain body angular velocity signal along Z axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-standard_deviation-X
The standard deviation of time domain body angular velocity signal along X axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-standard_deviation-Y
The standard deviation of time domain body angular velocity signal along Y axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-standard_deviation-Z
The standard deviation of time domain body angular velocity signal along Z axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-jerk-mean-X
The mean of time domain jerk signal derived from body angular velocity signal along X axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-jerk-mean-Y
The mean of time domain jerk signal derived from body angular velocity signal along Y axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-jerk-mean-Z
The mean of time domain jerk signal derived from body angular velocity signal along Z axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-jerk-standard_deviation-X
The standard deviation of time domain jerk signal derived from body angular velocity signal along X axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-jerk-standard_deviation-Y
The standard deviation of time domain jerk signal derived from body angular velocity signal along Y axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-jerk-standard_deviation-Z
The standard deviation of time domain jerk signal derived from body angular velocity signal along Z axis.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-magnitude-mean
The mean of magnitute of the three dimensional time domain body acceleration signal.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-magnitude-standard_deviation
The standard deviation of magnitute of the three dimensional time domain body acceleration signal.

* Class: numeric
* Units: seconds(not sure about this)

###time-gravity-accelerometer-magnitude-mean
The mean of magnitute of the three dimensional time domain gravity acceleration signal.

* Class: numeric
* Units: seconds(not sure about this)

###time-gravity-accelerometer-magnitude-standard_deviation
The standard deviation of magnitute of the three dimensional time domain gravity acceleration signal.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-jerk-magnitude-mean
The mean of magnitute of the three dimensional, time domain jerk signal derived from the body acceleration signal.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-accelerometer-jerk-magnitude-standard_deviation
The standard deviation of magnitute of the three dimensional, time domain jerk signal derived from the body acceleration signal.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-magnitude-mean
The mean of magnitute of the three dimensional, time domain body angular velocity signal.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-magnitude-standard_deviation
The standard deviation of magnitute of the three dimensional, time domain body angular velocity signal.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-jerk-magnitude-mean
The mean of magnitute of the three dimensional, time domain jerk signal derived from the body angular velocity signal.

* Class: numeric
* Units: seconds(not sure about this)

###time-body-gyroscope-jerk-magnitude-standard_deviation
The standard deviation of magnitute of the three dimensional, time domain jerk signal derived from the body angular velocity signal.

* Class: numeric
* Units: seconds(not sure about this)

###frequency-body-accelerometer-mean-X
The mean of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body acceleration signal along X axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-mean-Y
The mean of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body acceleration signal along Y axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-mean-Z
The mean of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body acceleration signal along Z axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-standard_deviation-X
The standard deviation of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body acceleration signal along X axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-standard_deviation-Y
The standard deviation of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body acceleration signal along Y axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-standard_deviation-Z
The standard deviation of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body acceleration signal along Z axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-jerk-mean-X
The mean of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon the jerk signal derived from body acceleration signal along X axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-jerk-mean-Y
The mean of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon the jerk signal derived from body acceleration signal along Y axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-jerk-mean-Z
The mean of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon the jerk signal derived from body acceleration signal along Z axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-jerk-standard_deviation-X
The standard deviation of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon the jerk signal derived from body acceleration signal along X axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-jerk-standard_deviation-Y
The standard deviation of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon the jerk signal derived from body acceleration signal along Y axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-jerk-standard_deviation-Z
The standard deviation of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon the jerk signal derived from body acceleration signal along Z axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-gyroscope-mean-X
The mean of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body angular velocity signal along X axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-gyroscope-mean-Y
The mean of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body angular velocity signal along Y axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-gyroscope-mean-Z
The mean of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body angular velocity signal along Z axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-gyroscope-standard_deviation-X
The standard deviation of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body angular velocity signal along X axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-gyroscope-standard_deviation-Y
The standard deviation of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body angular velocity signal along Y axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-gyroscope-standard_deviation-Z
The standard deviation of frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body angular velocity signal along Z axis.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-magnitude-mean
The mean of magnitude of three dimensional frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body acceleration signal.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-magnitude-standard_deviation
The mean of standard deviation of three dimensional frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body acceleration signal.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-jerk-magnitude-mean
The mean of magnitude of three dimensional frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon the jerk signal derived from body acceleration signal.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-accelerometer-jerk-magnitude-standard_deviation
The standard deviation of magnitude of three dimensional frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon the jerk signal derived from body acceleration signal.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-gyroscope-magnitude-mean
The mean of magnitude of three dimensional frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body angular velocity signal.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-gyroscope-magnitude-standard_deviation
The standard deviation of magnitude of three dimensional frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon body angular velocity signal.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-gyroscope-jerk-magnitude-mean
The mean of magnitude of three dimensional frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon the jerk signal derived from body angular velocity signal.

* Class: numeric
* Units: Hertz(not sure about this)

###frequency-body-gyroscope-jerk-magnitude-standard_deviation
The standard deviation of magnitude of three dimensional frequency domain signal obtained by applying a Fast Fourier Transform (FFT) upon the jerk signal derived from body angular velocity signal.

* Class: numeric
* Units: Hertz(not sure about this)

##Note
My understanding of this dataset is that the units of measurement for the time domain variables is "seconds" and frequency domain variables is "Hertz. However, I may be wrong about the units.
 
##Sources
The README.txt and features_info.txt provided along with the UCI HAR Dataset. 

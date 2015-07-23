## Use this code to download the zip file containing the samsung data and 
## extract the "UCI HAR Dataset" directory to your working directory.

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "~/down_zipfile.zip")
unzip("down_zipfile.zip", exdir = "~")
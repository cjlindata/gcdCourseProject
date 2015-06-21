##
##  James Lin
##  6/9/2015
##  
library(dplyr)
library(stringr)
library(data.table)
library(reshape2)
library(tidyr)
##
## Collection of the raw data
##
x_testDatadf <- read.table('./UCI HAR Dataset/test/X_test.txt', fill=TRUE, header =FALSE)
y_testDatadf <- read.table('./UCI HAR Dataset/test/Y_test.txt', fill=TRUE, header =FALSE)
testSubjectdf <- read.table('./UCI HAR Dataset/test/subject_test.txt',  header =FALSE)
x_trainDatadf <- read.table('./UCI HAR Dataset/train/X_train.txt', fill=TRUE, header =FALSE)
y_trainDatadf <- read.table('./UCI HAR Dataset/train/Y_train.txt', fill=TRUE, header =FALSE)
trainSubjectdf <- read.table('./UCI HAR Dataset/train/subject_train.txt', header =FALSE)
features <- read.table('./UCI HAR Dataset/features.txt', header =FALSE)
activityLabels <- read.table('./UCI HAR Dataset/activity_labels.txt', header =FALSE)

##
## Create the tidy datafile
##

## Merge rows and set column names
x_allDatadf<- rbind(x_trainDatadf,x_testDatadf)
names(x_allDatadf) <- features[,2]
y_allDatadf<- rbind(y_trainDatadf,y_testDatadf)
names(y_allDatadf) <- c("activity")
subjectdf <- rbind(trainSubjectdf,testSubjectdf)
names(subjectdf) <- c("subject")

## Merge columns 
raw_df <- cbind(subjectdf,y_allDatadf)
raw_df <- cbind(raw_df,x_allDatadf)

## remove duplicated columns -- there are neither mean() nor std() anyway
raw_df <- raw_df[,!duplicated(colnames(raw_df))]

## uses decriptive activity names to name the activities in the data set
raw_df[,2] <- activityLabels[raw_df[,2],2]

##
## Load into  data frame table for dplyr 
## Extracts the Mean and std columns 
##
raw_tbl <- tbl_df(raw_df)
raw_tbl <- select(raw_tbl,grep("activity|subject|mean\\(\\)|std\\(\\)",colnames(raw_tbl)))

##
## Cleaning the tidy datafile
##
tidy_t <- melt(raw_tbl, id.var= c("subject","activity"))

#--- Break down variables by "-" t3 is a char matrix
t3 <- str_split_fixed(tidy_t$variable, "-",3)
tidy_t$sensor[str_detect(t3[,1],"Acc")] <- "Acc"
tidy_t$sensor[str_detect(t3[,1],"Gyro")] <- "Gyro"
## --- remove mean and std
tidy_t$signal <- paste(t3[,1],t3[,3],sep="-")
tidy_t$estimated <- str_sub(t3[,2],1,-3)
## -- drop variable column
tidy_t$variable <- NULL
## -- group by subject,activity,sensor,signal,estimated
tidy_group <- group_by(tidy_t,subject,activity,sensor,signal,estimated)
## -- summarize group by by their mean
tidy_report <- summarize(tidy_group,mean(value))
## -- write to a text file
write.table(tidy_report,file="./cjlinTidy.txt",row.name=F)

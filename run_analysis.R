library(dplyr)

##Next instructions are related with loading the raw data in R variables

setwd("~/Especializacion Data Science/Carpeta Datos/UCI HAR Dataset")
setwd("./train")
y_train<-read.table("y_train.txt")
colnames(y_train)<-"s2"
x_train<-read.table("X_train.txt")
subject_train<-read.table("subject_train.txt")
colnames(subject_train)<-"s1"
setwd("..")
activity_labels<-read.table("activity_labels.txt")
colnames(activity_labels)<-"Activity"
features<-read.table("features.txt")
setwd("./test")
y_test<-read.table("y_test.txt")
colnames(y_test)<-"s2"
x_test<-read.table("X_test.txt")
subject_test<-read.table("subject_test.txt")
colnames(subject_test)<-"s1"
##These instructions merge the data from Test & Training, including Activity
##and Subject test. The variable called total1 have a subsetting of data
##including only the mean() and std() in X,Y and Z coordinates.

test<-cbind(subject_test,y_test,x_test)
train<-cbind(subject_train,y_train,x_train)
total<-rbind(test,train)
total1<-select(total,s1:V6)

##Next instructions assign correct & descriptive names to each variable 
##in tidy data set

nombres3<-c("Subject", "Activity","MediaX","MediaY","MediaZ","StdX","StdY","StdZ")
names(total1)<-nombres3

## Categories on Activity 
##Next instruction change the numeric levels for Activity variable to 
##names included in activity_label file.
activity<-select(total1,Activity)
Act1<-mutate(activity,ref=rownames(activity))

act2<-filter(Act1,Activity==1)
act2$Activity<-activity_labels[1,2]

act3<-filter(Act1,Activity==2)
act3$Activity<-activity_labels[2,2]

act4<-filter(Act1,Activity==3)
act4$Activity<-activity_labels[3,2]

act5<-filter(Act1,Activity==4)
act5$Activity<-activity_labels[4,2]

act6<-filter(Act1,Activity==5)
act6$Activity<-activity_labels[5,2]

act7<-filter(Act1,Activity==6)
act7$Activity<-activity_labels[6,2]

Act8<-rbind(act2,act3,act4,act5,act6,act7)
Act8<-mutate(Act8,refnum=as.numeric(ref))
Act8<-arrange(Act8,refnum)
Act8<-select(Act8,Activity)
total1<-select(total1,-Activity)
total1<-cbind(Act8,total1)
write.csv(total1,"HAR_data_mean_std_XYZ.txt")

## codebook_total1<-codebook(total1)
## write.csv(codebook_total1,"codebook.txt")
##Next instruction groups the kind of activity (according to Activity_Labels)
##and second variable groups the 30 subjects.
##

by_Activity<-group_by(total1,Activity)
by_Subject<-group_by(total1,Subject)

tidy_by_activity<-summarise(by_Activity,mean(MediaX),mean(MediaY),mean(MediaZ),mean(StdX),mean(StdY),mean(StdZ))
##write.csv(tidy_by_activity,"Summary_HAR_activity.txt")
tidy_by_subject<-summarise(by_Subject,mean(MediaX),mean(MediaY),mean(MediaZ),mean(StdX),mean(StdY),mean(StdZ))
##write.csv(tidy_by_subject,"Summary_HAR_subject.txt")

tidy<-cbind(tidy_by_subject, tidy_by_activity)
write.csv(tidy,"Summary_HAR_activity_and_subject.txt")

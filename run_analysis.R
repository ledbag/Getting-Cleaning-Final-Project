library(dplyr)
library(data.table)

##Next instructions are related with loading the raw data in R variables

setwd("~/Especializacion Data Science/Carpeta Datos/UCI HAR Dataset")
setwd("./train")
y_train<-read.table("y_train.txt")
colnames(y_train)<-"Activity"
x_train<-read.table("X_train.txt")
subject_train<-read.table("subject_train.txt")
colnames(subject_train)<-"Subject"
setwd("..")
activity_labels<-read.table("activity_labels.txt")
colnames(activity_labels)<-"Activity"
features<-read.table("features.txt")
setwd("./test")
y_test<-read.table("y_test.txt")
colnames(y_test)<-"Activity"
x_test<-read.table("X_test.txt")
subject_test<-read.table("subject_test.txt")
colnames(subject_test)<-"Subject"
##These instructions merge the data from Test & Training, including Activity
##and Subject test. The variable called total1 have a subsetting of data
##including only the mean() and std() in X,Y and Z coordinates.
features1<-as.vector(features$V2)
colnames(x_test)<-features1
colnames(x_train)<-features1


test<-cbind(subject_test,y_test,x_test)
train<-cbind(subject_train,y_train,x_train)
total<-rbind(test,train)
total.set <- total[, grep("-mean\\(\\)|-std\\(\\)", colnames(total),value = TRUE)]
Subject<-total$Subject
Activity<-total$Activity
total.set<-cbind(Subject,Activity,total.set)

##Next instructions assign correct & descriptive names to each variable 
##in tidy data set


## Categories on Activity 
##Next instruction change the numeric levels for Activity variable to 
##names included in activity_label file.
activity<-select(total.set,Activity)
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
total.set<-select(total.set,-Activity)
total.set<-cbind(Act8,total.set)

##Next steps set the names of tidy data

names(total.set) 	<-gsub("Acc", "Acelerometro ", names(total.set),ignore.case = TRUE)
names(total.set) 	<-gsub("Gyro", "Giroscopio ", names(total.set),ignore.case = TRUE)
names(total.set) 	<-gsub("BodyBody", "Cuerpo ", names(total.set),ignore.case = TRUE)
names(total.set) 	<-gsub("Mag", "Magnitude ", names(total.set),ignore.case = TRUE)
names(total.set)	<-gsub("^t", "Tiempo ", names(total.set),ignore.case = TRUE)
names(total.set)	<-gsub("^f", "Frecuencia ", names(total.set),ignore.case = TRUE)
names(total.set)	<-gsub("tBody", "Tiempo Cuerpo", names(total.set),ignore.case = TRUE)
names(total.set)	<-gsub("-mean()", "Media ", names(total.set), ignore.case = TRUE)
names(total.set)	<-gsub("-std()", "Desviacion Standar ", names(total.set), ignore.case = TRUE)
names(total.set)	<-gsub("-freq()", "Frecuencia ", names(total.set), ignore.case = TRUE)
names(total.set)	<-gsub("angle", "Angulo ", names(total.set),ignore.case = TRUE)
names(total.set)	<-gsub("gravity", "Gravedad ", names(total.set),ignore.case = TRUE)


write.csv(total.set,"HAR_data_mean_std_XYZ.txt")

total.set$Subject <- as.factor(total.set$Subject)
TidyData <- data.table(total.set)
TidyData <- aggregate(. ~Subject + Activity, TidyData, mean)
TidyData <- TidyData[order(TidyData$Subject,TidyData$Activity),]
write.table(TidyData, file = "By_group_data_mean_std.txt", row.names = FALSE)


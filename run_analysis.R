library(data.table)
library(magrittr)
options(stringsAsFactors = F)

path=paste0(getwd(),"/UCI HAR Dataset/")
features= paste0(path,"features.txt") %>% read.table
activity_labels= paste0(path,"activity_labels.txt") %>% read.table
cols=features$V2 %>% grep("mean\\(\\)|std\\(\\)",.)

datalist=list()
for (i in c("train","test")){
      #reading x and selecting columns
      x = path %>% paste0("%s/x_%s.txt") %>% sprintf(i,i) %>% read.table
      x=x[,cols]
      names(x)=features$V2[cols]
      #reading y
      y = path %>% paste0("%s/y_%s.txt") %>% sprintf(i,i) %>% read.table
      names(y)="activity"
      # reading subjects
      subject = path %>% paste0("%s/subject_%s.txt") %>% sprintf(i,i) %>% read.table
      names(subject)="subject"
      #combining to one data.frame
      tmp= cbind(x,y,subject)
      #adding sample info
      tmp$sample=i
      datalist[[i]]=tmp %>% setDT
}
#getting rid off temporary  data
rm(x,y,subject,tmp)
dt=rbindlist(datalist,fill=T)
# approptiate activity labeling
dt$activity %<>% factor(labels=activity_labels$V2)
#dt is desired data.frame/data.table
write.csv(dt,"clean_data.csv",row.names = F)
#mean summmary from dt
dtmeans=dt[,lapply(.SD, mean),by=.(activity,subject,sample)]
write.csv(dtmeans,"clean_data_means.csv",row.names = F)
dtmeans=dt[,lapply(.SD, mean),by=.(subject,sample),.SDcols=1:length(cols)]
write.csv(dtmeans,"clean_data_subject_means.csv",row.names = F)
dtmeans=dt[,lapply(.SD, mean),by=.(activity,sample),.SDcols=1:length(cols)]
write.csv(dtmeans,"clean_data_activity_means.csv",row.names = F)

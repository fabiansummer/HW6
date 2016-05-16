#讀csv資料
polio<-read.csv("POLIO_Incidence.csv",stringsAsFactors = F)
head(polio)

#將寬表格轉為長表格，以年(YEAR)/週(WEEK)為基準，各州名column打散變長
library(reshape2) #for melt()
polio.m<-melt(polio,id.vars = c('YEAR','WEEK'))
head(polio.m)

polio.m[polio.m$value=="-",]$value<-NA #處理缺值,將"-"轉為NA
polio.m$value<-as.numeric(polio.m$value) #將value欄位轉為數字
polio.sumYear<- #各州各年度加總，計算該年度的總發生率
  aggregate(value~YEAR+variable,data=polio.m,FUN=sum,na.rm=F)
head(polio.sumYear)

# Obdelava, uvoz in čiščenje podatkov.

stevilo.goveda<-read.csv2("stevilo-goveda.csv",sep = ";",nrows=69, skip=2,as.is = TRUE,na.strings="-",col.names=c("ŠTEVILO GOVEDA","",paste("leto",2007:2013),"Povprečje EU"),fileEncoding = "Windows-1250")
ok.stolpci<-substr(names(stevilo.goveda),1,4)=="leto"
povprecje<-apply(stevilo.goveda[,ok.stolpci],1,mean,na.rm=TRUE)
data.frame(povprečje=povprecje)
stevilo.goveda<-merge(stevilo.goveda,data.frame(povprečje=povprecje),by=0,all=TRUE)


> ocena<-rep("solidno",length(paste("leto",2007:2013)))
> ok.stolpci<-substr(names(stevilo.goveda),1,4)=="leto"
> ocena[stevilo.goveda[2,ok.stolpci]<462000]<-"slabo"
> ocena[stevilo.goveda[2,ok.stolpci]>470000]<-"odlično"
> oce<-factor(ocena,levels=c("slabo","solidno","odlično"),ordered=TRUE)
> stevilo.goveda["ocena",ok.stolpci]<-oce

library(XML)
naslov = "http://www.fmf.uni-lj.si/si/studij-matematike/financna-matematika/"
doc <- htmlTreeParse(naslov, encoding = "UTF-8", useInternal = TRUE)

http://pxweb.stat.si/pxweb/Dialog/Saveshow.asp


stevilo.prasicev<-read.csv2("stevilo-prasicev.csv",skip=2, na.strings=" ",fileEncoding="Windows-1250",col.names=c("ŠTEVILO PRAŠIČEV"," ",paste("leto",2007:2013)))


Tukaj bomo imeli program, ki bo obdelal, uvozil in očistil podatke (druga faza
projekta).

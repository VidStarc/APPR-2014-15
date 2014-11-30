# 2. faza: Uvoz podatkov

#funkcija, ki uvozi podatke iz datoteke stevilo-goveda.csv
uvozistevilo<-function(){
  setwd("G:/VID/fmf/anppr/project/APPR-2014-15/uvoz")
  d<-dir()
  z <- grep("\\.csv$", d)
  return(read.csv2("stevilo-goveda.csv", skip=2,nrows=69,na.strings="-",
          col.names=c("ŠTEVILO GOVEDA","vrste goveda",paste("leto",2007:2013),"Povprečje EU"),
          fileEncoding = "Windows-1250"))
}
# Zapišimo podatke v razpredelnico stevilo goveda.
cat("Uvažam podatke o stevilu goveda...razpredelnica stevilo.goveda\n\n")
stevilo.goveda<-uvozistevilo()

ok.stolpci<-substr(names(stevilo.goveda),1,4)=="leto"
povprecje<-apply(stevilo.goveda[,ok.stolpci],1,mean,na.rm=TRUE)
data.frame(povprečje=povprecje)
stevilo.goveda<-merge(stevilo.goveda,data.frame(povprečje=povprecje),by=0,all=TRUE)

ocena<-rep("solidno",length(paste("leto",2007:2013)))
ok.stolpci<-substr(names(stevilo.goveda),1,4)=="leto"
ocena[stevilo.goveda[2,ok.stolpci]<462000]<-"slabo"
ocena[stevilo.goveda[2,ok.stolpci]>470000]<-"odlično"
oce<-factor(ocena,levels=c("slabo","solidno","odlično"),ordered=TRUE)
stevilo.goveda["ocena",ok.stolpci]<-oce

uvozi2<-function(){
  setwd("G:/VID/fmf/anppr/project/APPR-2014-15/uvoz")
  d<-dir()
  z <- grep("\\.csv$", d)
  return(read.csv2("stevilo-prasicev.csv", skip=2,nrows=48,na.strings="-",
                   col.names=c("ŠTEVILO PRAŠIČEV","vrste prašičev",paste("leto",2007:2013)),
                   fileEncoding = "Windows-1250"))
}
# Zapišimo podatke v razpredelnico stevilo prasicev.
cat("Uvažam podatke o stevilu prasicev...razpredelnica stevilo.prasicev\n\n")
stevilo.prasicev<-uvozi2()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
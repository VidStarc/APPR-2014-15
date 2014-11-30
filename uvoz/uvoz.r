# 2. faza: Uvoz podatkov

#funkcija, ki uvozi podatke iz datoteke stevilo-goveda.csv
uvozistevilo<-function(){
  setwd("G:/VID/fmf/anppr/project/APPR-2014-15/uvoz")
  d<-dir()
  z <- grep("\\.csv$", d)
  return(read.csv2("stevilo-goveda.csv", skip=2,as.is = TRUE,na.strings="-",
          col.names=c("ŠTEVILO GOVEDA","",paste("leto",2007:2013),"Povprečje EU"),
          fileEncoding = "Windows-1250"))
}
# Zapišimo podatke v razpredelnico stevilo goveda.
cat("Uvažam podatke o stevilu goveda...razpredelnica stevilo.goveda\n\n")
stevilo.goveda<-uvozistevilo()
stevilo.goveda$stevilo.goveda[,3:10] <- as.numeric(stevilo.goveda$stevilo.goveda[,3:10])



# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
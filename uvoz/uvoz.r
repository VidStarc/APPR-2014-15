# 2. faza: Uvoz podatkov

#1.TABELA
#funkcija, ki uvozi podatke iz datoteke stevilo-goveda.csv
uvozi1<-function(){
  return(read.csv2("podatki/stevilo-goveda.csv", skip=2,nrows=69,na.strings=":",
          col.names=c("Kategorija",paste("leto",2007:2013),"Povprečje EU"),
          fileEncoding = "Windows-1250"))
}
# Zapišimo podatke v razpredelnico stevilo goveda.
cat("Uvažam podatke o stevilu goveda...razpredelnica stevilo.goveda\n\n")
stevilo.goveda<-uvozi1()

ok.stolpci<-substr(names(stevilo.goveda),1,4)=="leto"
povprecje<-apply(stevilo.goveda[,ok.stolpci],1,mean,na.rm=TRUE)
stevilo.goveda <- data.frame(stevilo.goveda, povprečje=povprecje)
rownames(stevilo.goveda) <- NULL

stevilo.goveda <- data.frame(Regija = c(rep("Slovenija", 22),
                                        rep("Vzhodna Slovenija", 22),
                                        rep("Zahodna Slovenija", 22)),
                             stevilo.goveda[c(-1, -24, -47),])
rownames(stevilo.goveda) <- NULL

#dodajanje urenjenostne spremenljivke
ocena<-rep("manj",length(stevilo.goveda[,11]))
ocena[stevilo.goveda[,9]<stevilo.goveda[,11]]<-"več"
oce<- factor(ocena, levels = c("manj","več"), ordered = TRUE)
stevilo.goveda["primerjava 2013 in povprečja"]<-oce

#View(stevilo.goveda)


#2.TABELA
#funkcija, ki uvozi podatke iz datoteke stevilo-prasicev.csv
uvozi2<-function(){
  return(read.csv2("podatki/stevilo-prasicev.csv", skip=2,nrows=48,na.strings=":",
                   col.names=c("Kategorija",paste("leto",2007:2013)),
                   fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico stevilo prasicev.
cat("Uvažam podatke o stevilu prasicev...razpredelnica stevilo.prasicev\n\n")
stevilo.prasicev<-uvozi2()

stevilo.prasicev <- data.frame(Regija = c(rep("Slovenija", 15),
                                          rep("Vzhodna Slovenija", 15),
                                          rep("Zahodna Slovenija", 15)),
                               stevilo.prasicev[c(-1, -17, -33),])
rownames(stevilo.prasicev) <- NULL

#View(stevilo.prasicev)


#3.TABELA
#funkcija, ki uvozi podatke iz datoteke stevilo-govedaEU.csv
uvozi3<-function(){
  return(read.csv("podatki/stevilo-govedaEU.csv",header = TRUE, as.is = TRUE, na.strings = ":",
                   col.names=c("Leto","Država","vrsta živine","mesec","enota","število.goveda"),
                   fileEncoding = "Windows-1250"))
}

#zapišimo podatke v razpredelnico stevilo.govedaEU
cat("Uvažam podatke o stevilu goveda v EU...razpredelnica stevilo.govedaEU\n\n")
stevilo.govedaEU<-uvozi3()

stevilo.govedaEU$število.goveda <- as.numeric(gsub(",", "", stevilo.govedaEU$število.goveda))
stevilo.govedaEU<-stevilo.govedaEU[c(-3,-4,-5)]
stevilo.govedaEU$Država[grep("Germany", stevilo.govedaEU$Država)] <- "Germany"
stevilo.govedaEU$Država[grep("Macedonia", stevilo.govedaEU$Država)] <- "Macedonia"
stevilo.goveda.2013 <- stevilo.govedaEU[stevilo.govedaEU$Leto == 2013,]
rownames(stevilo.goveda.2013) <- NULL

#View(stevilo.govedaEU)


#4.TABELA
# Funkcija, ki uvozi podatke iz spletne strani
source("lib/xml.r",encoding="UTF-8")
cat("Uvažam podatke o stevilu ovac...razpredelnica stevilo.ovac\n")
stevilo.ovac<-uvozi.ovce()

# 5.TABELA-stevilo prebivalcev v državah Evrope
uvozi5<-function(){
  return(read.csv("podatki/stevilo-preb.csv",header = TRUE, as.is = TRUE, na.strings = ":",
                  col.names=c("Leto","Država", " ","število.prebivalcev"),
                  fileEncoding = "Windows-1250"))
}

#zapišimo podatke v razpredelnico stevilo.preb
cat("Uvažam podatke o stevilu prebivalcev v EU...razpredelnica stevilo.preb\n\n")
stevilo.preb<-uvozi5()
stevilo.preb<-stevilo.preb[,-3]
stevilo.preb$število.prebivalcev <- as.numeric(gsub(",", "", stevilo.preb$število.prebivalcev))
stevilo.preb$Država[grep("Germany", stevilo.preb$Država)] <- "Germany"
stevilo.preb$Država[grep("Macedonia", stevilo.preb$Država)] <- "Macedonia"

stevilo.goveda.2013<-data.frame(stevilo.goveda.2013,stevilo.preb)
stevilo.goveda.2013<-stevilo.goveda.2013[,c(-4,-5)]
delez<-(stevilo.goveda.2013[,3]*1000)/stevilo.goveda.2013[,4]

stevilo.goveda.2013<-data.frame(stevilo.goveda.2013,delez)

#6.TABELA
uvozi6<-function(){
  return(read.csv2("podatki/govedo-skupaj.csv",header = TRUE,  skip=2 ,nrows=23, as.is = TRUE, 
                   na.strings = ":",col.names=c("leto","stevilo.goveda"),fileEncoding = "Windows-1250"))
}
#zapišimo podatke v razpredelnico stevilo
cat("Uvažam podatke o skupnem stevilu goveda...razpredelnica stevilo\n\n")
stevilo<-uvozi6()

#7.TABELA
uvozi7<-function(){
  return(read.csv2("podatki/ovce-skupaj.csv",header = TRUE,  skip=1 ,nrows=22, as.is = TRUE, 
                   na.strings = ":",col.names=c("leto","stevilo.ovac"),fileEncoding = "Windows-1250"))
}
#zapišimo podatke v razpredelnico stevilo
cat("Uvažam podatke o skupnem stevilu ovac...razpredelnica ovce\n\n")
ovce<-uvozi7()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
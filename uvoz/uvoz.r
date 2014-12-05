# 2. faza: Uvoz podatkov

#funkcija, ki uvozi podatke iz datoteke stevilo-goveda.csv
uvozi1<-function(){
  return(read.csv2("podatki/stevilo-goveda.csv", skip=2,nrows=69,na.strings="-",
          col.names=c("Kategorija",paste("leto",2007:2013),"Povprečje EU","ocena"),
          fileEncoding = "Windows-1250"))
}
# Zapišimo podatke v razpredelnico stevilo goveda.
cat("Uvažam podatke o stevilu goveda...razpredelnica stevilo.goveda\n\n")
stevilo.goveda<-uvozi1()

ok.stolpci<-substr(names(stevilo.goveda),1,4)=="leto"
povprecje<-apply(stevilo.goveda[,ok.stolpci],1,mean,na.rm=TRUE)
data.frame(povprečje=povprecje)
stevilo.goveda <- data.frame(stevilo.goveda, povprečje=povprecje)
rownames(stevilo.goveda) <- NULL

stevilo.goveda <- data.frame(Regija = c(rep("Slovenija", 22),
                                        rep("Vzhodna Slovenija", 22),
                                        rep("Zahodna Slovenija", 22)),
                             stevilo.goveda[c(-1, -24, -47),])
rownames(stevilo.goveda) <- NULL

#urejenostna spremenljivka po vrstici-ni možno
#ocena<-rep("solidno",69)
#ok.stolpci<-substr(names(stevilo.goveda),1,4)=="leto"
#ocena[stevilo.goveda[2,ok.stolpci]<462000]<-"slabo"
#ocena[stevilo.goveda[2,ok.stolpci]>470000]<-"odlično"
#oce<-factor(ocena,levels=c("slabo","solidno","odlično"),ordered=TRUE)
#stevilo.goveda["ocena",ok.stolpci]<-oce

View(stevilo.goveda)


#funkcija, ki uvozi podatke iz datoteke stevilo-prasicev.csv
uvozi2<-function(){
  return(read.csv2("podatki/stevilo-prasicev.csv", skip=2,nrows=48,na.strings="-",
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

View(stevilo.prasicev)







# Funkcija, ki uvozi podatke iz spletne strani
library(XML)
uvozi.ovce <- function() {
  url.ovce <- "podatki/stevilo-ovac.htm"
  doc.ovce <- htmlTreeParse(url.ovce,
                            useInternalNodes=TRUE,encoding="Windows-1250")
  
  tabela <- getNodeSet(doc.ovce,"//table")
  vrstica <- getNodeSet(tabela[[1]], "./tr")
  seznam <- lapply(vrstica[4:length(vrstica)-1], stripByPath, "./td|./th")
  seznam <- lapply(seznam, function(x) x[(length(x)-7):length(x)])
  matrika <- matrix(unlist(seznam),nrow=length(seznam),byrow=TRUE)
  colnames(matrika) <- stripByPath(vrstica[[2]], ".//th")
  return(data.frame(Regija = c(rep("Slovenija", 9),
                               rep("Vzhodna Slovenija", 9),
                               rep("Zahodna Slovenija", 9)),
                    Kategorija = matrika[,1],
                    apply(matrika[,2:8], 2, as.numeric)))
}
cat("Uvažam podatke o stevilu ovac...razpredelnica stevilo.ovac\n")
stevilo.ovac<-uvozi.ovce()
View(stevilo.ovac)










# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
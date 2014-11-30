# Obdelava, uvoz in čiščenje podatkov.

library(XML)
naslov = "http://www.fmf.uni-lj.si/si/studij-matematike/financna-matematika/"
doc <- htmlTreeParse(naslov, encoding = "UTF-8", useInternal = TRUE)

http://pxweb.stat.si/pxweb/Dialog/Saveshow.asp


stevilo.prasicev<-read.csv2("stevilo-prasicev.csv",skip=2, na.strings=" ",fileEncoding="Windows-1250",col.names=c("ŠTEVILO PRAŠIČEV"," ",paste("leto",2007:2013)))


Tukaj bomo imeli program, ki bo obdelal, uvozil in očistil podatke (druga faza
projekta).

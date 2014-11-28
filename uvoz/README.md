# Obdelava, uvoz in čiščenje podatkov.

stevilo.goveda<-read.csv2("stevilo-goveda.csv", skip=2,na.strings="-", col.names=c("ŠTEVILO GOVEDA","",paste("leto",2007:2013),"Povprečje","Povprečje EU")), fileEncoding = "Windows-1250")

stevilo.prasicev<-read.csv2("stevilo-prasicev.csv",skip=2, na.strings=" ",fileEncoding="Windows-1250",col.names=c("ŠTEVILO PRAŠIČEV"," ",paste("leto",2007:2013)))


#Tukaj bomo imeli program, ki bo obdelal, uvozil in očistil podatke (druga faza
#projekta).

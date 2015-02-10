# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")


#1.ZEMLJEVID
# Uvozimo zemljevid slovenije po regijah.
cat("Uvažam zemljevid slovenije...\n")
slo <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2/shp/SVN_adm.zip",
                       "Slovenija", "SVN_adm1.shp", mapa = "zemljevid",
                       encoding = "Windows-1250")

zahod <- c(1,2,6,7)
stolpci <- 6:9
govedo.zahod <- stevilo.goveda[45, stolpci]
govedo.vzhod <- stevilo.goveda[23, stolpci]
norm.zahod <- (govedo.zahod-min(govedo.zahod)*0.98)/(max(govedo.zahod)-min(govedo.zahod)*0.98)
norm.vzhod <- (govedo.vzhod-min(govedo.vzhod)*0.98)/(max(govedo.vzhod)-min(govedo.vzhod)*0.98)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid slovenije...\n")
pdf("slike/slovenija.pdf")

#Spremenjene koordinate in imena za Slovenijo
ko<- coordinates(slo)
imena <- as.character(slo$NAME_1)
rownames(ko) <- imena
names(imena) <- imena
ko["Zasavska",2] <- ko["Zasavska",2]+0.01
ko["Pomurska",1]<-ko["Pomurska",1]+0.05
ko["Obalno-kraška",1] <- ko["Obalno-kraška",1]+0.11
ko["Obalno-kraška",2] <- ko["Obalno-kraška",2]-0.05
ko["Spodnjeposavska",1] <- ko["Spodnjeposavska",1]
ko["Spodnjeposavska",2] <- ko["Spodnjeposavska",2]+0.025
imena["Jugovzhodna Slovenija"] <- "Jugovzhodna\nSlovenija"
imena["Notranjsko-kraška"] <- "Notranjsko-\nkraška"
imena["Obalno-kraška"] <- "Obalno-\nkraška"

# Rišemo zemljevide v mrežo velikosti 2x2
par(mfrow=c(2,2))
for (i in 1:4) {
  plot(slo, col=ifelse(1:nrow(slo) %in% zahod,
                       rgb(0, 0, 1, norm.zahod[[i]]),
                       rgb(0, 1, 0, norm.vzhod[[i]])))
  title(paste("Leto", 2009+i))
  text(ko,labels=imena,cex=0.3)
}

# Povrnemo prvotno nastavitev
par(mfrow=c(1, 1))
dev.off()



#2.ZEMLJEVID
#Uvozimo zemljevid sveta
cat("Uvažam zemljevid sveta...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")

#Dodamo manjkajoči državi-Turčija in Ciper
evro<-svet$continent %in% "Europe" | svet$name_long %in% c("Cyprus","Turkey")

Evro<-svet[evro,]
m <- match(Evro$name_long, stevilo.goveda.2013$Država)

eu<-Evro$name_long %in% stevilo.goveda.2013$Država
EU<-Evro[eu,]

Evro$število<-stevilo.goveda.2013$število.goveda[m]
# podzemljevid za države s podatki - za izpis imen
EU <- Evro[!is.na(m) & ! Evro$name_long %in% c("Montenegro", "Luxembourg"),]

#Uredim koordinate in imena - samo za države s podatki
imena <- as.character(EU$name_long)
koor<- coordinates(EU)
rownames(koor)<-imena
names(imena)<-imena

koor["Cyprus",2] <- koor["Cyprus",2]-0.8
koor["Sweden",1] <- koor["Sweden",1]-1
koor["Greece",1] <- koor["Greece",1]-0.8
koor["United Kingdom",1] <- koor["United Kingdom",1]+0.8
koor["United Kingdom",2] <- koor["United Kingdom",2]-0.8
koor["Croatia",2]<-koor["Croatia",2]+0.6
koor["Croatia",1]<-koor["Croatia",1]+0.4
koor["Slovakia",2]<-koor["Slovakia",2]+0.2
koor["Latvia",1]<-koor["Latvia",1]+0.4
koor["Belgium",1]<-koor["Belgium",1]+0.2


imena["United Kingdom"] <- "United\nKingdom"
imena["Czech Republic"] <- "Czech\nRepublic"
imena["Bosnia and Herzegovina"]<-"BIH"
imena["Slovenia"]<-"SLO"
imena["Macedonia"]<-"MKD"
imena["Netherlands"]<-"NLD"
imena["Denmark"]<-"DNK"

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid o skupnem stevilu goveda v EU...\n")
pdf("slike/evropa.pdf")


rot <- ifelse(imena == "Portugal", 90, 0)
print(spplot(Evro, "število", xlim=c(-25, 40), ylim=c(33, 73),
             main = "Skupno število goveda po državah EU v letu 2013 (v 1000)",
             col.regions = topo.colors(100),
             sp.layout = list(
               list("sp.polygons", Evro[is.na(m),], fill = "white"),
               list("sp.text", koor, imena,col="black", cex = 0.3, srt=rot)),
             par.settings = list(panel.background=list(col="lightblue"))))

dev.off()



#3.ZEMLJEVID
#Uvozimo zemljevid sveta
cat("Uvažam zemljevid sveta...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")

#Dodamo manjkajoči državi-Turčija in Ciper
evro<-svet$continent %in% "Europe" | svet$name_long %in% c("Cyprus","Turkey")

Evro<-svet[evro,]
m <- match(Evro$name_long, stevilo.goveda.2013$Država)

eu<-Evro$name_long %in% stevilo.goveda.2013$Država
EU<-Evro[eu,]

Evro$število<-stevilo.goveda.2013$delez[m]
# podzemljevid za države s podatki - za izpis imen
EU <- Evro[!is.na(m) & ! Evro$name_long %in% c("Montenegro", "Luxembourg"),]

#Uredim koordinate in imena - samo za države s podatki
imena <- as.character(EU$name_long)
koor<- coordinates(EU)
rownames(koor)<-imena
names(imena)<-imena

koor["Cyprus",2] <- koor["Cyprus",2]-0.8
koor["Sweden",1] <- koor["Sweden",1]-1
koor["Greece",1] <- koor["Greece",1]-0.8
koor["United Kingdom",1] <- koor["United Kingdom",1]+0.8
koor["United Kingdom",2] <- koor["United Kingdom",2]-0.8
koor["Croatia",2]<-koor["Croatia",2]+0.6
koor["Croatia",1]<-koor["Croatia",1]+0.4
koor["Slovakia",2]<-koor["Slovakia",2]+0.2
koor["Latvia",1]<-koor["Latvia",1]+0.4
koor["Belgium",1]<-koor["Belgium",1]+0.2


imena["United Kingdom"] <- "United\nKingdom"
imena["Czech Republic"] <- "Czech\nRepublic"
imena["Bosnia and Herzegovina"]<-"BIH"
imena["Slovenia"]<-"SLO"
imena["Macedonia"]<-"MKD"
imena["Netherlands"]<-"NLD"
imena["Denmark"]<-"DNK"

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid o stevilu goveda na prebivalca...\n")
pdf("slike/evropa1.pdf")


rot <- ifelse(imena == "Portugal", 90, 0)
print(spplot(Evro, "število", xlim=c(-25, 40), ylim=c(33, 73),
             main = "Število goveda na prebivalca v EU v letu 2013",
             col.regions = topo.colors(100),
             sp.layout = list(
               list("sp.polygons", Evro[is.na(m),], fill = "white"),
               list("sp.text", koor, imena,col="black", cex = 0.3, srt=rot)),
             par.settings = list(panel.background=list(col="lightblue"))))

dev.off()




# # Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
# druzine <- preuredi(druzine, obcine)
# 
# # Izračunamo povprečno velikost družine.
# druzine$povprecje <- apply(druzine[1:4], 1, function(x) sum(x*(1:4))/sum(x))
# min.povprecje <- min(druzine$povprecje, na.rm=TRUE)
# max.povprecje <- max(druzine$povprecje, na.rm=TRUE)
# 
# # Narišimo zemljevid v PDF.
# cat("Rišem zemljevid...\n")
# pdf("slike/povprecna_druzina.pdf", width=6, height=4)
# 
# n = 100
# barve = topo.colors(n)[1+(n-1)*(druzine$povprecje-min.povprecje)/(max.povprecje-min.povprecje)]
# plot(obcine, col = barve)
# 
# dev.off()
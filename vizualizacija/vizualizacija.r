# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid slovenije po regijah.
cat("Uvažam zemljevid slovenije...\n")
slo <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2/shp/SVN_adm.zip",
                       "slovenija", "SVN_adm1.shp", mapa = "zemljevid",
                       encoding = "Windows-1250")
zahodna<-slo[c(1,2,6,7),]
vzhodna<-slo[c(-1,-2,-6,-7),]

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
names(imena1) <- imena
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
  text(ko,labels=imena1,cex=0.3)
}

# Povrnemo prvotno nastavitev
par(mfrow=c(1, 1))
dev.off()




#Uvozimo zemljevid sveta
cat("Uvažam zemljevid sveta...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")

#Dodamo manjkajoči državi-Turčija in Ciper
evropa<-svet$continent %in% "Europe" | svet$name_long %in% c("Cyprus",
                                                           "Turkey")
#Podatki za države na področju Evrope
Evropa<-svet[evropa,]
m <- match(Evropa$name_long, stevilo.govedaEU[seq(7,238,8),2])

#Logični vektor držav EU
eu<-Evropa$name_long %in% stevilo.govedaEU[seq(7,238,8),2]
#Podatki za države EU
EU<-Evropa[eu,]

stevilo.govedaeu<- stevilo.govedaEU[as.character(EU$name_long),]
Evropa$število<-stevilo.govedaeu$število[m]
# podzemljevid za države s podatki - za izpis imen
EU <- Evropa[!is.na(m),]

#Uredim koordinate in imena - samo za države s podatki
koor<- coordinates(EU)
imena <- as.character(EU$name_long)
rownames(koor)<-imena
names(imena)<-imena

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid o skupnem številu goveda...\n")
pdf("slike/evropa.pdf")


print(spplot(Evropa, "število", xlim=c(-25, 40), ylim=c(33, 73),
             main = "Skupno število goveda po državah EU v letu 2013 (v 1000)",
             col.regions = topo.colors(100),
             sp.layout = list(
               list("sp.polygons", Evropa[is.na(m),], fill = "white"),
               list("sp.text", koordinate, imena, cex = 0.5,col="red")),
             par.settings = list(panel.background=list(col="lightyellow"))))
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
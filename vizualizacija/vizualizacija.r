# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid slovenije...\n")
slo <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2/shp/SVN_adm.zip",
                       "slovenija", "SVN_adm1.shp", mapa = "zemljevid",
                       encoding = "Windows-1250")
zahodna<-slo[c(1,2,6,7),]
vzhodna<-slo[c(-1,-2,-6,-7),]

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
preuredi <- function(podatki, zemljevid) {
  nove.obcine <- c()
  manjkajo <- ! nove.obcine %in% rownames(podatki)
  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
  names(M) <- names(podatki)
  row.names(M) <- nove.obcine[manjkajo]
  podatki <- rbind(podatki, M)
  
  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$NAME_1)[rank(zemljevid$NAME_1)]), ]
  if (ncol(podatki) == 1) {
    out <- data.frame(out)
    names(out) <- names(podatki)
    rownames(out) <- rownames(podatki)
  }
  return(out)
}
# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
stevilo<- preuredi(stevilo.goveda, zahodna)

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid slovenije...\n")

#Spremenjene koordinate in imena za Slovenijo
ko<- coordinates(slo)
imena1 <- as.character(slo$NAME_1)
rownames(ko) <- imena1
names(imena1) <- imena1
ko["Obalno-kraška",1] <- ko["Obalno-kraška",1]
ko["Obalno-kraška",2] <- ko["Obalno-kraška",2]
ko["Zasavska",2] <- ko["Zasavska",2] 
ko["Spodnjeposavska",1] <- ko["Spodnjeposavska",1]
ko["Spodnjeposavska",2] <- ko["Spodnjeposavska",2]
imena1["Jugovzhodna Slovenija"] <- "Jugovzhodna\nSlovenija"
imena1["Notranjsko-kraška"] <- "Notranjsko-\nkraška"
imena1["Obalno-kraška"] <- "Obalno-\nkraška"

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
# 4. faza: Analiza podatkov
pdf("slike/govedo.pdf")
leta<-stevilo$leto
govedo<-stevilo$število.goveda/1000
plot(leta, govedo, xlab="Leto", ylab="Skupno število goveda (*1000)")

#funikcija za linearno rast
lin<-lm(govedo~leta)
abline(lin, col="red")

#preverimo če je število goveda kvadratna funkcija
kvad<-lm(govedo~I(leta^2)+leta)
curve(predict(kvad, data.frame(leta=x)),add=TRUE,col="blue")
#model Loess
loess<-loess(govedo~leta)
#pogledamo ostanke pri teh modelih
ostanki<-sapply(list(lin, kvad, loess), function(x) sum(x$residuals^2))
dev.off()
#napoved za skupno število goveda do leta 2035
pdf("slike/napoved.pdf")
plot(leta,govedo,xlim=c(1991,2035),ylim=c(400,600),
     xlab="Leto",ylab="Skupno število goveda (*1000)",
     main="Napoved za skupno število goveda do leta 2035")
napoved<-function(x,model){predict(model,data.frame(leto=x))}
curve(napoved(x, lin), add=TRUE,col="red")
curve(napoved(x, kvad), add=TRUE, col="blue")
dev.off()
# #Narisali bomo napoved za rast prebivalstva do leta 2030 po modelu za modeala linear in kvadratna 
# pdf("slike/napoved.pdf")
# plot(demographics$Year, pop, xlim = c(1935, 2050), ylim = c(120, 450), 
#      xlab = "Leto", ylab = "Populacija (v mil)",
#      main = "Predvidena rast prebivalstva po različnih modelih")      
# napoved <- function(x,model){predict(model, data.frame(leto=x-1900))} 
# curve(napoved(x, linearna), add= TRUE, col = "blue")
# curve(napoved(x, kvadratna), add = TRUE, col = "red")
# dev.off()



# # Uvozimo funkcijo za uvoz spletne strani.
# source("lib/xml.r")
# 
# # Preberemo spletno stran v razpredelnico.
# cat("Uvažam spletno stran...\n")
# tabela <- preuredi(uvozi.obcine(), obcine)
# 
# # Narišemo graf v datoteko PDF.
# cat("Rišem graf...\n")
# pdf("slike/naselja.pdf", width=6, height=4)
# plot(tabela[[1]], tabela[[4]],
#      main = "Število naselij glede na površino občine",
#      xlab = "Površina (km^2)",
#      ylab = "Št. naselij")
# dev.off()
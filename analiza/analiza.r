# 4. faza: Analiza podatkov

leta<-stevilo$leto
govedo<-stevilo$stevilo.goveda/1000
#plot(leta, govedo, xlab="Leto", ylab="Skupno število goveda (*1000)")

#funikcija za linearno rast
lin<-lm(govedo~leta)
#abline(lin, col="red")

#preverimo če je število goveda kvadratna funkcija
kvad<-lm(govedo~I(leta^2)+leta)
#curve(predict(kvad, data.frame(leta=x)),add=TRUE,col="blue")
#model Loess
loess<-loess(govedo~leta)
#curve(predict(loess, data.frame(leta=x)),add=TRUE,col="green")
#pogledamo ostanke pri teh modelih
#ostanki<-sapply(list(lin, kvad, loess), function(x) sum(x$residuals^2))


#napoved za skupno število goveda do leta 2035 po različnih modelih
pdf("porocilo/napoved.pdf")
plot(leta,govedo,xlim=c(1991,2025),ylim=c(430,530),
     xlab="Leto",ylab="Skupno število goveda (*1000)",
     main="Napoved za skupno število goveda do leta 2025")
napoved<-function(x,model){predict(model,data.frame(leta=x))}
curve(napoved(x, lin), add=TRUE,col="red")
curve(napoved(x, kvad), add=TRUE, col="blue")
#legenda
legend("topright", c("Linerana metoda", "Kvadratna metoda"),lty=c(1,1), col = c("red","blue"))


Leta<-ovce$leto
ov<-ovce$stevilo.ovac/1000
# plot(Leta, ov, xlab="Leto", ylab="Skupno število ovac (*1000)")

#funikcija za linearno rast
lin<-lm(ov~Leta)
# abline(lin, col="red")

#preverimo če je število goveda kvadratna funkcija
kvad<-lm(ov~I(Leta^2)+Leta)
# curve(predict(kvad, data.frame(Leta=x)),add=TRUE,col="blue")
#model Loess
loess<-loess(ov~Leta)
# curve(predict(loess, data.frame(Leta=x)),add=TRUE,col="green")
#pogledamo ostanke pri teh modelih
# ostanki<-sapply(list(lin, kvad, loess), function(x) sum(x$residuals^2))

#napoved za skupno število ovac do leta 2035 po različnih modelih
plot(Leta,ov,xlim=c(1991,2025),ylim=c(22,140),
     xlab="Leto",ylab="Skupno število ovac (*1000)",
     main="Napoved za skupno število ovac do leta 2025")
napoved<-function(x,model){predict(model,data.frame(Leta=x))}
curve(napoved(x, lin), add=TRUE,col="red")
curve(napoved(x, kvad), add=TRUE, col="blue")
#legenda
legend("topright", c("Linerana metoda", "Kvadratna metoda"),lty=c(1,1), col = c("red","blue"))
dev.off()



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
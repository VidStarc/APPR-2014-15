pdf("porocilo/graf.pdf")
vrstice <- c(3:6, 9:12, 15:17, 19:22)
podatki <- matrix(stevilo.goveda[c(vrstice+22, vrstice+44), 3], ncol = 2)
barplot(podatki,beside = TRUE, main="Število goveda v letu 2007",
        names.arg = c("Vzhodna Slovenija", "Zahodna Slovenija"), 
        legend.text = stevilo.goveda[vrstice, 2], args.legend = c(cex = 0.7),
        xlab = "leto 2007", ylab = "število goveda",col = rainbow(nrow(podatki)))



vrstice <- c(3:6, 9:12, 15:17, 19:22)
podatki <- matrix(stevilo.goveda[c(vrstice+22, vrstice+44), 4], ncol = 2)
barplot(podatki,beside = TRUE, main="Število goveda v letu 2008",
        names.arg = c("Vzhodna Slovenija", "Zahodna Slovenija"), 
        legend.text = stevilo.goveda[vrstice, 2], args.legend = c(cex = 0.7),
        xlab = "leto 2008", ylab = "število goveda",col = rainbow(nrow(podatki)))



vrstice <- c(3:6, 9:12, 15:17, 19:22)
podatki <- matrix(stevilo.goveda[c(vrstice+22, vrstice+44), 5], ncol = 2)
barplot(podatki,beside = TRUE, main="Število goveda v letu 2009",
        names.arg = c("Vzhodna Slovenija", "Zahodna Slovenija"), 
        legend.text = stevilo.goveda[vrstice, 2], args.legend = c(cex = 0.7),
        xlab = "leto 2009", ylab = "število goveda",col = rainbow(nrow(podatki)))

vrstice <- c(3:6, 9:12, 15:17, 19:22)
podatki <- matrix(stevilo.goveda[c(vrstice+22, vrstice+44), 6], ncol = 2)
barplot(podatki,beside = TRUE, main="Število goveda v letu 2010",
        names.arg = c("Vzhodna Slovenija", "Zahodna Slovenija"), 
        legend.text = stevilo.goveda[vrstice, 2], args.legend = c(cex = 0.7),
        xlab = "leto 2010", ylab = "število goveda",col = rainbow(nrow(podatki)))

vrstice <- c(3:6, 9:12, 15:17, 19:22)
podatki <- matrix(stevilo.goveda[c(vrstice+22, vrstice+44), 7], ncol = 2)
barplot(podatki,beside = TRUE, main="Število goveda v letu 2011",
        names.arg = c("Vzhodna Slovenija", "Zahodna Slovenija"), 
        legend.text = stevilo.goveda[vrstice, 2], args.legend = c(cex = 0.7),
        xlab = "leto 2011", ylab = "število goveda",col = rainbow(nrow(podatki)))

vrstice <- c(3:6, 9:12, 15:17, 19:22)
podatki <- matrix(stevilo.goveda[c(vrstice+22, vrstice+44), 8], ncol = 2)
barplot(podatki,beside = TRUE, main="Število goveda v letu 2012",
        names.arg = c("Vzhodna Slovenija", "Zahodna Slovenija"), 
        legend.text = stevilo.goveda[vrstice, 2], args.legend = c(cex = 0.7),
        xlab = "leto 2012", ylab = "število goveda",col = rainbow(nrow(podatki)))

vrstice <- c(3:6, 9:12, 15:17, 19:22)
podatki <- matrix(stevilo.goveda[c(vrstice+22, vrstice+44), 9], ncol = 2)
barplot(podatki,beside = TRUE, main="Število goveda v letu 2013",
        names.arg = c("Vzhodna Slovenija", "Zahodna Slovenija"), 
        legend.text = stevilo.goveda[vrstice, 2], args.legend = c(cex = 0.7),
        xlab = "leto 2013", ylab = "število goveda",col = rainbow(nrow(podatki)))
dev.off()

# pdf("porocilo/graf1.pdf")
# podatki <- matrix(stevilo.prasicev[1:15,3])
# podatki1<-podatki/1000
# barplot(podatki1,beside = TRUE, main="Število prasicev v letu 2007-Slovenija",
#         legend.text = stevilo.prasicev[1:15, 2], args.legend = c(cex = 0.7), 
#         xlab = "leto 2007", ylab = "število prasicev(*1000)",
#         col = rainbow(nrow(podatki1)))
# 
# podatki <- matrix(stevilo.prasicev[16:30,3])
# podatki1<-podatki/1000
# barplot(podatki1,beside = TRUE, main="Število prasicev v letu 2007-Vzhodna Slovenija",
#         legend.text = stevilo.prasicev[1:15, 2], args.legend = c(cex = 0.7),
#         xlab = "leto 2007", ylab = "število prasicev(*1000)",
#         col = rainbow(nrow(podatki1)))
# 
# podatki <- matrix(stevilo.prasicev[31:45,3])
# podatki1<-podatki/1000
# barplot(podatki1,beside = TRUE, main="Število prasicev v letu 2007-Zahodna Slovenija",
#         legend.text = stevilo.prasicev[1:15, 2], args.legend = c(cex = 0.7),
#         xlab = "leto 2007", ylab = "število prasicev(*1000)",
#         col = rainbow(nrow(podatki1)))
# 
# dev.off()

#3D tortni diagram
pdf("slike/graf3.pdf")
library(plotrix)
vrstice <- c(2, 4:9)
slices <- stevilo.ovac[vrstice,3] 
pie3D(slices,explode=0.2,main="Število ovac-SLOVENIJA")
legend("topright", legend = stevilo.ovac[vrstice, 2],
       fill = rainbow(length(vrstice)), cex=0.7, title="LEGENDA")    
       
dev.off()
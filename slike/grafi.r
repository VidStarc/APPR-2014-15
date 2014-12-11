pdf("grafi.pdf")
barplot(stevilo.goveda[,3],beside = TRUE, main="Število goveda v letu 2007", 
        xlab = "leto 2007", ylab = "število goveda",col = rainbow(30))
barplot(stevilo.goveda[,4],beside = TRUE, main="Število goveda v letu 2008", 
        xlab = "leto 2008", ylab = "število goveda",col = rainbow(30))
barplot(stevilo.goveda[,5],beside = TRUE, main="Število goveda v letu 2009", 
        xlab = "leto 2009", ylab = "število goveda",col = rainbow(30))

barplot(stevilo.prasicev[1:15,3],beside = TRUE, main="Število prasicev v letu 2007-Slovenija", 
        xlab = "leto 2007", ylab = "število prasicev",col = rainbow(30))
legend("topright", c("Prašiči-SKUPAJ","Pujski,do 20kg-sesni","pujski,do 20kg-drugi",
                     "Mladi Prašiči,20-50kg","Prašiči v pitanje-SKUPAJ","prašiči v pitanju,50-80kg","prašiči v pitanju,80-110kg",
                     "prašiči v pitanju,110kg ali več","Plemenski prašiči 50kg-SKUPAJ","Plemenski prašiči nad 50kg,merjasci",
                     "plemenski prašiči nad 50kg,nebreje mladice","plemenski prašiči nad 50kg,breje mladice",
                     "plemenski prašiči nad 50kg,merjasci","plemenski prašiči nad 50kg,nebreje plemenske svinje",
                     "plemenski prašiči nad 50kg,breje plemenske svinje"), fill = rainbow(30), cex=.60, title="LEGENDA",bg = "white")


barplot(stevilo.prasicev[16:30,3],beside = TRUE, main="Število prasicev v letu 2007-Vzhodna Slo", 
        xlab = "leto 2007", ylab = "število prasičev",col = rainbow(30))
barplot(stevilo.prasicev[30:45,3],beside = TRUE, main="Število prasicev v letu 2007-Zahodna Slo", 
        xlab = "leto 2007", ylab = "število prasicev",col = rainbow(30))

#3D tortni diagram
library(plotrix)
 
slices <- stevilo.ovac[1:9,3] 
lbls <- c(stevilo.ovac[1:9,2])
pie3D(slices,labels=lbls,explode=0.2,main="Število ovac-SLOVENIJA")

legend("topright", c("Ovce-SKUPAJ","Jagnjeta in mlade ovce",
                     "Plemenske ovce-SKUPAJ",
                     "plemenske ovce,prvič pripuščene,mlečne",
                     "plemenske ovce,prvič pripuščene,druge",
                     "plemenske ovce,ki so že jagnjile,mlečne",
                     "plemenske ovce,ko se že jagnjile,druge",
                     "Ovni","Jalove ovce"),
       fill = rainbow(9), cex=.83, title="LEGENDA",text.font=0.5)
       
       
dev.off()
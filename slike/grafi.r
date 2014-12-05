pdf("grafi.pdf")
barplot(stevilo.goveda[,3],beside = TRUE, main="Število goveda v letu 2007", 
        xlab = "leto 2007", ylab = "število goveda",col = rainbow(30))
dev.off()
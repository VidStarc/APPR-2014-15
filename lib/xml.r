# # Uvoz s spletne strani

library(XML)
stripByPath <- function(x, path) {
  unlist(xpathApply(x, path,
                    function(y) gsub("^\\s*(.*?)\\s*$", "\\1",
                                     gsub("^(.*?)\\[.*$", "\\1",
                                          xmlValue(y)))))
}

uvozi.ovce <- function() {
  url.ovce <- "podatki/stevilo-ovac.htm"
  doc.ovce <- htmlTreeParse(url.ovce,
                            useInternalNodes=TRUE,encoding="Windows-1250")
  
  tabela <- getNodeSet(doc.ovce,"//table")
  vrstica <- getNodeSet(tabela[[1]], "./tr")
  seznam <- lapply(vrstica[4:length(vrstica)-1], stripByPath, "./td|./th")
  seznam <- lapply(seznam, function(x) x[(length(x)-7):length(x)])
  matrika <- matrix(unlist(seznam),nrow=length(seznam),byrow=TRUE)
  colnames(matrika) <- stripByPath(vrstica[[2]], ".//th")
  return(data.frame(Regija = c(rep("Slovenija", 9),
                               rep("Vzhodna Slovenija", 9),
                               rep("Zahodna Slovenija", 9)),
                    Kategorija = iconv(matrika[,1],from="UTF-8"),
                    apply(matrika[,2:8], 2, as.numeric)))
}

# library(XML)
# 
# # Vrne vektor nizov z odstranjenimi začetnimi in končnimi "prazninami" (whitespace)
# # iz vozlišč, ki ustrezajo podani poti.
# stripByPath <- function(x, path) {
#   unlist(xpathApply(x, path,
#                     function(y) gsub("^\\s*(.*?)\\s*$", "\\1", xmlValue(y))))
# }
# 
# uvozi.obcine <- function() {
#   url.obcine <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
#   doc.obcine <- htmlTreeParse(url.obcine, useInternalNodes=TRUE)
#   
#   # Poiščemo vse tabele v dokumentu
#   tabele <- getNodeSet(doc.obcine, "//table")
#   
#   # Iz druge tabele dobimo seznam vrstic (<tr>) neposredno pod
#   # trenutnim vozliščem
#   vrstice <- getNodeSet(tabele[[2]], "./tr")
#   
#   # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
#   # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
#   seznam <- lapply(vrstice[2:length(vrstice)], stripByPath, "./td")
#   
#   # Iz seznama vrstic naredimo matriko
#   matrika <- matrix(unlist(seznam), nrow=length(seznam), byrow=TRUE)
#   
#   # Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) prve tabele
#   colnames(matrika) <- gsub("\n", " ", stripByPath(tabele[[2]][[1]], ".//th"))
#   
#   # Podatke iz matrike spravimo v razpredelnico
#   return(data.frame(apply(gsub("\\*", "",
#                           gsub(",", ".",
#                           gsub("\\.", "", matrika[,2:5]))),
#                     2, as.numeric), row.names=matrika[,1]))
# }
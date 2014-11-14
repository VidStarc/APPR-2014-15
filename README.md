# Analiza podatkov s programom R, 2014/15

Avtor: Vid Starc

Mentor: Janoš Vidali
<<<<<<< HEAD
Naslov projekta: Število živine
=======

>>>>>>> bf8b567ea6314ab717c3a5b53da7bacc6988248a
Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika
Število živine v Sloveniji in sicer število goveda, prašičev in perutnine v različnih letih, razdeljeno na vzhodno in zahodno Slovenijo, ter število goveda in prašičev po različnih državah Evrope.

## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.

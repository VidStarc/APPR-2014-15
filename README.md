# Analiza podatkov s programom R, 2014/15

Avtor: Vid Starc

Mentor: Janoš Vidali
Naslov projekta: Število živine
=======

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
Izbral sem si temo Število živine v Sloveniji in sicer bom predstavil število goveda in prašičev v različnih letih. Podatki so razdeljeni na vzhodno in zahodno Slovenijo. Poleg tega pa bom to število primerjal z številom goveda in prašičev po različnih državah Evrope. Pofatke bom črpal iz statističnega urada republike Slovenije in iz uradne spletne strani Eurostat.

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.

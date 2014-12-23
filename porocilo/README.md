# Poročilo
Izbral sem si temo Število živine v Sloveniji in sicer bom predstavil število goveda, prašičev in ovac v različnih letih. Podatki so razdeljeni na Vzhodno in Zahodno Slovenijo. Poleg tega pa bom to število primerjal s številom goveda in prašičev po različnih državah Evrope. Podatke bom črpal iz statističnega urada republike Slovenije in iz uradne spletne strani Eurostat:
http://pxweb.stat.si/pxweb/Database/Okolje/15_kmetijstvo_ribistvo/05_zivinoreja/01_15174_stevilo_zivine/01_15174_stevilo_zivine.asp
http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=apro_mt_lscatl&lang=en
http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=apro_mt_lspig&lang=en


Namen projekta je spoznati vsa potrebna orodja v programu R, ki služijo za kakovostno izdelavo projekta. Pri tem se bomo osredotočili na analizo podatkov, jih zapisovali v tabelo, risali podatkom primerne grafe in zemljevide. V mojem primeru

Uvozil sem tabelo število goveda in pri tem dodal še urejenostno spremenljivko primerjava med letom 2013 in povprečjem (torej če je število goveda večje ali manjše). Dodal sem stolpec povprečje pri kateremu sem izračunal vse povprečne vrednosti ter stolpec povprečje EU (ki obsega 34 držav v Evropi). Pri slednjem sem podatke črpal iz tabele, ki je na spletni strani Eurostat, seveda sem te povprečne vrednosti izračunal v Excelu. Tako pripravljeno tabelo (obsega 11 stolpcev in 69 vrstic) sem uvozil v program R, pri tem navedel še vse potrebne spremenljivke, imel pa sem težave z odpravljanjem znakov X v glavi tabele in pa znakov NA v tabeli.
Uvozil sem tabelo število prašičev iz datoteke stevilo-prasisev.csv, ki sem jo našel na spletni strani SURS in nato še tabelo v obliki htm datokeke stevilo.ovac, ki sem jo tudi dobil na SURS-u.
S pomočjo funkcije barplot sem narisal šest grafov in sicer število goveda v treh različnih letih, število prašičev v treh različnih regijah in pri usakemu dodal še primerno legendo. Narisal sem še 3D tortni diagram ter vse skupaj shranil v dadoteke grafX.pdf., kjer je X={1,2,...7}. 
*Variables dicot—micas para identificar la relaci—n de cada individuo con respecto al PP*
gen expp=0
gen pasadopp=0
gen ppvotosimpatiahoy=0
gen nuncapp=0
gen algunavezpp=0

replace pasdadopp=1 if var165==1
replace expp=1 if var165==1 & var164 != 1
replace ppvotosimpatiahoy=1 if var164==1
replace nuncapp=1 if var164 != 1 & var165 != 1
replace algunavezpp=1 if ppvotosimpatiahoy==1
replace algunavezpp=1 if expp==1

*Descripci—n de casos*

**Escalas ideol—gicas**
tab var74 expp if algunavezpp==1 & var74<11, column
tab var25 expp if algunavezpp==1 & var25<12, column

**Perfil socioecon—mico**
tab var170 expp if algunavezpp==1 & var170<13, column
tab var171 expp if algunavezpp==1, column

**Centralismo**
tab var81 expp if algunavezpp==1, column

**Destino**
tab var164 expp, column


*Determinantes de haber dejado al PP de lado*
logit expp var74 var81 var170 if algunavezpp==1 & var74<11 & var25<12 & var170<13

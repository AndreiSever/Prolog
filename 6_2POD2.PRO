domains
predicates
openstroka(string,integer)
closestroka(string,integer)
clauses



closestroka(St,Flag):-frontstr(1,St,Str1,Str2), Str2<>"",Str1<>")",Str1<>"(",!,closestroka(Str2,Flag).
closestroka(St,Flag):-frontstr(1,St,Str1,Str2), Str1="(",Flag<>1,!, Flag1=Flag+1,closestroka(Str2,Flag1).
closestroka(St,Flag):-frontstr(1,St,Str1,Str2), Str1=")",Flag<>1,!, Flag1=Flag-1,closestroka(Str2,Flag1).
closestroka(St,Flag):-frontstr(1,St,Str1,Str2), Str2<>"",Flag<>1,!, closestroka(Str2,Flag).
closestroka(St,Flag):-Flag=2,!,write("Vse skobki rasstavleni pravilno").
closestroka(St,Flag):-Flag=1,!,write("Ne xvataet otkrivaishiesa skobki").
closestroka(St,Flag):-Flag<=3,!,write("Ne xvataet zacrivaishiesa skobki").

openstroka(St,Flag):-frontstr(1,St,Str1,Str2), Str2<>"",Str1<>")",Str1<>"(",!,openstroka(Str2,Flag).
openstroka(St,Flag):-frontstr(1,St,Str1,Str2), Str2="",Str1="(",!, write("Nepravilno rasstavleno, ne xvataet zacrivaishiesa skobki").
openstroka(St,Flag):-frontstr(1,St,Str1,Str2), Str2="",Str1=")",!, write("Nepravilno rasstavleno, ne xvataet otkrivaishiesa skobki").
openstroka(St,Flag):-frontstr(1,St,Str1,Str2), Str2<>"",Str1=")",!, write("Nepravilno rasstavleno, ne xvataet otkrivaishiesa skobki").
openstroka(St,Flag):-frontstr(1,St,Str1,Str2), Str2<>"",Str1="(",!, closestroka(Str2,3).
openstroka(St,Flag):-Flag=0,!, write("Skobok net").

goal
nl,
write("Vvedite stroky:"),nl,
readln(St),nl, 
openstroka(St,0).


domains
file=f
predicates
OwerWrite(file,string)

clauses

 
OwerWrite(f,N):- 
  existfile(N),!,


 openappend(f,N),
  writedevice(f), 
 readln(X),
 write(X),
 filepos(f,1,2),
 closefile(f).

OwerWrite(_,N):-
  write("NO").

  goal
  OwerWrite(f,"C:\chisla1.txt")
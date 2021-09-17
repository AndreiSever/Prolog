DOMAINS
file=f
predicates
write_file(file,integer,integer,integer,integer)
write_file1(file,integer,integer,integer)

writefile(string,integer,integer,integer,integer)
writefile1(string,integer,integer,integer)
summ(integer,integer,integer)
inc(integer,integer,integer,integer)
form

goal
  form.

clauses

summ(C,D,D1):-D1=D+C.
inc(C,Srednee,Nrez1,N1):-C<Srednee,!,N1=Nrez1+1.
inc(_,_,N,N).
writefile1(F_N,Srednee,R,Nrez1):-
          existfile(F_N),!, 
          openread(f,F_N), 
          readdevice(f), 
          write_file1(f,Srednee,R,Nrez1),
		 
	  closefile(f).

write_file1(f,Srednee,R,Nrez1):-
          not(eof(f)),!, 
          readint(C),
		  
          inc(C,Srednee,Nrez1,N1),
		  
	  write_file1(f,Srednee,R,N1). 
write_file1(_,_,Nrez1,Nrez1).

write_file(f,D,R,N,Nrez):-
          not(eof(f)),!, 
          readint(C),
		  write(C),
          summ(C,D,D1),
		  N1=N+1,
	  write_file(f,D1,R,N1,Nrez). 

write_file(_,D,D,N,N).

writeFile(F_N,D,R,N,Nrez):-
          existfile(F_N),!, 
          openread(f,F_N), 
          readdevice(f), 
          write_file(f,D,R,N,Nrez),
		 
	  closefile(f).
/* writeFile(_,_,R,_,_):-
       R="Файл не найден". */
  
form:-
   N=0,
   D=0,
   writeFile("C:\chisla.txt",D,R,N,Nrez),
   Srednee=R/Nrez,nl,
   write("Srednee arifmeticheskoe: ", Srednee),
   Nrez1=0,
   writefile1("C:\chisla.txt",Srednee,Result,Nrez1),
   nl,write("Result: ",Result).

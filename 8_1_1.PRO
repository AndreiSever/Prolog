Domains
 ListReal = real*.
 
 Predicates
  perm (ListReal, ListReal).
  pos (ListReal, real, ListReal).
  
 Clauses
  pos(L,X,[X|L]):- write(L).
  pos([H|T1],X,[H|T2]):- pos(T1,X,T2).
  
  perm([],[]).
  perm([H|T],L):- perm(T,T1), pos(T1,H,L).

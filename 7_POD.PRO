 

domains 
tree = empty; tr(integer, tree, tree)
predicates
tree_gen(integer, tree).
clauses
tree_gen(0,empty):-!.
tree_gen(1,tr(1,empty,empty)):-!.
tree_gen(N,tr(N,L,R)):- NewN=N-1, N1 = NewN div 2, N2=NewN-N1,tree_gen(N1, L), tree_gen(N2,R).
goal
write("Vvedite kol-vo vershin:"),nl,
readint(N),nl, 
tree_gen(N,T),
write(T).
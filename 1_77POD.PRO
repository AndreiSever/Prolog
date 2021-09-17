predicates
n(integer, integer).
n(integer, integer, integer, integer).
clauses
n(N,Ans):-n(0,N,0,Ans).
 

n(I,N,TempSum,Ans):-TempSum1=TempSum+2,I1=I+1,
I1<=N,!,n(I1,N,TempSum1,Ans).
n(I,N,TempSum,TempSum).

goal
write("chislo="), readint(A),
n(A,Ans),
write("summ=",Ans).
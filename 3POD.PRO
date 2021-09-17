
predicates
menu
window
repeat
process(integer)
clauses
repeat.
    repeat:-repeat.
menu:-makewindow(1,7,7,"Menu",0,0,10,30),window.
window:- repeat, clearwindow, 	
		write("1-Go"),nl,
		write("2-Exit"),nl,
		write("Sdelaite svoi vibor 1 ili 2 : "),
        readint(Vibor),nl,process(Vibor),Vibor = 2,!.
process(1) :-
        makewindow(2,7,7,"MenuPlus",0,30,10,30),shiftwindow(2),
        write("GO!"),nl,
		write("Press space bar. "), readchar(_), 
        removewindow, shiftwindow(1).
process(2) :-
        write("do novih vstrech"),readchar(_),exit.

goal
menu.


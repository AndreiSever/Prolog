Domains
    Name_strana, Name_stolica= string 
Database
    dstrana(Name_strana, Name_stolica)
Predicates
    repeat
    do_mbase
    assert_database
    menu
    process(integer)
    clear_database
    strana(Name_strana, Name_stolica)
    error
Goal
    do_mbase.
Clauses	
	
    repeat.
    repeat:-repeat.
        
    strana("Russia","Moscow").
    strana("Sweden","Stockholm ").
    strana("Ukraine","Kiev").
    strana("Great Britain","London").
    strana("Germany","Berlin").
    strana("France","Paris").
            
    assert_database:-
    strana(Name_strana,Name_stolica),   assertz(dstrana(Name_strana,Name_stolica)),
    fail.
    assert_database:-!.
 
    clear_database:-
        retract(dstrana(_,_)),
        fail.
    clear_database:-!.
    do_mbase :-
        assert_database,
        makewindow(1,7,7," Strani i stolici",0,0,25,80),
        menu,
        clear_database.
    menu :-
        repeat, clearwindow,
        nl,
        write(" ************************************ "),nl,
        write(" * 1. Novaia strana                 * "),nl,
        write(" * 2. Ydalenie strani               * "),nl,
        write(" * 3. Prosmotr stolic               * "),nl,
        write(" * 4. Prosmotr stran                * "),nl,
        write(" * 5. Izmenit stolicy               * "),nl,
		write(" * 6. Izmenit strany                * "),nl,
        write(" * 7. Vihod                         * "),nl,
        write(" ************************************* "),nl,
        write(" Sdelaite svoi vibor 1, 2, 3, 4,5,6 ili 7 : "),
        readint(Vibor),nl,process(Vibor),Vibor = 7,!.
    
    process(1) :-
        makewindow(2,7,7,"Dobavit strany",2,20,18,58),shiftwindow(2),
        write("‚Vvedite pogalyista:"),nl,
        write("Nazvanie strani:"), readln(Name_strana), 
        write("Nazvanie stolici:"), readln(Name_stolica),
        assertz(dstrana(Name_strana, Name_stolica)),
        write(Name_strana,"Dobavleno v BD"), nl,!,
        write("Press space bar. "), readchar(_), 
        removewindow, shiftwindow(1).
        
            
    process(2) :-
        makewindow(3,7,7,"Ydalenie",10,30,7,40),shiftwindow(3),
        write("‚Vvedite strany: "), readln(Name_strana),
        retract(dstrana(Name_strana,_)), 
        write(Name_strana," “Ydaleno iz BD "), nl, !,
        write("Press space bar."), readchar(_), removewindow,
        shiftwindow(1).
            
    process(3) :-
        makewindow(4,7,7," Prosmotr stolic ", 7,30,16,47),  shiftwindow(4),
        write("Vvedite strany dlia prosmotra: "), readln(Name_strana),
        dstrana(Name_strana,Name_stolica),!,nl, 
        write(" Nazvanie stolici     : ",Name_stolica),nl,
        write(" Nazvanie strani      : ",Name_strana),nl,
        write("Press space bar"), readchar(_),  
        removewindow, shiftwindow(1).
    process(3) :-
        makewindow(5,7,7," Neudacha",14,7,5,60), shiftwindow(5),
        write("Takoi strani net."),nl,
        write("Press space bar."),readchar(_),
        removewindow,shiftwindow(1).
            
    process(4):-        
        makewindow(4,7,7," Prosmotr stran ", 7,30,16,47),  shiftwindow(4),
        write("Vvedite stolic dlia prosmotra : "), readln(Name_stolica),
        dstrana(Name_strana,Name_stolica),!,nl, 
        write("Nazvanie stolici    : ",Name_strana),nl,
        write("Nazvanie strani     : ",Name_stolica),nl,
        write("Press space bar"), readchar(_),  
        removewindow, shiftwindow(1).
    process(4) :-
        makewindow(5,7,7," Neudacha",14,7,5,60), shiftwindow(5),
        write("Takoi stolici net."),nl,
        write("Press space bar."),readchar(_),
        removewindow,shiftwindow(1). 
	
	process(5):-        
        makewindow(4,7,7," Izmenit stolicy ", 7,30,16,47),  shiftwindow(4),
        write("Vvedite stolic dlia izmenenia : "), readln(Name_stolica),
        dstrana(Name_strana,Name_stolica),!,nl, 
        write("Nazvanie stolici    : ",Name_strana),nl,
        write("Nazvanie strani     : ",Name_stolica),nl,
		write("Vvedite noviy stolicy : "), readln(Name_stolica1),
		 retract(dstrana(Name_strana,Name_stolica)),nl,
		assertz(dstrana(Name_strana,Name_stolica1)),nl,
		write("Izmenenie yspeshno zaversheno : "),
        dstrana(Name_strana,Name_stolica1),nl, 
        write("Nazvanie stolici    : ",Name_strana),nl,
        write("Nazvanie strani     : ",Name_stolica1),nl,
        write("Press space bar"), readchar(_),  
        removewindow, shiftwindow(1).
    process(5) :-
        makewindow(5,7,7," Neudacha",14,7,5,60), shiftwindow(5),
        write("Takoi stolici net."),nl,
        write("Press space bar."),readchar(_),
        removewindow,shiftwindow(1).

	process(6):-        
        makewindow(4,7,7," Izmenit strany ", 7,30,16,47),  shiftwindow(4),
        write("Vvedite strany dlia prosmotra : "), readln(Name_strana),
        dstrana(Name_strana,Name_stolica),!,nl, 
        write("Nazvanie stolici    : ",Name_strana),nl,
        write("Nazvanie strani     : ",Name_stolica),nl,
	write("Vvedite noviy strana : "), readln(Name_strana1),
        retract(dstrana(Name_strana,Name_stolica)),nl,
		assertz(dstrana(Name_strana1,Name_stolica)),nl,
	write("Izmenenie yspeshno zaversheno : "),
        dstrana(Name_strana1,Name_stolica),nl, 
        write("Nazvanie stolici    : ",Name_strana1),nl,
        write("Nazvanie strani     : ",Name_stolica),nl,
        write("Press space bar"), readchar(_),  
        removewindow, shiftwindow(1).
    process(6) :-
        makewindow(5,7,7," Neudacha",14,7,5,60), shiftwindow(5),
        write("Takoi strani net."),nl,
        write("Press space bar."),readchar(_),
        removewindow,shiftwindow(1). 
    process(7) :-
        write("do novih vstrech"),readchar(_),exit.
            
    process(Vibor):-
        Vibor<1, error; Vibor>7, error.
    error:- 
        write("Viberete chislo ot 1 do 7"),
        write("(Press the spase bar to continue)"),readchar(_).
/*
(())(())(())(())(())(())(())(())(())(())(())(())(())(())(())(())
(()) Drunkin Output; By Ken (NeoHaxor) Bishop.				(())
(())     Summer-2003                                        (())
(())														(())
(())														(())
(()) 		If you are to use this, please credit Ken		(())
(())(())(())(())(())(())(())(())(())(())(())(())(())(())(())(())
*/
mob/var/intoxicated=0
proc/DrunkinOutput(mob/M,var/phrase)
	if(M.intoxicated)
		var
			leng=lentext(phrase)
			counter=lentext(phrase)
			newphrase="";newletter=""
		while(counter>=1)
			newletter="[copytext(phrase,(leng-counter)+1,(leng-counter)+2)]"
			if(rand(1,5)==5)
				if(lowertext(newletter)=="o")	newletter="u"
				if(lowertext(newletter)=="s")	newletter="ch"
				if(lowertext(newletter)=="a")	newletter="ah"
				if(lowertext(newletter)=="c")	newletter="k"
			switch(rand(1,15))
				if(1,3,5,8)	newletter="[lowertext(newletter)]"
				if(2,4,6,15)	newletter="[uppertext(newletter)]"
				if(7)	newletter+="'"
				if(9,10)	newletter="<b>[newletter]</b>"
				if(11,12)	newletter="<big>[newletter]</big>"
				if(13)	newletter="<small>[newletter]</small>"
			newphrase+="[newletter]";counter-=1
		phrase=newphrase
	return phrase	//This will alter the value of the message sent
/*mob
	verb
		Intoxicate()
			set name ="Intoxicate/Detoxify"
			if(usr.intoxicated)	usr.intoxicated=0
			else	usr.intoxicated=1

		//Toggle this variable to alter intoxication
	*/
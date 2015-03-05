var/
	motdtitle = {"<body bgcolor=black></body><center><font size=4 color = red><u><b>Message Of The Day!</b></u></font><br><br><font color=white>"}
	motd
	lmb = "<p align=\"right\"style=\"letter-spacing:2px\"><font size=-2>-DragonBall Z AA</font></p>"

mob/verb/
	Show_MOTD()
		set category = "Channels"
		usr << browse(motdtitle+motd+{"<br><br><p align=right>[lmb]</p>"},{"window=MOTD;display=1;size=500x400;border=1;can_resize=0;can_minimize=1;titlebar=1"})


mob/System/Admin/Verbs/OwnerGM/verb
	Change_Motd()
		set category = "Admin"
		var/msg = input("What do you want the MOTD to be?","Change MOTD",motd) as message

		if(msg)
			motd = msg
			lmb = "<p align=\"right\"style=\"letter-spacing:2px\"><font size=-2>-Staff of Armageddon.</font></p>"
			world << "<font color = red>New MOTD!</font>"
		else
			motd = null


world
	New()
		..()
		motd = file2text("World Save Files/MotD.htm")
		fdel("World Save Files/MotD.htm")
		if(!motd)
			motd = "<center>Welcome, my friends, to one of the best DBZ games on BYOND!<br><br>Remember to read the rules, they are important! Check out the Game Guide, it has a few pointers!<br><br><hr>NEWS<br><br>To get Subscriber, talk with Subscriber Guy in the Safe Zone!<br><br>Check out the Valiant Store for Cool Items!<br><br>Also when you enter Horde, don't Self Train, etc! it bugs you!<hr>Dragonball Stuff!<hr><a href=www.youtube.com/watch?v=aTwuyHjCS-k>Sonic the Hedgehog: Two Worlds Collide (Fan made Dragonball Z & Sonic the Hedgehog)</a>.<br><hr>UPDATE HIGHLIGHTS<hr><br>Ability to stop seeing rank ups!"

	Del()
		fdel("World Save Files/MotD.htm")
		text2file(motd,"World Save Files/MotD.htm")
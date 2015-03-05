obj/Technique
	Freeze
		verb
			Freeze()
				set category = "Techniques"
				set src = usr.contents
				var/list/Menu = list()
				for(var/mob/M in oview(6))
					if(istype(M,/mob/Simulation)||istype(M,/mob/Monster)||istype(M,/mob/PC)||istype(M,/mob/NPC))Menu.Add(M)
				Menu.Remove(usr)
				for(var/mob/M in oview(6))if(istype(M,/mob/PC)&&M.name==usr.name)Menu.Remove(M)
				var/test=input("Who do you want to use freeze on?")as null|anything in Menu
				if(!test)return
				usr.Freeze(test)
mob
	var/tmp/freeze_using=0
	proc
		Freeze(mob/M)
			if(M.safe||doing||buku||dead||M.dead||M==src||freeze_using)return
			if(!M in oview(6))return
			freeze_using=1
			view(8)<<"\white [src] freezes [M]!"
			M.GMLocked=1
			M.kidefense*=2
			M.defence*=2
			spawn(50)if(M)
				M.GMLocked=0
				M.kidefense/=2
				M.defence/=2
			spawn(150)if(src)freeze_using=0
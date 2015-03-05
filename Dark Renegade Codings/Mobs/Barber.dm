mob
	NPC
		Barber
			name = "{NPC}Barber"
			icon_state = "Barber"
			density = 1
			doing = 0
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					set category = null
					if(usr.talking || usr.fused)return
					usr.talking=1
					if(usr.race=="Galactic Warrior"||usr.race=="Kai"||usr.race=="Saibaman"||usr.race=="Changeling"||usr.race=="Tuffle"||usr.race=="Namekian")
						usr<<"\white Barber:\font I can only help people with hair."
						usr.talking=0
						return
					if(usr.race == "Bio-Android"||usr.race=="Majin"||usr.race=="Demon"||usr.race=="Bio-Warrior")
						usr<<"\white Barber:\font I can only help people with hair."
						usr.talking=0
						return
					switch(input("Do you want to get your hair cut?")in list("Yes","No"))
						if("Yes")
							usr.talking=0
							usr.overlays -= usr.hair_icon
							usr.hair="Bald"
							usr.Hair_Apply()
							usr.HairCut()
						if("No")
							usr.talking=0
							return
mob/proc/HairCut()
	var/newhair=input("Choose your hair style.","Hair Styles")in list("Goku","Vegeta","Adult Gohan","Teen Gohan","Future Gohan","Trunks Long","Raditz","Hercule","Bald")
	var/hr=input("How much Red do you want to put?")as num
	var/hg=input("How much Green do you want to put?")as num
	var/hb=input("How much Blue do you want to put?")as num
	switch(newhair)
		if("Goku")
			hair_icon = 'Hair - Goku.dmi'
			hair = "Goku"
			hair_icon += rgb(hr,hg,hb)
			overlays += hair_icon
			if(majin)overlays += 'Majin.dmi'
		if("Hercule")
			hair_icon = 'Hair - Hercule.dmi'
			hair = "Hercule"
			hair_icon += rgb(hr,hg,hb)
			overlays += hair_icon
			if(majin)overlays += 'Majin.dmi'
		if("Vegeta")
			hair_icon = 'Hair - Vegeta.dmi'
			hair = "Vegeta"
			hair_icon += rgb(hr,hg,hb)
			overlays += hair_icon
			if(majin)overlays += 'Majin.dmi'
		if("Adult Gohan")
			hair_icon = 'Hair - Adult Gohan.dmi'
			hair = "Adult Gohan"
			hair_icon += rgb(hr,hg,hb)
			overlays += hair_icon
			if(majin)overlays += 'Majin.dmi'
		if("Teen Gohan")
			hair_icon = 'Hair - Teen Gohan.dmi'
			hair = "Teen Gohan"
			hair_icon += rgb(hr,hg,hb)
			overlays += src.hair_icon
			if(majin)overlays += 'Majin.dmi'
		if("Future Gohan")
			hair_icon = 'Hair - Future Gohan.dmi'
			hair = "Future Gohan"
			hair_icon += rgb(hr,hg,hb)
			overlays += hair_icon
			if(majin)overlays += 'Majin.dmi'
		if("Trunks Long")
			hair_icon = 'Hair - Trunks Long.dmi'
			hair = "Trunks Long"
			hair_icon += rgb(hr,hg,hb)
			overlays += hair_icon
			if(majin)overlays += 'Majin.dmi'
		if("Raditz")
			hair_icon = 'Hair - Raditz.dmi'
			hair = "Raditz"
			hair_icon += rgb(hr,hg,hb)
			overlays += hair_icon
			if(majin)overlays += 'Majin.dmi'
		if("Bald")
			hair = "Bald"
			if(majin)overlays += 'Majin.dmi'
			return
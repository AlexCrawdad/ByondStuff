mob/var/tmp/meditation=0
mob/var/med_toggler=1
/*mob/PC
	verb/Meditate()
		set category="Training"
		if(meditation)
			meditation=0
			doing=0
			frozen=0
			icon_state=""
			usr<<output("You get up from meditating.","training")
			return
		if(/*ft_using||*/doing||jailed||boxing||rest||dualtrain)return
		if(stamina>=stamina_max)
			icon_state=""
			usr<<output("You cannot meditate at this time, you are too tired!","training")
			return
		if(!meditation)
			switch(alert("What do you wish to meditate on?","Meditation","Good Karma","Evil Karma"))
				if("Good Karma")
					if(doing||jailed||boxing||rest||dualtrain||meditation)return
					meditation=1
					doing=1
					frozen=1
					usr<<"You begin to focus on Good Karma!"
					icon_state="meditate"
					spawn(10)if(usr)GoodKarma_Meditation()
					return
				if("Evil Karma")
					if(doing||jailed||boxing||rest||dualtrain||meditation)return
					meditation=1
					doing=1
					frozen=1
					usr<<"You begin to focus on Evil Karma!"
					icon_state="meditate"
					spawn(10)if(usr)EvilKarma_Meditation()
					return
mob/proc
	EvilKarma_Meditation()
		if(!meditation||jailed||boxing||rest||dualtrain)return
		if(stamina>=stamina_max)
			overlays+='Rest.dmi'
			layer=50
			meditation=0
			doing=0
			frozen=0
			icon_state=""
			usr<<output("You fail your meditation, as beads of sweat form on your forehead!","training")
			return
		stamina+=3.7*exphostgain
		spawn(1)if(src)Z_Check()
		if(karma=="Evil")
			karma_rating+=1
			if(karma_rating>=100)karma_rating=100
		if(karma=="Good")karma_rating-=1
		if(karma_rating<0)
			if(karma=="Good")
				usr<<output("<I>You feel an Evil inside of you begin to awaken...","training")
				karma="Evil"
				karma_rating=0
			else
				usr<<output("<I>You feel the Good inside of you begin to awaken...","training")
				karma="Good"
				karma_rating=0
		spawn(100)if(src)EvilKarma_Meditation()
		spawn(100)if(src)Ki_Meditation()
		return
mob/proc
	GoodKarma_Meditation()
		if(!meditation||jailed||boxing||rest||dualtrain)return
		if(stamina>=stamina_max)
			overlays+='Rest.dmi'
			layer=50
			meditation=0
			doing=0
			frozen=0
			icon_state=""
			usr<<output("You fail your meditation, as beads of sweat form on your forehead!","training")
			return
		stamina+=3.7*exphostgain
		spawn(1)if(src)Z_Check()
		if(karma=="Evil")karma_rating-=1
		if(karma=="Good")
			karma_rating+=1
			if(karma_rating>=100)karma_rating=100
		if(karma_rating<0)
			if(karma=="Good")
				usr<<output("<I>You feel an Evil inside of you begin to awaken...","training")
				karma="Evil"
				karma_rating=0
			else
				usr<<output("<I>You feel the Good inside of you begin to awaken...","training")
				karma="Good"
				karma_rating=0
		spawn(100)if(src)GoodKarma_Meditation()
		spawn(100)if(src)Ki_Meditation()
		return
mob/proc
	Ki_Meditation()
		var/bonus=rand(300,3000)*2*exphostgain
		if(!meditation||jailed||boxing||rest||dualtrain)return
		var/chance=rand(1,5)
		switch(chance)
			if(1)
				if(med_toggler)usr<<output("<font color=gray>Your defence has risen by [bonus]!","training")
				defence_max+=bonus
			if(2)
				if(med_toggler)usr<<output("<font color=gray>Your strength has risen by [bonus]!","training")
				strength_max+=bonus
			if(3)
				if(med_toggler)usr<<output("<font color=gray>Your ki defence has risen by [bonus]!","training")
				kidefense_max+=bonus
			if(4)
				if(med_toggler)usr<<output("<font color=gray>Your ki has risen by [bonus]!","training")
				ki_max+=bonus
			if(5)
				if(med_toggler)usr<<output("<font color=gray>Your powerlevel has risen by [bonus]!","training")
				powerlevel_max+=bonus*/

mob/PC
	verb/Meditate()
		set category="Training"
		if(meditation)
			meditation=0
			doing=0
			frozen=0
			icon_state=""
			usr<<output("You get up from meditating.","training")
			return
		if(/*ft_using||*/doing||jailed||boxing||rest||dualtrain)return
		if(stamina>=stamina_max)
			icon_state=""
			usr<<output("You cannot meditate at this time, you are too tired!","training")
			return
		if(!meditation)
			switch(input("What do you wish to meditate on?","Meditation",)in list("Good Karma","Evil Karma","Powerlevel","Strength","Ki","Defence"))
				if("Good Karma")
					if(doing||jailed||boxing||rest||dualtrain||meditation)return
					meditation=1
					doing=1
					frozen=1
					usr<<"You begin to focus on Good Karma!"
					icon_state="meditate"
					spawn(10)if(usr)GoodKarma_Meditation()
					return
				if("Evil Karma")
					if(doing||jailed||boxing||rest||dualtrain||meditation)return
					meditation=1
					doing=1
					frozen=1
					usr<<"You begin to focus on Evil Karma!"
					icon_state="meditate"
					spawn(10)if(usr)EvilKarma_Meditation()
					return
				if("Powerlevel")
					if(doing||jailed||boxing||rest||dualtrain||meditation)return
					meditation=1
					doing=1
					frozen=1
					usr<<"You begin to focus on Powerlevel!"
					icon_state="meditate"
					spawn(10)if(usr)PL_Meditation()
					return
				if("Strength")
					if(doing||jailed||boxing||rest||dualtrain||meditation)return
					meditation=1
					doing=1
					frozen=1
					usr<<"You begin to focus on Strength!"
					icon_state="meditate"
					spawn(10)if(usr)Str_Meditation()
					return
				if("Ki")
					if(doing||jailed||boxing||rest||dualtrain||meditation)return
					meditation=1
					doing=1
					frozen=1
					usr<<"You begin to focus on Ki!"
					icon_state="meditate"
					spawn(10)if(usr)Ki_Meditation()
					return
				if("Defence")
					if(doing||jailed||boxing||rest||dualtrain||meditation)return
					meditation=1
					doing=1
					frozen=1
					usr<<"You begin to focus on Defence!"
					icon_state="meditate"
					spawn(10)if(usr)Def_Meditation()
					return
mob/proc
	EvilKarma_Meditation()
		if(!meditation||jailed||boxing||rest||dualtrain)return
		if(stamina>=stamina_max)
			overlays+='Rest.dmi'
			layer=50
			meditation=0
			doing=0
			frozen=0
			icon_state=""
			usr<<output("You fail your meditation, as beads of sweat form on your forehead!","training")
			return
		stamina+=3.7
		spawn(1)if(src)Z_Check()
		src.TransMastery()
		src.InvertMastery()
		if(karma=="Evil")
			karma_rating+=1
			if(karma_rating>=100)karma_rating=100
		if(karma=="Good")karma_rating-=1
		if(karma_rating<0)
			if(karma=="Good")
				usr<<output("<I>You feel an Evil inside of you begin to awaken...","training")
				karma="Evil"
				karma_rating=0
			else
				usr<<output("<I>You feel the Good inside of you begin to awaken...","training")
				karma="Good"
				karma_rating=0
		spawn(500)if(src)EvilKarma_Meditation()
		return
mob/proc
	GoodKarma_Meditation()
		if(!meditation||jailed||boxing||rest||dualtrain)return
		if(stamina>=stamina_max)
			overlays+='Rest.dmi'
			layer=50
			meditation=0
			doing=0
			frozen=0
			icon_state=""
			usr<<output("You fail your meditation, as beads of sweat form on your forehead!","training")
			return
		stamina+=3.7
		spawn(1)if(src)Z_Check()
		src.TransMastery()
		src.InvertMastery()
		if(karma=="Evil")karma_rating-=1
		if(karma=="Good")
			karma_rating+=1
			if(karma_rating>=100)karma_rating=100
		if(karma_rating<0)
			if(karma=="Good")
				usr<<output("<I>You feel an Evil inside of you begin to awaken...","training")
				karma="Evil"
				karma_rating=0
			else
				usr<<output("<I>You feel the Good inside of you begin to awaken...","training")
				karma="Good"
				karma_rating=0
		spawn(500)if(src)GoodKarma_Meditation()
		return

mob/proc
	PL_Meditation()
		if(!meditation||jailed||boxing||rest||dualtrain)return
		if(stamina>=stamina_max)
			overlays+='Rest.dmi'
			layer=50
			meditation=0
			doing=0
			frozen=0
			icon_state=""
			usr<<output("You fail your meditation, as beads of sweat form on your forehead!","training")
			return
		stamina+=5
		spawn(1)if(src)Z_Check()
		powerlevel_max+=level*5*PLMastery
		spawn(100)if(src)PL_Meditation()
		return

	Ki_Meditation()
		if(!meditation||jailed||boxing||rest||dualtrain)return
		if(stamina>=stamina_max)
			overlays+='Rest.dmi'
			layer=50
			meditation=0
			doing=0
			frozen=0
			icon_state=""
			usr<<output("You fail your meditation, as beads of sweat form on your forehead!","training")
			return
		stamina+=5
		spawn(1)if(src)Z_Check()
		ki_max+=level*5*KIMastery
		spawn(100)if(src)Ki_Meditation()
		return

	Str_Meditation()
		if(!meditation||jailed||boxing||rest||dualtrain)return
		if(stamina>=stamina_max)
			overlays+='Rest.dmi'
			layer=50
			meditation=0
			doing=0
			frozen=0
			icon_state=""
			usr<<output("You fail your meditation, as beads of sweat form on your forehead!","training")
			return
		stamina+=5
		spawn(1)if(src)Z_Check()
		strength_max+=level*5*STRMastery
		spawn(100)if(src)Str_Meditation()
		return

	Def_Meditation()
		if(!meditation||jailed||boxing||rest||dualtrain)return
		if(stamina>=stamina_max)
			overlays+='Rest.dmi'
			layer=50
			meditation=0
			doing=0
			frozen=0
			icon_state=""
			usr<<output("You fail your meditation, as beads of sweat form on your forehead!","training")
			return
		stamina+=5
		spawn(1)if(src)Z_Check()
		defence_max+=level*5*DEFMastery
		kidefense_max+=level*5*DEFMastery
		spawn(100)if(src)Def_Meditation()
		return
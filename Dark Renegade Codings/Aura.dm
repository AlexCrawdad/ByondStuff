mob/var/aura='Aura.dmi'
obj/Technique/Aura
	verb
		Aura()
			set category="Techniques"
			if(usr.FuseFollower)return
			switch(alert("Switch your aura:","","On","Off"))
				if("On")
					usr.aura_on=1
					if(usr.form_1)
						usr.overlays-=usr.aura
						usr.overlays-='Kaio Aura.dmi'
						view(6) << "<font color = yellow>[usr]'s Aura bursts into life!"
						src << sound('aura.wav')
						usr.underlays-=usr.underlays
						usr.Put_Aura()
						return
					else
						if(usr.kaioken)
							usr.underlays-=usr.underlays
							usr.overlays-=usr.aura
							view(6) << "<font color = red>[usr]'s Aura lights up in a blaze of red!"
							view(5) << sound('kaioken.wav')
							usr.overlays+='Kaio Aura.dmi'
							return
						else
							usr.underlays-=usr.underlays
							view(6) << "<font color = yellow>[usr]'s Aura begins to fade away..."
							view(5) << sound('kaioken.wav')
							usr.overlays-='Kaio Aura.dmi'
							usr.overlays+=usr.aura
							return
				else
					usr.underlays-=usr.underlays
					usr.overlays-=usr.aura
					usr.overlays-='Kaio Aura.dmi'
					usr.aura_on = 0
					return
obj/Aura/SSJ_Aura
	icon='Big Aura.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/SSJ_Aura2
obj/Aura/SSJ_Aura2
	icon='Big Aura.dmi'
	icon_state="top"
	New()
		pixel_y=32
		pixel_x=0
		layer=999
obj/Aura/Chang_Aura
	icon='Big Aura 3.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/Chang_Aura2
obj/Aura/Chang_Aura2
	icon='Big Aura 3.dmi'
	icon_state="top"
	New()
		pixel_y=32
		pixel_x=0
		layer=999
obj/Aura/Maj_Aura
	icon='Big Aura 2.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/Maj_Aura2
obj/Aura/Maj_Aura2
	icon='Big Aura 2.dmi'
	icon_state="top"
	New()
		pixel_y=32
		pixel_x=0
		layer=999
obj/Aura/Hum_Aura
	icon='Big Aura 4.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/Hum_Aura2
obj/Aura/Hum_Aura2
	icon='Big Aura 4.dmi'
	icon_state="top"
	New()
		pixel_y=32
		pixel_x=0
		layer=999
obj/Aura/Nam_Aura
	icon='Big Aura 5.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/Nam_Aura2
obj/Aura/Nam_Aura2
	icon='Big Aura 5.dmi'
	icon_state="top"
	New()
		pixel_y=32
		pixel_x=0
		layer=999
obj/Aura/Nor_Aura
	icon='Big Aura 6.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/Nor_Aura2
obj/Aura/Nor_Aura2
	icon='Big Aura 6.dmi'
	icon_state="top"
	New()
		pixel_y=32
		pixel_x=0
		layer=999
obj/Aura/And_Aura
	icon='Big Aura 7.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/And_Aura2
obj/Aura/And_Aura2
	icon='Big Aura 7.dmi'
	icon_state="top"
	New()
		pixel_y=32
		pixel_x=0
		layer=999
obj/Aura/And_Aura1
	icon='AndroA.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/And_Aura11
obj/Aura/And_Aura11
	icon='AndroA.dmi'
	icon_state="top"
	New()
		pixel_y=32
		pixel_x=0
		layer=999
obj/Aura/LSSJ_Aura
	icon='Big Aura 10.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/LSSJ_Aura2
obj/Aura/LSSJ_Aura2
	icon='Big Aura 10.dmi'
	icon_state="top"
	New()
		layer=999
		pixel_y=32
		pixel_x=0
obj/Aura/Demon_Aura1
	icon='DemonA.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/Demon_Aura11
obj/Aura/Demon_Aura11
	icon='DemonA.dmi'
	icon_state="top"
	New()
		layer=999
		pixel_y=32
		pixel_x=0
obj/Aura/Demon_Aura2
	icon='DemonA2.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/Demon_Aura22
obj/Aura/Demon_Aura22
	icon='DemonA2.dmi'
	icon_state="top"
	New()
		layer=999
		pixel_y=32
		pixel_x=0
obj/Aura/Demon_Aura3
	icon='DemonA3.dmi'
	icon_state=""
	New()
		pixel_y=0
		pixel_x=0
		overlays+=new/obj/Aura/Demon_Aura33
obj/Aura/Demon_Aura33
	icon='DemonA3.dmi'
	icon_state="top"
	New()
		layer=999
		pixel_y=32
		pixel_x=0
mob
	proc
		Big_Aura()
			if(trans_aura_on)
				overlays-=aura
				underlays-=underlays
				aura_on=1
				if(race=="Saiyan"||race=="Half Saiyan")underlays+=new/obj/Aura/SSJ_Aura
				if(race=="Changeling")underlays+=new/obj/Aura/Chang_Aura
				if(race=="Majin"||race=="Half Majin")underlays+=new/obj/Aura/Maj_Aura
				if(race=="Namekian"||race=="Saibaman"||race=="Bio-Android")underlays+=new/obj/Aura/Nam_Aura
				if(race=="Kai"||race=="Ultimate Hybrid"||race=="Makyo"||race=="Galactic Warrior")underlays+=new/obj/Aura/And_Aura1
				if(race=="Android")
					if(!form_1)underlays+=new/obj/Aura/And_Aura
					if(form_1)underlays+=new/obj/Aura/And_Aura1
				if(race=="Tuffle"||race=="Dragon"||race=="Konat")underlays+=new/obj/Aura/Nor_Aura
				if(race=="Saiyan"&&race=="Legendary Saiyan")underlays+=new/obj/Aura/LSSJ_Aura
				if(race=="Demon")
					if(!form_1)underlays+=new/obj/Aura/Chang_Aura
					if(form_1&&!form_2)underlays+=new/obj/Aura/Demon_Aura1
					if(form_2&&!form_3)underlays+=new/obj/Aura/Demon_Aura2
					if(form_3&&!form_4)underlays+=new/obj/Aura/Demon_Aura3
		Put_Aura()
			aura_on=1
			if(race=="Saiyan"||race=="Legendary Saiyan"||race=="Half Saiyan")underlays+=new/obj/Aura/SSJ_Aura
			if(race=="Changeling")underlays+=new/obj/Aura/Chang_Aura
			if(race=="Majin"||race=="Half Majin")underlays+=new/obj/Aura/Maj_Aura
			if(race=="Namekian"||race=="Saibaman"||race=="Bio-Android")underlays+=new/obj/Aura/Nam_Aura
			if(race=="Android")
				if(form_1)underlays+=new/obj/Aura/And_Aura
				if(form_2)underlays+=new/obj/Aura/And_Aura1
			if(race=="Ultimate Hybrid"||race=="Makyo"||race=="Galactic Warrior")underlays+=new/obj/Aura/And_Aura1
			if(race=="Kai")if(form_1)underlays+=new/obj/Aura/And_Aura1
			if(race=="Tuffle"||race=="Dragon"||race=="Konat")underlays+=new/obj/Aura/Nor_Aura
			if(race=="Saiyan"||race=="Legendary Saiyan")underlays+=new/obj/Aura/LSSJ_Aura
			if(race=="Demon")
				if(form_1&&!form_2)underlays+=new/obj/Aura/Chang_Aura
				if(form_2&&!form_3)underlays+=new/obj/Aura/Demon_Aura1
				if(form_3&&!form_4)underlays+=new/obj/Aura/Demon_Aura2
				if(form_4&&!form_5)underlays+=new/obj/Aura/Demon_Aura3


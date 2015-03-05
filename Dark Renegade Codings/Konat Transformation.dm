mob/proc/KonatTrans()
	if(src.doing||src.cant_trans)return
	else
		if(!src.form_1)
			if(src.powerlevel_max >= 10000000)
				src.cant_trans = 1
				src.doing = 1
				src.icon_state="play"
				src.overlays+='Music Box.dmi'
				view(8)<<sound(null)
				view(8)<<sound('Tapion.mid',0)
				if(src.trans1t!="")view(8)<<"\white[src]: \font [src.trans1t]"
				src.AllTranse()
				src.frozen = 1
				var/push=4
				spawn(1)
					while(push)
						push-=1
						for(var/mob/PC/M in oview(8))
							var/FallDir = get_dir(src,M)
							step(M,FallDir)
							switch(FallDir)
								if(NORTH)M.dir = SOUTH
								if(NORTHWEST)M.dir = SOUTHEAST
								if(WEST)M.dir = EAST
								if(SOUTHWEST)M.dir = NORTHEAST
								if(SOUTH)M.dir = NORTH
								if(SOUTHEAST)M.dir = NORTHWEST
								if(EAST)M.dir = WEST
								if(NORTHEAST)M.dir = SOUTHWEST
						sleep(15)
				sleep(60)
				new/obj/techs/Overlays/Crater_Center(src.loc)
				for(var/obj/Technique/InvertPower/T in src)del(T)
				src.speed_max-=2000
				if(src.speed_max<1000)src.speed_max=1000
				src.speed=src.speed_max
				src.overlays-='Music Box.dmi'
				src.overlays += 'Elec White.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.powerlevel_max *= 6
				src.ki_max *= 6
				src.kidefense_max *= 6
				src.strength_max *= 6
				src.defence_max *= 6
				src.critical_max += 40
				src.dodge_max += 40
				src.reflect_max += 40
				src.block_max += 40
				src.counter_max += 40
				Skills_Checker()
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.kidefense=src.kidefense_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				for(var/turf/T in view(src,6))
					var/chance = roll(1,20)
					if(chance == 15)
						missile(new/obj/PurplePU, src, T)
				src.icon_state = ""
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				if(!wait_room)safe=0
				src.spam_delay=0
				src.trans_delay=0
				src.VarReset()
				spawn(40)if(src)src.cant_trans = 0
				return
		else
			if(!src.form_2)
				if(!src.doing)
					if(!src.cant_trans)
						if(src.powerlevel_max >= 100000000)
							src.cant_trans = 1
							src.doing = 1
							usr.icon_state="play"
							usr.overlays+='Music Box.dmi'
							view(8)<<sound(null)
							view(8)<<sound('Tapion.mid',0)
							if(src.trans1t!="")view(8)<<"\white[src]: \font [src.trans1t]"
							src.AllTranse()
							src.frozen = 1
							var/push=4
							spawn(1)
								while(push)
									push-=1
									for(var/mob/PC/M in oview(8))
										var/FallDir = get_dir(src,M)
										step(M,FallDir)
										switch(FallDir)
											if(NORTH)M.dir = SOUTH
											if(NORTHWEST)M.dir = SOUTHEAST
											if(WEST)M.dir = EAST
											if(SOUTHWEST)M.dir = NORTHEAST
											if(SOUTH)M.dir = NORTH
											if(SOUTHEAST)M.dir = NORTHWEST
											if(EAST)M.dir = WEST
											if(NORTHEAST)M.dir = SOUTHWEST
									sleep(15)
							sleep(60)
							new/obj/techs/Overlays/Crater_Center(src.loc)
							src.overlays-='Music Box.dmi'
							src.speed_max-=2000
							if(src.speed_max<1000)src.speed_max=1000
							src.speed=src.speed_max
							src.powerlevel_max *= 5
							src.ki_max *= 5
							src.kidefense_max*=5
							src.strength_max *= 5
							src.defence_max *= 5
							src.critical_max += 25
							src.dodge_max += 15
							src.reflect_max += 15
							src.block_max += 5
							src.counter_max += 25
							Skills_Checker()
							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.Big_Aura()
							src.powerlevel = src.powerlevel_max
							src.ki = src.ki_max
							src.kidefense=src.kidefense_max
							src.strength = src.strength_max
							src.defence = src.defence_max
							for(var/turf/T in view(src,6))
								var/chance = roll(1,20)
								if(chance == 15)
									missile(new/obj/PurplePU, src, T)
							src.icon_state = ""
							src.form_2 = 1
							src.frozen = 0
							src.doing = 0
							src.spam_delay=0
							if(!wait_room)safe=0
							src.trans_delay=0
							src.VarReset()
							src.permtpsboosted=1
							return
obj
	Equipment
		MagicBox
			name="Magic Box"
			icon='Music Box.dmi'
			icon_state="box"
			Click()
				if(usr.race == "Konat")
					if(usr.e_db_1&&usr.e_db_2&&usr.e_db_3&&usr.e_db_4&&usr.e_db_5&&usr.e_db_6&&usr.e_db_7)
						for(var/obj/Earth_Dragonballs/O in world)del(O)
						usr.e_db_1 = 0
						usr.e_db_2 = 0
						usr.e_db_3 = 0
						usr.e_db_4 = 0
						usr.e_db_5 = 0
						usr.e_db_6 = 0
						usr.e_db_7 = 0
						DBNIGHT()
						world<<"<font color = green>The sky darkens as Shenron is summoned!</font>"
						usr << browse('Shenron.png',"display=0")
						usr << browse("<body bgcolor=\"black\"><center><img src=Shenron.BMP><p><font color = \"yellow\" size = 4>You have summoned Shenron! </center>")
						spawn(1)world.Earth_Dragonball_Spawn(3000)
						sleep(15)
						usr << browse(null)
						world<<"<font color = green>The sky turns to it's normal color as Shenron grants the wish and departs away!</font>"
						DBDAY()
						usr.contents+=new/obj/Equipment/Flute
						del(src)
						alert("Your wish has been granted!")
		Flute
			icon='Music Box.dmi'
			Click()
				if(usr.race == "Konat")
					if(!usr.form_1)
						switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
							if("Yes")
								if(usr.trans_delay)return
								usr.trans_delay = 1
								usr.KonatTrans()
							if("No")
								usr.spam_delay=0
								return
					else
						if(usr.form_1&&!usr.form_2)
							switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
								if("Yes")
									if(usr.trans_delay)return
									usr.trans_delay = 1
									usr.KonatTrans()
								if("No")
									usr.spam_delay=0
									return
						else
							if(usr.form_2)
								if(usr.tech_cooldown)
									usr<<"You must cooldown."
									return
								if(usr.doing)
									usr<<"You are doing something."
									return
								if(usr.frozen)
									usr<<"You can't move right now."
									return
								if(usr.ki<5000)
									usr<<"Your ki is too low."
									return
								if(usr.ki_lock)
									usr<<"You can't use ki right now."
									return
								if(usr.safe)
									usr<<"You can't attack right now."
									return
								if(!usr.pk)
									usr<<"You are not a combatant!"
									return
								usr.frozen=1
								usr.doing=1
								usr.icon_state="play"
								usr.overlays+='Music Box.dmi'
								view(8)<<sound(null)
								view(8)<<sound('Tapion.mid',0)
								sleep(60)
								for(var/mob/PC/M in view(8))if(M.powerlevel<M.powerlevel_max)M.powerlevel=M.powerlevel_max
								for(var/mob/PC/M in view(8))if(M.ki<M.ki_max)M.ki=M.ki_max
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								usr.overlays-='Music Box.dmi'
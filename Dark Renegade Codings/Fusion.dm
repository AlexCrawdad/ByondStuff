obj/Technique/FusionDance
	verb
		Fusion_Dance(mob/M in oview(1))
			set category = "Techniques"
			if(usr.Oozaru)
				usr<<"Revert from Oozaru first."
				return
			if(usr.tourny||usr.babatourny)
				usr<<"You are in a tournament!"
				return
			if(M.tourny||M.babatourny||M.jrtourny||M.guildtourny)
				usr<<"[M] are in a tournament!"
				return
			if(M.Oozaru)
				usr<<"[M] must revert from Oozaru first."
				return
			if(M == usr||!M||!usr||M.potara_fused||usr.potara_fused)return
			if(usr.dead)
				usr<<"You are dead."
				M<<"[usr] is dead."
				return
			if(M.dead)
				usr<<"[M] is dead."
				M<<"You are dead."
				return
			else
				if(!usr.asking_fuse || !M.asking_fuse)
					if(!usr.fused)
						if(!M.fused)
							if(istype(M,/mob/PC))
								if(usr.powerlevel==M.powerlevel)
									if(usr.race==M.race)
										if(M.learn_fusiondance)
											if(!M.talking && !usr.talking)
												usr<<"<b>Asking [M] if they wants to fuse!"
												if(usr.doing||M.doing)return
												usr.asking_fuse = 1
												M.asking_fuse = 1
												switch(alert(M,"[usr] wants to perform the Fusion Dance with you!  Do you want to perform the Fusion Dance with [usr]?  It lasts for about 5 minutes and since [usr] is starting the dance, he will control the fusion! Fuse?","Fuse","Yes","No"))
													if("Yes")
														if(!usr)return
														if(!M)return
														if(usr.fused||M.fused||usr.doing||M.doing)return
														spawn(1)
															usr.FusionStatSave()
															M.FusionStatSave()
														usr.fused = 1
														M.fused = 1
														M.FuseFollower = 1
														start
														var/fusename = input("What is your name, Fused Warrior?") as text
														if(!fusename)
															usr<<"You cannot use blank name!"
															goto start
															return
														if(lentext(fusename)>15)
															usr<<"That name is too long!"
															goto start
															return
														if(lentext(fusename)<2)
															usr<<"That name is too short!"
															goto start
															return
														for(var/A in 1 to length(fusename))
															switch(text2ascii(fusename,A))
																if(33 to 64)
																	usr<<"You cannot use special characters in your name!"
																	goto start
																	return
																if(91 to 96)
																	usr<<"You cannot use special characters in your name!"
																	goto start
																	return
																if(123 to 126)
																	usr<<"You cannot use special characters in your name!"
																	goto start
																	return
														for(var/mob/PC/C in world)if(C.name==fusename)
															usr<<"There's someone else with that name!"
															goto start
															return
														usr.random = rand(1,2)
														sleep(4)
														if(!M||!usr)return
														view(8) << "<font face = arial><font color=white>[usr]: <tt>Fuuuu.......SION!...... HAAA!!!"
														view(8) << "<font face = arial><font color=white>[M]: <tt>Fuuuu.......SION!...... HAAA!!!"
														view(8) << "[M] and [usr] fuse to make [fusename]!!!"
														M.icon = ""
														M.density = 0
														M.overlays -= M.overlays
														M.underlays-=M.underlays
														M.doing=1
														M.name = "[fusename]"
														usr.name = "[fusename]"
														M.loc=usr.loc
														M.follow = usr.name
														usr.powerlevel_max += M.powerlevel_max
														usr.ki_max += M.ki_max
														usr.strength_max += M.strength_max
														usr.defence_max += M.defence_max
														usr.kidefense_max+=M.kidefense_max
														usr.powerlevel = usr.powerlevel_max
														usr.ki = usr.ki_max
														usr.strength = usr.strength_max
														usr.defence = usr.defence_max
														M.powerlevel_max = 1
														M.powerlevel = 1
														M.ki_max = 1
														M.ki = 1
														M.kidefense_max=1
														M.kidefense=1
														M.strength=1
														M.strength_max=1
														M.defence=1
														M.defence_max=1
														spawn(1)M.FusionFollow(usr)
														if(usr.race=="Makyo")
															usr.finalformfuse=1
															usr.MakyoTrans()
															spawn(1500)if(usr)usr.UnFuse()
															spawn(1500)if(M)M.UnFuse()
														if(usr.race=="Galactic Warrior")
															usr.finalformfuse=1
															usr.BojackTrans()
															spawn(1500)if(usr)usr.UnFuse()
															spawn(1500)if(M)M.UnFuse()
														if(usr.race=="Saibaman")
															usr.finalformfuse=1
															usr.SaibamanFuseForm()
															spawn(1500)if(usr)usr.UnFuse()
															spawn(1500)if(M)M.UnFuse()
														if(usr.race=="Saiyan")
															usr.finalformfuse=1
															usr.SaiyanFuseForm()
															spawn(1500)if(usr)usr.UnFuse()
															spawn(1500)if(M)M.UnFuse()
														if(usr.race=="Changeling")
															usr.finalformfuse=1
															usr.ChanglingFuseForm()
															spawn(1500)if(usr)usr.UnFuse()
															spawn(1500)if(M)M.UnFuse()
														if(usr.race=="Demon")
															usr.finalformfuse=1
															usr.DemonFuseForm()
															spawn(1500)if(usr)usr.UnFuse()
															spawn(1500)if(M)M.UnFuse()
														if(usr.race=="Kai")
															usr.finalformfuse=1
															usr.KaiFuseForm()
															spawn(1500)if(usr)usr.UnFuse()
															spawn(1500)if(M)M.UnFuse()
														if(usr.race=="Half Saiyan")
															usr.finalformfuse=1
															usr.HalfSaiyanFuseForm()
															spawn(1500)if(usr)usr.UnFuse()
															spawn(1500)if(M)M.UnFuse()
														if(usr.race=="Human")
															usr.finalformfuse=1
															usr.HumanFuseForm()
															spawn(1500)if(usr)usr.UnFuse()
															spawn(1500)if(M)M.UnFuse()
													if("No")
														usr<<"[M] doesn't want to fuse!"
														usr.asking_fuse = 0
														M.asking_fuse = 0
														return
										else
											usr<<"[M] doesn't know how to do the Fusion Dance!"
											M<<"You don't know how to do the Fusion Dance!"
											usr.asking_fuse = 0
											M.asking_fuse = 0
											return
									else
										usr<<"[M] must be the same race as you!"
										M<<"[usr] must be the same race as you!"
										usr.asking_fuse = 0
										M.asking_fuse = 0
										return
								else
									usr<<"You want to fuse with [M], but your powerlevels aren't aligned!"
									M << "[usr] wants to fuse with you, but your powerlevels aren't exactly the same!"
									usr.asking_fuse = 0
									M.asking_fuse = 0
									return
							else
								usr<<"You can only Fuse with other players."
								usr.asking_fuse = 0
								M.asking_fuse = 0
								return
mob
	proc
		FusionFollow(mob/M)
			while(fused&&follow==M.name)
				if(!M||!M.fused||!src||!fused)
					if(src)UnFuse()
					if(M)M.UnFuse()
					break
				loc=M.loc
				sleep(1)
mob
	proc
		UnFuse()
			if(!src||!src.fused)return
			var/partnername=src.name
			src.finalformfuse=0
			src<<"Time's up! You have UnFused!"
			src.follow=""
			src.overlays-=src.overlays
			src.FusionStatLoad()
			sleep(2)
			src.fused=0
			src.frozen=0
			src.doing=0
			src.boxing=0
			src.density=1
			src.asking_fuse=0
			src.FuseFollower = 0
			src.overlays -= 'Hair - SSJ4(fused).dmi'
			src.overlays -= 'ssj4tail.dmi'
			src.form_1 = 0
			src.form_2 = 0
			src.form_3 = 0
			src.form_4 = 0
			src.form_5 = 0
			src.form_6 = 0
			src.underlays -= src.underlays
			src.overlays -= src.aura
			src.aura = 0
			src.overlays -= 'Elec Blue Small.dmi'
			src.overlays -= 'Elec Blue Big.dmi'
			src.overlays -= 'Elec Red Big.dmi'
			src.overlays -= 'Elec White.dmi'
			src.overlays -= 'Hair - SSJ3.dmi'
			src.overlays -= 'Hair - SSJ4.dmi'
			src.overlays-='halo.dmi'
			spawn(1)if(src)
				src.AutoRevert()
				src.Power_Redefine()
				src.Skin_Apply()
				src.Hair_Apply()
			for(var/mob/PC/M in world)if(M.name==partnername)
				if(!M||!M.fused)return
				M.finalformfuse=0
				M<<"Time's up! You have UnFused!"
				M.follow=""
				M.overlays-=M.overlays
				M.FusionStatLoad()
				sleep(2)
				M.fused=0
				M.frozen=0
				M.doing=0
				M.boxing=0
				M.density=1
				M.asking_fuse=0
				M.FuseFollower = 0
				M.overlays -= 'Hair - SSJ4(fused).dmi'
				M.overlays -= 'ssj4tail.dmi'
				M.form_1 = 0
				M.form_2 = 0
				M.form_3 = 0
				M.form_4 = 0
				M.form_5 = 0
				M.form_6 = 0
				M.underlays -= M.underlays
				M.overlays -= M.aura
				M.aura = 0
				M.overlays -= 'Elec Blue Small.dmi'
				M.overlays -= 'Elec Blue Big.dmi'
				M.overlays -= 'Elec Red Big.dmi'
				M.overlays -= 'Elec White.dmi'
				M.overlays -= 'Hair - SSJ3.dmi'
				M.overlays -= 'Hair - SSJ4.dmi'
				M.overlays-='halo.dmi'
				spawn(1)if(M)
					M.AutoRevert()
					M.Power_Redefine()
					M.Skin_Apply()
					M.Hair_Apply()
mob
	proc
		FusionStatSave()
			var/savefile/S=new("Player Saves/[src.ckey]/Fusion.sav")
			S["name"]<<name
			S["level"]<<level
			S["powerlevel_max"]<<powerlevel_max
			S["ki_max"]<<ki_max
			S["kidefense_max"]<<kidefense_max
			S["strength_max"]<<strength_max
			S["defence_max"]<<defence_max
			S["icon"]<<icon
		FusionStatLoad()
			var/savefile/L=new("Player Saves/[src.ckey]/Fusion.sav")
			L["name"]>>name
			L["level"]>>level
			L["powerlevel_max"]>>powerlevel_max
			L["ki_max"]>>ki_max
			L["kidefense_max"]>>kidefense_max
			L["strength_max"]>>strength_max
			L["defence_max"]>>defence_max
			L["icon"]>>icon
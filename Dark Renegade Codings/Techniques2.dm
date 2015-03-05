mob
	var
		gravityfielddelay=0
		buffdelay1=0
		buffdelay2=0
		buffdelay3=0
		buffdelay4=0
		buffdelay5=0
		buffdelay6=0
		buff1=0
		buff2=0
		buff3=0
		buff4=0
		tmp
			chargingfield=0
			staminabuff=0
			expbuff=0
			gravityfieldon=0
			gravityfieldspam=0
	proc
		GravityFieldBonus()
			if(gravityfieldon)
				spawn(300)
					if(gravityfieldon)
						if(ki>1000000)
							ki-=1000000
							if(ki<0)ki=0
							gravityfielddelay+=2
							if(gravityfielddelay>=300)
								gravityfieldon=0
								spawn(1)GravityFieldCooldown()
							else
								for(var/mob/PC/M in view(8))
									var/PlLoss=level*10
									M<<"You feel [src]'s Gravity Field pull down on you."
									if(!M.dead)
										M.powerlevel-=PlLoss
										M.DeathCheck(src)
									sleep(1)
								for(var/mob/PC/M in view(8))
									if(M.stamina<M.stamina_max)
										var/boostlvl=level
										if(boostlvl>1500)boostlvl=1500
										M.stamina_exp+=rand(1,5)
										M.exp+=(boostlvl/100)+1
										M.stamina+=1+((boostlvl/100)*0.8)
										spawn(1)M.Level_Up()
										spawn(1)M.Fatigue_Level_Up()
								spawn(300)if(src&&gravityfieldon)GravityFieldBonus()
						else
							if(gravityfieldon)
								src<<"You have ran out of Ki to sustain the Gravity Field."
								gravityfieldon=0
								spawn(1)GravityFieldCooldown()
		GravityFieldCooldown()
			if(!gravityfieldon)
				spawn(300)if(src)
					if(!gravityfieldon)
						if(gravityfielddelay)
							gravityfielddelay-=1
							if(gravityfielddelay<0)
								gravityfielddelay=0
								return
							spawn(300)if(src&&!gravityfieldon)GravityFieldCooldown()
		BuffCooldown1()
			spawn(300)if(src)
				if(buffdelay1)
					buffdelay1-=1
					if(buffdelay1<0)
						buffdelay1=0
						return
					spawn(300)if(src&&buffdelay1)BuffCooldown1()
		BuffCooldown2()
			spawn(300)if(src)
				if(buffdelay2)
					buffdelay2-=1
					if(buffdelay2<0)
						buffdelay2=0
						return
					spawn(300)if(src&&buffdelay2)BuffCooldown2()
		BuffCooldown3()
			spawn(300)if(src)
				if(buffdelay3)
					buffdelay3-=1
					if(buffdelay3<0)
						buffdelay3=0
						return
					spawn(300)if(src&&buffdelay3)BuffCooldown3()
		BuffCooldown4()
			spawn(300)if(src)
				if(buffdelay4)
					buffdelay4-=1
					if(buffdelay4<0)
						buffdelay4=0
						return
					spawn(300)if(src&&buffdelay4)BuffCooldown4()
		BuffCooldown5()
			spawn(300)if(src)
				if(buffdelay5)
					buffdelay5-=1
					if(buffdelay5<0)
						buffdelay5=0
						return
					spawn(300)if(src&&buffdelay5)BuffCooldown5()
		BuffCooldown6()
			spawn(300)if(src)
				if(buffdelay6)
					buffdelay6-=1
					if(buffdelay6<0)
						buffdelay6=0
						return
					spawn(300)if(src&&buffdelay6)BuffCooldown6()
		BuffDown(T)
			switch(T)
				if("PL")
					spawn(54000)if(src)
						src<<"Your Powerlevel is back to normal."
						buff1=0
						Power_Redefine()
				if("KI")
					spawn(54000)if(src)
						src<<"Your Ki is back to normal."
						buff2=0
						Power_Redefine()
				if("STR")
					spawn(54000)if(src)
						src<<"Your Strength is back to normal."
						buff3=0
						Power_Redefine()
				if("DEF")
					spawn(54000)if(src)
						src<<"Your Defense is back to normal."
						buff4=0
						Power_Redefine()
				if("FAT")
					spawn(9000)if(src)
						src<<"Your Stamina is back to normal."
						staminabuff=0
				if("EXP")
					spawn(9000)if(src)
						src<<"Your Exp is back to normal."
						expbuff=0
obj
	Technique
		GravityField
			verb
				Gravity_Field()
					set category = "Techniques"
					set src in usr.contents
					if(usr.gravityfieldspam)
						usr<<"You must cooldown."
						return
					if(usr.gravityfieldon)
						usr.gravityfieldon=0
						usr.GravityFieldCooldown()
						view(8)<<"\blue [usr] has destroyed their Gravity Field."
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't use any techniques right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					for(var/mob/PC/M in oview(18))
						if(M.race=="Kai"&&M.gravityfieldon||M.chargingfield)
							usr<<"Another Kai is using Gravity Field near you."
							return
					usr.doing=1
					usr.frozen=1
					usr.gravityfieldspam=1
					usr.training=1
					usr.icon_state="enrage"
					usr.chargingfield=1
					view(8)<<"\blue [usr] starts charging up a Gravity Field."
					spawn(50)if(usr)
						usr.doing=0
						usr.training=0
						usr.frozen=0
						usr.icon_state=""
						if(usr.ki<1000000)
							usr<<"Your ki is too low."
							return
						else
							usr.chargingfield=0
							usr.gravityfieldon=1
							view(8)<<"\blue A Gravity Field is created all around [usr]."
							spawn(1)usr.GravityFieldBonus()
					spawn(120)if(usr)usr.gravityfieldspam=0
		Sacrifice
			verb
				Sacrifice()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't use any techniques right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.icon_state="spirit bomb"
					usr.doing=1
					usr.training=1
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in world)if(M.dead)Rev.Add(M)
					Rev.Remove(usr)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to sacrifice yourself for?")as null|anything in Rev
					if(R=="Cancel"||R==null)
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						usr.training=0
						return
					if(!R.dead)
						usr<<"[R] isn't dead."
						return
					else
						usr.doing=1
						usr.frozen=1
						usr.tech_cooldown=1
						spawn(45)if(usr)
							usr.doing=0
							usr.frozen=0
							usr.training=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
							if(!R.dead)
								usr<<"[R] isn't dead."
								return
							if(usr.ki<5000000)
								usr<<"Your ki is too low."
								return
							else
								usr.ki-=5000000
								R.powerlevel = R.powerlevel_max
								R.overlays -= 'halo.dmi'
								R.dead=0
								R<<"\blue [usr] sacrificed their live for you!"
								usr.powerlevel=0
								usr.DeathSacrifice()
		BuffPowerlevel
			verb
				BuffPowerlevel()
					set category = "Techniques"
					set name = "Buff Powerlevel"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.buffdelay1)
						usr<<"You must wait [usr.buffdelay1] minutes."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't use any techniques right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.tech_cooldown=1
					usr.training=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(8))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel"||R==null)
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						usr.training=0
						return
					else
						spawn(45)if(usr)
							usr.doing=0
							usr.frozen=0
							usr.training=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
							if(R.buff1)
								usr<<"[R]'s Powerlevel is already buffed."
								return
							if(usr.ki<1000000)
								usr<<"Your ki is too low."
								return
							else
								var/buff=usr.ki*10
								if(buff>R.powerlevel)buff=R.powerlevel
								R<<"\blue [usr] buffed your <font color=silver>Powerlevel</font>!"
								R.powerlevel+=buff
								R.buff1=1
								spawn(1)R.BuffDown("PL")
								usr.buffdelay1=5
								usr.BuffCooldown1()
		BuffKi
			verb
				BuffKi()
					set category = "Techniques"
					set name = "Buff Ki"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.buffdelay2)
						usr<<"You must wait [usr.buffdelay2] minutes."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't use any techniques right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.tech_cooldown=1
					usr.training=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(8))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel"||R==null)
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						usr.training=0
						return
					else
						spawn(45)if(usr)
							usr.doing=0
							usr.frozen=0
							usr.training=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
							if(R.buff2)
								usr<<"[R]'s Ki is already buffed."
								return
							if(usr.ki<1000000)
								usr<<"Your ki is too low."
								return
							else
								var/buff=usr.ki*10
								if(buff>R.ki)buff=R.ki
								R<<"\blue [usr] buffed your <font color=silver>Ki</font>!"
								R.ki+=buff
								R.kidefense+=buff
								R.buff2=1
								spawn(1)R.BuffDown("KI")
								usr.buffdelay2=5
								usr.BuffCooldown2()
		BuffStrength
			verb
				BuffStrength()
					set category = "Techniques"
					set name = "Buff Strength"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.buffdelay3)
						usr<<"You must wait [usr.buffdelay3] minutes."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't use any techniques right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.tech_cooldown=1
					usr.training=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(8))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel"||R==null)
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						usr.training=0
						return
					else
						spawn(45)if(usr)
							usr.doing=0
							usr.frozen=0
							usr.training=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
							if(R.buff3)
								usr<<"[R]'s Strength is already buffed."
								return
							if(usr.ki<1000000)
								usr<<"Your ki is too low."
								return
							else
								var/buff=usr.ki*10
								if(buff>R.strength)buff=R.strength
								R<<"\blue [usr] buffed your <font color=silver>Strength</font>!"
								R.strength+=buff
								R.buff3=1
								spawn(1)R.BuffDown("STR")
								usr.buffdelay3=5
								usr.BuffCooldown3()
		BuffDefense
			verb
				BuffDefense()
					set category = "Techniques"
					set name = "Buff Defense"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.buffdelay4)
						usr<<"You must wait [usr.buffdelay4] minutes."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't use any techniques right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.training=1
					usr.tech_cooldown=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(8))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel"||R==null)
						usr.doing=0
						usr.frozen=0
						usr.training=0
						usr.tech_cooldown=0
						usr.icon_state=""
						return
					else
						spawn(45)if(usr)
							usr.doing=0
							usr.frozen=0
							usr.training=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
							if(R.buff4)
								usr<<"[R]'s Defense is already buffed."
								return
							if(usr.ki<1000000)
								usr<<"Your ki is too low."
								return
							else
								var/buff=usr.ki*10
								if(buff>R.defence)buff=R.defence
								R.buff4=1
								R<<"\blue [usr] buffed your <font color=silver>Defense</font>!"
								R.defence+=buff
								spawn(1)R.BuffDown("DEF")
								usr.buffdelay4=5
								usr.BuffCooldown4()
		BuffStamina
			verb
				BuffStamina()
					set category = "Techniques"
					set name = "Buff Stamina"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.buffdelay5)
						usr<<"You must wait [usr.buffdelay5] minutes."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't use any techniques right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.tech_cooldown=1
					usr.training=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(8))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel"||R==null)
						usr.doing=0
						usr.frozen=0
						usr.training=0
						usr.tech_cooldown=0
						usr.icon_state=""
						return
					else
						spawn(45)if(usr)
							if(!R)return
							usr.doing=0
							usr.frozen=0
							usr.icon_state=""
							usr.tech_cooldown=0
							usr.training=0
							if(R.staminabuff)
								usr<<"[R]'s Stamina is already buffed."
								return
							if(usr.ki<5000000)
								usr<<"Your ki is too low."
								return
							else
								R.staminabuff=1
								R<<"\blue [usr] buffed your <font color=#0066FF>Stamina</font>! (15 minutes remaining)"
								spawn(1)R.BuffDown("FAT")
								usr.buffdelay5=5
								usr.BuffCooldown5()
		AdvancedTraining
			verb
				AdvancedTraining()
					set category = "Techniques"
					set name = "Advanced Training"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.buffdelay6)
						usr<<"You must wait [usr.buffdelay6] minutes."
						return
					if(usr.doing)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src<<"You can't use ki right now."
						return
					if(usr.safe)
						usr<<"You can't use any techniques right now."
						return
					if(!usr.pk)
						usr<<"You are not a combatant!"
						return
					usr.doing=1
					usr.frozen=1
					usr.training=1
					usr.tech_cooldown=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(8))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel"||R==null)
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.training=0
						usr.icon_state=""
						return
					else
						spawn(45)if(usr)
							usr.doing=0
							usr.frozen=0
							usr.icon_state=""
							usr.tech_cooldown=0
							usr.training=0
							if(!R)return
							if(R.staminabuff)
								usr<<"[R]'s Stamina is already buffed."
								return
							if(usr.ki<1000000)
								usr<<"Your ki is too low."
								return
							else
								R<<"\blue [usr] buffed your <font color=#FFCC00>Exp</font>! (15 minutes remaining)"
								R.expbuff=1
								spawn(1)R.BuffDown("EXP")
								usr.buffdelay6=5
								usr.BuffCooldown6()
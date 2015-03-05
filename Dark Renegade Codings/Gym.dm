mob/var/tmp/training=0
mob/var/tmp/gymafk=0
obj/Gym
	GWeight
		icon = 'Gym.dmi'
		name="Guild Weight"
		icon_state = "weight"
		value=500000
		invenable=1
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(2)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				if(!usr.in_guild)
					usr<<"You're not in a guild!"
					return
				if(!usr.guild_leader && usr.in_guild)
					usr<<"You're not a leader of your guild!"
					return
				usr<<"You picked up the [src]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=6)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				usr<<"You placed the [src]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)if(usr)usr.spam_delay=0
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.strength_max >= usr.powerlevel_max *3)
					usr<<"Your strength is at the max!"
					return
				if(usr.stamina >= usr.stamina_max)return
				if(usr.doing||usr.training||src.lift||usr.hiting||usr.boxing||usr.rest)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					usr.training=1
					src.lift = 1
					if(!usr)
						spawn(25)if(src)
							src.icon_state="weight"
							src.lift=0
						return
					usr.frozen = 1
					usr.doing = 1
					usr.hiting = 1
					src.icon_state = "weight-lift"
					usr.icon_state = "lift"
					sleep(22)
					spawn(5)if(src)src.lift = 0
					src.icon_state = "weight"
					if(!usr)return
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"
					usr.exp += 10.5
					if(usr.expbuff)usr.exp += 10.5*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 2.7*usr.staminarebirthgain
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statstr)
						var/strbonus=((usr.level*usr.statstr)/4)
						usr.strength_max += strbonus*usr.strengthrebirthgain
						usr.strength += strbonus*usr.strengthrebirthgain
					var/str_gain = usr.level*2+rand(500,1000)
					usr.strength_max += str_gain*usr.strengthrebirthgain
					usr.strength += str_gain*usr.strengthrebirthgain
					if(prob(10))
						usr<<"\white You feel your Muscles bulge slightly..."
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					spawn(1)usr.training=0
	GTreadmill
		icon = 'Gym.dmi'
		name="Guild Treadmill"
		icon_state = "treadmill"
		value=550000
		invenable=1
		var
			run = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(2)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				if(!usr.in_guild)
					usr<<"You're not in a guild!"
					return
				if(!usr.guild_leader && usr.in_guild)
					usr<<"You're not a leader of your guild!"
					return
				usr<<"You picked up the [src]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=6)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				usr<<"You placed the [src]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)if(usr)usr.spam_delay=0
			Run_on_Treadmill()
				set category = "Training"
				set src in oview(0)
				if(usr.doing||usr.training||src.run||usr.hiting||usr.stamina >= usr.stamina_max)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.dir=EAST
					src.run = 1
					src.icon_state = "treadmill on"
					usr.doing = 1
					usr.hiting = 1
					usr.training = 1
					usr.exp += 16.5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 16.5*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 3.3*usr.staminarebirthgain
					usr.stamina_exp += rand(50,60)*usr.staminarebirthgain
					usr.speed-=1
					usr.speed_max-=1
					if(usr.speed<1000)
						usr.speed=1000
					if(usr.speed_max<1000)
						usr.speed_max=1000
					usr.Level_Up()
					usr.Fatigue_Level_Up()
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					usr.dir = EAST
					if(!usr)
						spawn(35)if(src)
							src.icon_state="treadmill"
							src.run=0
						return
					usr.icon_state = "run"
					usr.frozen = 1
					sleep(35)
					src.icon_state = "treadmill"
					src.run = 0
					if(!usr)return
					usr.icon_state = ""
					usr.frozen = 0
					usr.doing = 0
					usr.hiting = 0
					usr.training=0
	GTraining_Dummy
		icon = 'Gym.dmi'
		icon_state = "dummy"
		name="Guild Dummy"
		density = 1
		value=250000
		invenable=1
		var
			hit = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(2)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				if(!usr.in_guild)
					usr<<"You're not in a guild!"
					return
				if(!usr.guild_leader && usr.in_guild)
					usr<<"You're not a leader of your guild!"
					return
				usr<<"You picked up the [src]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=6)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				usr<<"You placed the [src]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)if(usr)usr.spam_delay=0
			Hit_the_Dummy()
				set category = "Training"
				set src in oview(2)
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					usr.hiting = 1
					usr.unarmed_exp += 80*usr.EXPrebirthgain
					usr.exp += 4.2*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 4.2*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 1.7*usr.staminarebirthgain
					usr.UA_Level_Up()
					flick("attack",usr)
					spawn(1)usr.Level_Up()
					spawn(5)if(usr)usr.hiting=0
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
			Shoot_the_Dummy()
				set category = "Training"
				set src in oview(4)
				if(usr.ki <= 0)
					usr<<"Your ki is too low."
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					usr.hiting = 1
					usr.ki_exp += 80*usr.kirebirthgain
					usr.exp += 4.2*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 4.2*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 1.7
					usr.ki -= rand(20,50)+usr.level*10
					if(usr.ki<0)
						usr.ki=0
					usr.Ki_Level_Up()
					missile('Ki Blast.dmi',usr,src)
					spawn(1)usr.Level_Up()
					spawn(5)if(usr)usr.hiting=0
					if(usr.stamina>=usr.stamina_max)
						usr.stamina=usr.stamina_max
	GMachine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Guild Machine"
		layer = MOB_LAYER + 5
		density = 1
		value=500000
		invenable=1
		var
			punch = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(2)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				if(!usr.in_guild)
					usr<<"You're not in a guild!"
					return
				if(!usr.guild_leader && usr.in_guild)
					usr<<"You're not a leader of your guild!"
					return
				usr<<"You picked up the [src]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=6)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				usr<<"You placed the [src]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)if(usr)usr.spam_delay=0
			PunchIt()
				set category = "Training"
				set name="Hit the Machine"
				set src in oview(2)
				if(usr.defence_max >= usr.powerlevel_max *3)
					usr<<"Your defense is at the max!"
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.training||src.punch||usr.hiting||usr.dir!=EAST)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.punch = 1
					usr.frozen = 1
					usr.hiting = 1
					usr.doing = 1
					usr.training=1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					if(!usr)
						spawn(5)if(src)
							src.icon_state="machine"
							src.punch=0
						return
					sleep(22)
					src.punch = 0
					src.icon_state = "machine"
					if(!src in get_step(usr,usr.dir))return
					if(!usr)return
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					usr.exp+=10.5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp+=10.5*usr.EXPrebirthgain
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					if(!usr.staminabuff)usr.stamina+=2.7*usr.staminarebirthgain
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statdef)
						var/strbonus=((usr.level*2+usr.statdef)/4)
						usr.defence_max += strbonus*usr.defenserebirthgain
						usr.defence += strbonus*usr.defenserebirthgain
					var/def_gain = usr.level*2+rand(500,1000)
					usr.defence_max += def_gain*usr.defenserebirthgain
					usr.defence += def_gain*usr.defenserebirthgain
					if(prob(10))
						usr<<"\white The machine counters your attack and your defence rises..."
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					spawn(1)usr.training=0
	GKiDeflectMachine
		icon = 'Gym.dmi'
		icon_state = "kimachine"
		name="Guild Ki Machine"
		density = 1
		invenable=1
		value=600000
		var
			shots=0
			shooting=0
		proc
			ShootBlast()
				src.shots+=1
				if(src.shots>=150)
					src.shooting=0
					src.shots=0
				if(!src.shooting)return
				var/obj/KiTrainingBlast/A=new
				A.loc=locate(src.x+1,src.y,src.z)
				A.owner=src
				A.power=0
				A.dir=EAST
				spawn(20)src.ShootBlast()
		verb
			Pick_Up()
				set category=null
				set src in oview(2)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!usr.in_guild)
					usr<<"You're not in a guild!"
					return
				if(!usr.guild_leader && usr.in_guild)
					usr<<"You're not a leader of your guild!"
					return
				if(!src.x)return
				usr<<"You picked up the [src]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=6)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				usr<<"You placed the [src]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("World Save Files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)if(usr)usr.spam_delay=0
			Start_Ki_Training()
				set category = null
				set src in oview(8)
				if(src.shooting)
					usr<<"This machine is already turned on."
					return
				src.shots=0
				src.shooting=1
				src.ShootBlast()
			Stop_Ki_Training()
				set category=null
				set src in oview(8)
				if(src.shooting)
					usr<<"This machine is now turned off."
					src.shooting=0
					return
			Deflect()
				set category = "Training"
				set src in oview(8)
				if(usr.stamina >= usr.stamina_max||usr.doing)return
				if(usr.kidefense_max >= usr.powerlevel_max * 3)
					usr<< "Your ki defense ia at max!"
					return
				if(usr.ki<1000)
					usr<<"Your ki is too low."
					return
/*				usr.gymafk++
				if(usr.gymafk>=50)
					alert(usr,"AFK CHECK!")
					if(!usr)return
					usr.gymafk=0
					return*/
				if(usr.ki>=5000&&usr.stamina<=usr.stamina_max-5)
					usr.ki-=1000
					if(!usr.staminabuff)usr.stamina+=3.2*usr.staminarebirthgain
					usr.doing=1
					spawn(3)if(usr)usr.doing=0
					usr.icon_state = "attack"
					spawn(3)if(usr)usr.icon_state = ""
					for(var/obj/KiTrainingBlast/A in get_step(usr,usr.dir))
						if(A.dir==EAST&&usr.dir==WEST)
							A.dir=usr.dir
							if(usr.statki)
								var/strbonus=((usr.level*usr.statki)/13)
								usr.kidefense_max += strbonus*usr.kidefenserebirthgain
								usr.kidefense += strbonus*usr.kidefenserebirthgain
								usr.ki+=strbonus*0.45
								usr.ki_max+=strbonus*0.45
							var/boost=(2*usr.level*2+rand(1000,2000))
							usr.kidefense+=boost*usr.kidefenserebirthgain
							usr.kidefense_max+=boost*usr.kidefenserebirthgain
							usr.ki+=boost*(0.45*usr.kirebirthgain)
							usr.ki_max+=boost*(0.45*usr.kirebirthgain)
							if(prob(10))
								usr<<"Your ki defense has increased."
							usr.exp+=7.2*usr.EXPrebirthgain
							if(usr.expbuff)usr.exp+=7.2*usr.EXPrebirthgain
							usr.Level_Up()
//----------------------------------------------------Advanced Equipments
	AdvancedKiDeflectMachine
		icon = 'Gym.dmi'
		icon_state = "kimachine"
		name="Advanced Ki Machine"
		density = 1
		value=600000
		var
			shots=0
			shooting=0
		proc
			ShootBlast()
				src.shots+=1
				if(src.shots>=150)
					src.shooting=0
					src.shots=0
				if(!src.shooting)return
				var/obj/KiTrainingBlast/A=new
				A.loc=locate(src.x+1,src.y,src.z)
				A.owner=src
				A.power=0
				A.dir=EAST
				spawn(20)src.ShootBlast()
		verb
			Start_Ki_Training()
				set category = null
				set src in oview(8)
				if(src.shooting)
					usr<<"This machine is already turned on."
					return
				src.shots=0
				src.shooting=1
				src.ShootBlast()
			Stop_Ki_Training()
				set category=null
				set src in oview(8)
				if(src.shooting)
					usr<<"This machine is now turned off."
					src.shooting=0
					return
			Deflect()
				set category = "Training"
				set src in oview(8)
				if(usr.stamina >= usr.stamina_max||usr.doing)return
				if(usr.ki<1000)
					usr<<"Your ki is too low."
					return
				if(usr.kidefense_max >= usr.powerlevel_max *3)
					usr<< "Your ki defense is at max!"
					return
/*				usr.gymafk++
				if(usr.gymafk>=50)
					alert(usr,"AFK CHECK!")
					if(!usr)return
					usr.gymafk=0
					return*/
				if(usr.ki>=5000&&usr.stamina<=usr.stamina_max-5)
					usr.ki-=1000
					if(!usr.staminabuff)usr.stamina+=3.2
					usr.icon_state="attack"
					spawn(3)if(usr)usr.icon_state=""
					usr.doing=1
					spawn(3)if(usr)usr.doing=0
					for(var/obj/KiTrainingBlast/A in get_step(usr,usr.dir))
						if(A.dir==EAST&&usr.dir==WEST)
							A.dir=usr.dir
							if(usr.statki)
								var/strbonus=((usr.level*usr.statki)/13)
								usr.kidefense_max += strbonus*usr.kidefenserebirthgain
								usr.kidefense += strbonus*usr.kidefenserebirthgain
								usr.ki+=strbonus*(0.45*usr.kirebirthgain)
								usr.ki_max+=strbonus*(0.45*usr.kirebirthgain)
							var/boost=(3*usr.level*2+rand(1000,1500))
							usr.kidefense+=boost*usr.kidefenserebirthgain
							usr.kidefense_max+=boost*usr.kidefenserebirthgain
							usr.ki+=boost*(0.45*usr.kirebirthgain)
							usr.ki_max+=boost*(0.45*usr.kirebirthgain)
							if(prob(10))
								usr<<"Your ki defense has increased."
							usr.exp+=7.2*usr.EXPrebirthgain
							if(usr.expbuff)usr.exp+=7.2*usr.EXPrebirthgain
							usr.Level_Up()
	AdvancedWeight
		icon = 'Gym.dmi'
		name="Advanced Weight"
		icon_state = "weight"
		value=500000
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.strength_max >= usr.powerlevel_max *3)
					usr<<"Your strength is at the max!"
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.training||src.lift||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.lift = 1
					if(!usr)return
					usr.frozen = 1
					usr.doing = 1
					usr.hiting = 1
					usr.training=1
					src.icon_state = "weight-lift"
					usr.icon_state = "lift"
					sleep(22)
					spawn(5)src.lift = 0
					src.icon_state = "weight"
					if(!usr)return
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"
					usr.exp += 10.5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 10.5*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 2.7*usr.staminarebirthgain
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statstr)
						var/strbonus=((usr.level*usr.statstr)/4)
						usr.strength_max += strbonus*usr.strengthrebirthgain
						usr.strength += strbonus*usr.strengthrebirthgain
					var/str_gain = (3*usr.level*2+rand(1000,1500))
					usr.strength_max += str_gain*usr.strengthrebirthgain
					usr.strength += str_gain*usr.strengthrebirthgain
					if(prob(10))
						usr<<"\white You feel your Muscles bulge slightly..."
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					usr.training=0
	AdvancedMachine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Advanced Machine"
		layer = MOB_LAYER + 5
		density = 1
		value=500000
		var
			punch = 0
		verb
			PunchIt()
				set category = "Training"
				set name="Hit the Machine"
				set src in oview(2)
				if(usr.defence_max >= usr.powerlevel_max *3)
					usr<<"Your defense is at the max!"
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.training||src.punch||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.punch = 1
					if(!usr)return
					usr.frozen = 1
					usr.hiting = 1
					usr.training=1
					usr.doing = 1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					sleep(22)
					spawn(5)src.punch = 0
					src.icon_state = "machine"
					if(!usr)return
					if(!src in get_step(usr,usr.dir))return
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					usr.exp += 10.5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 10.5*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 2.7*usr.EXPrebirthgain
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statdef)
						var/strbonus=((usr.level*usr.statdef)/4)
						usr.defence_max += strbonus*usr.defenserebirthgain
						usr.defence += strbonus*usr.defenserebirthgain
					var/def_gain = (2*usr.level*2+rand(1000,2000))
					usr.defence_max += def_gain*usr.defenserebirthgain
					usr.defence += def_gain*usr.defenserebirthgain
					if(prob(10))
						usr<<"\white The machine counters your attack and your defence rises..."
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					spawn(1)if(usr)usr.training=0
	AdvancedTreadmill
		icon = 'Gym.dmi'
		name="Treadmill"
		icon_state = "treadmill"
		value=550000
		var
			run = 0
		verb
			Run_on_Treadmill()
				set category = "Training"
				set src in oview(0)
				if(usr.stamina >= usr.stamina_max)
					usr<<"You are too tired."
					return
				if(usr.doing||usr.training||src.run||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.dir=EAST
					src.run = 1
					src.icon_state = "treadmill on"
					usr.doing = 1
					usr.hiting = 1
					usr.training=1
					usr.exp += 16.5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 16.5*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 3.3*usr.staminarebirthgain
					usr.stamina_exp += rand(80,100)*usr.staminarebirthgain
					usr.speed-=1
					usr.speed_max-=1
					if(usr.speed<1000)
						usr.speed=1000
					if(usr.speed_max<1000)
						usr.speed_max=1000
					usr.Level_Up()
					usr.Fatigue_Level_Up()
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					usr.dir = EAST
					if(!usr)return
					usr.icon_state = "run"
					usr.frozen = 1
					sleep(35)
					src.icon_state = "treadmill"
					src.run = 0
					if(!usr)return
					usr.icon_state = ""
					usr.frozen = 0
					usr.doing = 0
					usr.hiting = 0
					usr.training=0
//------------------------------------------------------------------Noobie Equipments
	Weight
		icon = 'Gym.dmi'
		name="Weight"
		icon_state = "weight"
		value=500000
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.strength_max >= usr.powerlevel_max *3)
					usr<<"Your strength is at the max!"
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.training||src.lift||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.lift = 1
					if(!usr)return
					usr.frozen = 1
					usr.training=1
					usr.doing = 1
					usr.hiting = 1
					src.icon_state = "weight-lift"
					usr.icon_state = "lift"
					sleep(22)
					spawn(5)src.lift = 0
					src.icon_state = "weight"
					if(!usr)return
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"
					usr.exp += 10.5
					if(usr.expbuff)usr.exp += 10.5*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 2.7*usr.staminarebirthgain
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statstr)
						var/strbonus=((usr.level*2+usr.statstr)/4)
						usr.strength_max += strbonus*usr.strengthrebirthgain
						usr.strength += strbonus*usr.strengthrebirthgain
					var/str_gain = usr.level*2
					usr.strength_max += str_gain*usr.strengthrebirthgain
					usr.strength += str_gain*usr.strengthrebirthgain
					if(prob(10))
						usr<<"\white You feel your Muscles bulge slightly..."
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					spawn(1)usr.training=0
	Training_Dummy
		icon = 'Gym.dmi'
		icon_state = "dummy"
		name="Dummy"
		density = 1
		value=250000
		var
			hit = 0
		verb
			Hit_the_Dummy()
				set category = "Training"
				set src in oview(2)
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					usr.hiting = 1
					usr.unarmed_exp += 60
					usr.exp += 4.2*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 4.2*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 1.7*usr.staminarebirthgain
					usr.UA_Level_Up()
					flick("attack",usr)
					spawn(1)usr.Level_Up()
					spawn(5)if(usr)usr.hiting=0
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
			Shoot_the_Dummy()
				set category = "Training"
				set src in oview(4)
				if(usr.ki <= 0)
					usr<<"Your ki is too low."
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.hiting)return
				else
					usr.hiting = 1
					usr.ki_exp += 60*usr.kirebirthgain
					usr.exp += 4.2*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 4.2*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 1.7*usr.staminarebirthgain
					usr.ki -= rand(20,50)+usr.level*10
					if(usr.ki<0)
						usr.ki=0
					usr.Ki_Level_Up()
					missile('Ki Blast.dmi',usr,src)
					spawn(1)usr.Level_Up()
					spawn(5)if(usr)usr.hiting=0
					if(usr.stamina>=usr.stamina_max)
						usr.stamina=usr.stamina_max
	Machine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Machine"
		layer = MOB_LAYER + 5
		density = 1
		value=500000
		var
			punch = 0
		verb
			PunchIt()
				set category = "Training"
				set name="Hit the Machine"
				set src in oview(2)
				if(usr.defence_max >= usr.powerlevel_max *3)
					usr<<"Your defense is at the max!"
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.training||src.punch||usr.hiting||usr.dir!=EAST)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.punch = 1
					if(!usr)return
					usr.frozen = 1
					usr.hiting = 1
					usr.training=1
					usr.doing = 1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					sleep(22)
					spawn(5)src.punch = 0
					src.icon_state = "machine"
					if(!usr)return
					if(!src in get_step(usr,usr.dir))return
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					usr.exp+=10.5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp+=10.5*usr.EXPrebirthgain
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					if(!usr.staminabuff)usr.stamina+=2.7*usr.staminarebirthgain
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statdef)
						var/strbonus=((usr.level*2+usr.statdef)/4)
						usr.defence_max += strbonus*usr.defenserebirthgain
						usr.defence += strbonus*usr.defenserebirthgain
					var/def_gain = usr.level*2
					usr.defence_max += def_gain*usr.defenserebirthgain
					usr.defence += def_gain*usr.defenserebirthgain
					if(prob(10))
						usr<<"\white The machine counters your attack and your defence rises..."
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					spawn(1)usr.training=0
//-------------------------------------------------------------------Computer
	Computer
		icon = 'Generator.dmi'
		density = 1
		verb
			Start_Simulation()
				set category = "Training"
				set src in oview(2)
				if(usr.waiting)
					usr<<"There is a 15 second delay."
					return
				usr.waiting = 1
				switch(alert("What do you wish to do?","","Clone Fighter","Simulator Fighter","Cancel"))
					if("Cancel")
						usr.waiting=0
						return
					if("Simulator Fighter")
						var/npc_level = input("What Level do you wish to make the Simulation Fighter?")as num
						if(npc_level > usr.level*1.5)
							usr<<"\red Level cannot be higher than [round(usr.level*1.5)]."
							usr.waiting = 0
							return
						if(npc_level <= 0)
							usr.waiting = 0
							return
						var/mob/Monster/Simulator_NPC/N = new
						var/pl=(npc_level*npc_level)+rand(50,80)
						var/str=npc_level*(npc_level*50)+rand(50,80)
						var/sp=5-(npc_level/900)
						N.level = npc_level
						N.powerlevel = pl
						N.powerlevel_max = pl
						N.ki = pl*0.95
						N.ki_max = pl*0.95
						N.kidefense=pl*0.7
						N.kidefense_max=pl*0.7
						N.strength = str
						N.strength_max = str
						N.defence = str
						N.defence_max = str
						N.exp = npc_level*0.2
						N.zenni = (npc_level*7)+500
						N.speed = sp
						var/race = rand(1,6)
						var/skin = rand(1,3)
						var/hair = rand(1,6)
						if(race == 1)
							N.icon = 'Bebi - Form 1.dmi'
						if(race == 2)
							N.icon = 'Bio Android - Form 1.dmi'
						if(race == 3)
							N.icon = 'Changling - Form 1.dmi'
						if(race == 4)
							N.icon = 'Namek - Normal.dmi'
						if(race == 5)
							N.icon = 'Majin - Form 1.dmi'
						if(race == 6)
							if(skin == 1)
								N.icon = 'Male - White.dmi'
							if(skin == 2)
								N.icon = 'Male - Tan.dmi'
							if(skin == 2)
								N.icon = 'Male - Dark.dmi'
							if(hair == 1)
								N.hair_icon='Hair - Goku.dmi'
								N.overlays += N.hair_icon
								N.hair="Goku"
							if(hair == 2)
								N.hair_icon='Hair - Vegeta.dmi'
								N.overlays += N.hair_icon
								N.hair="Vegeta"
							if(hair == 3)
								N.hair_icon='Hair - Teen Gohan.dmi'
								N.hair="Teen Gohan"
								N.overlays += N.hair_icon
							if(hair == 4)
								N.hair_icon='Hair - Adult Gohan.dmi'
								N.hair="Adult Gohan"
								N.overlays += N.hair_icon
							if(hair == 5)
								N.hair_icon='Hair - Future Gohan.dmi'
								N.hair="Future Gohan"
								N.overlays += N.hair_icon
							if(hair == 6)
								N.hair_icon='Hair - Trunks Long.dmi'
								N.hair="Trunks Long"
								N.overlays += N.hair_icon
						N.loc = locate(usr.x,usr.y-1,usr.z)
						spawn(150)if(usr)usr.waiting = 0
					if("Clone Fighter")
						var/mob/Monster/Simulator_NPC/N = new
						N.level = usr.level
						N.icon = usr.icon
						N.powerlevel = usr.powerlevel
						N.powerlevel_max = usr.powerlevel_max
						N.ki = usr.ki
						N.ki_max = usr.ki_max
						N.kidefense=usr.kidefense
						N.kidefense_max=usr.kidefense_max
						N.strength = usr.strength
						N.strength_max = usr.strength_max
						N.defence = usr.defence
						N.defence_max = usr.defence_max
						N.exp = N.level*0.2
						N.zenni = (usr.level*7)+500
						N.speed = usr.speed_max
						N.loc = locate(usr.x,usr.y-1,usr.z)
						spawn(150)if(usr)usr.waiting = 0
	KiDeflectMachine
		icon = 'Gym.dmi'
		icon_state = "kimachine"
		name="Ki Machine"
		density = 1
		value=600000
		var
			shots=0
			shooting=0
		proc
			ShootBlast()
				src.shots+=1
				if(src.shots>=150)
					src.shooting=0
					src.shots=0
				if(!src.shooting)return
				var/obj/KiTrainingBlast/A=new
				A.loc=locate(src.x+1,src.y,src.z)
				A.owner=src
				A.power=0
				A.dir=EAST
				spawn(20)src.ShootBlast()
		verb
			Start_Ki_Training()
				set category = null
				set src in oview(8)
				if(src.shooting)
					usr<<"This machine is already turned on."
					return
				src.shots=0
				src.shooting=1
				src.ShootBlast()
			Stop_Ki_Training()
				set category=null
				set src in oview(8)
				if(src.shooting)
					usr<<"This machine is now turned off."
					src.shooting=0
					return
			Deflect()
				set category = "Training"
				set src in oview(8)
				if(usr.stamina >= usr.stamina_max||usr.doing)return
				if(usr.ki<1000)
					usr<<"Your ki is too low."
					return
				if(usr.kidefense_max >= usr.powerlevel_max *3)
					usr<< "Your ki defense is at max!"
					return
/*					usr.gymafk++
				if(usr.gymafk>=50)
					alert(usr,"AFK CHECK!")
					if(!usr)return
					usr.gymafk=0
					return*/
				if(usr.ki>=5000&&usr.stamina<=usr.stamina_max-5)
					usr.ki-=1000
					if(!usr.staminabuff)usr.stamina+=3.2
					usr.icon_state="attack"
					spawn(3)if(usr)usr.icon_state=""
					usr.doing=1
					spawn(3)if(usr)usr.doing=0
					for(var/obj/KiTrainingBlast/A in get_step(usr,usr.dir))
						if(A.dir==EAST&&usr.dir==WEST)
							A.dir=usr.dir
							if(usr.statki)
								var/strbonus=((usr.level*usr.statki)/13)
								usr.kidefense_max += strbonus*usr.kidefenserebirthgain
								usr.kidefense += strbonus*usr.kidefenserebirthgain
								usr.ki+=strbonus*(0.45*usr.kirebirthgain)
								usr.ki_max+=strbonus*(0.45*usr.kirebirthgain)
							var/boost=usr.level*2
							usr.kidefense+=boost*usr.kidefenserebirthgain
							usr.kidefense_max+=boost*usr.kidefenserebirthgain
							usr.ki+=boost*(0.45*usr.kirebirthgain)
							usr.ki_max+=boost*(0.45*usr.kirebirthgain)
							if(prob(10))
								usr<<"Your ki defense has increased."
							usr.exp+=7.2
							if(usr.expbuff)usr.exp+=7.2*usr.EXPrebirthgain
							usr.Level_Up()
obj
	KiTrainingBlast
		icon='Techs.dmi'
		icon_state="blast"
		layer=100
		range=0
		New()
			..()
			spawn(1)
				while(src)
					var/turf/T=src.loc
					for(var/obj/Gym/G in T)
						del(src)
						break
					if(!T || T==null)
						del(src)
						break
					if(T.density)
						del(src)
						break
					for(var/mob/M in T)
						del(src)
						break
					step(src,src.dir)
					src.range++
					if(src.range>=20)
						del(src)
						break
					sleep(2)
		Bump()
			del(src)
obj/GymNoob
	Weight
		icon = 'Gym.dmi'
		name="Weight"
		icon_state = "weight"
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.strength_max >= usr.powerlevel_max *3)
					usr<<"Your strength is at the max!"
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.training||src.lift||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.lift = 1
					usr.frozen = 1
					usr.doing = 1
					usr.hiting = 1
					usr.training=1
					src.icon_state = "weight-lift"
					usr.icon_state = "lift"
					sleep(22)
					if(!usr)
						spawn(25)if(src)
							src.lift=0
							src.icon_state="weight"
						return
					spawn(5)src.lift = 0
					src.icon_state = "weight"
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					usr.exp += 8.5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 8.5*usr.EXPrebirthgain
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"
					if(!usr.staminabuff)usr.stamina += 2.6*usr.staminarebirthgain
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statdef)
						var/strbonus=((usr.level*2+usr.statdef)/5)
						usr.defence_max += strbonus*usr.defenserebirthgain
						usr.defence += strbonus*usr.defenserebirthgain
					var/str_gain = usr.level*2
					usr.strength_max += str_gain*usr.strengthrebirthgain
					usr.strength += str_gain*usr.strengthrebirthgain
					if(prob(10))
						usr<<"\white You feel your Muscles bulge slightly..."
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					sleep(5)
					src.lift = 0
					spawn(1)if(usr)usr.training=0
	Treadmill
		icon = 'Gym.dmi'
		name="Treadmill"
		icon_state = "treadmill"
		var
			run = 0
		verb
			Run_on_Treadmill()
				set category = "Training"
				set src in oview(0)
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.training||usr.hiting||src.run)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.run = 1
					src.icon_state = "treadmill on"
					usr.doing = 1
					usr.hiting = 1
					usr.training=1
					usr.exp += 13.3
					if(usr.expbuff)usr.exp += 13.3*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 3.1*usr.staminarebirthgain
					usr.stamina_exp += rand(100,140)*usr.staminarebirthgain
					usr.speed-=1
					usr.speed_max-=1
					if(usr.speed<1000)
						usr.speed=1000
					if(usr.speed_max<1000)
						usr.speed_max=1000
					usr.Level_Up()
					usr.Fatigue_Level_Up()
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					usr.dir = EAST
					usr.icon_state = "run"
					usr.frozen = 1
					sleep(35)
					if(!usr)
						spawn(25)if(src)
							src.icon_state="treadmill"
							src.run=0
							return
					src.icon_state = "treadmill"
					src.run = 0
					if(!usr)return
					usr.icon_state = ""
					usr.frozen = 0
					usr.doing = 0
					usr.hiting = 0
					spawn(1)if(usr)usr.training=0
	Training_Dummy
		icon = 'Gym.dmi'
		icon_state = "dummy"
		name="Dummy"
		density = 1
		verb
			Hit_the_Dummy()
				set category = "Training"
				set src in oview(2)
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					usr.hiting = 1
					usr.unarmed_exp += 40
					usr.exp += 3.5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 3.5*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 1.5*usr.staminarebirthgain
					usr.UA_Level_Up()
					flick("attack",usr)
					spawn(1)usr.Level_Up()
					spawn(5)if(usr)usr.hiting=0
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
			Shoot_the_Dummy()
				set category = "Training"
				set src in oview(4)
				if(usr.ki <= 0)
					usr<<"Your ki is too low."
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					usr.hiting = 1
					usr.ki_exp += 40*usr.kirebirthgain
					usr.exp += 3.5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 3.5*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 1.5*usr.staminarebirthgain
					usr.ki -= rand(20,50)+usr.level*10
					if(usr.ki<0)
						usr.ki=0
					usr.Ki_Level_Up()
					missile('Ki Blast.dmi',usr,src)
					spawn(1)usr.Level_Up()
					spawn(5)if(usr)usr.hiting = 0
					if(usr.stamina>=usr.stamina_max)
						usr.stamina=usr.stamina_max
	Machine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Machine"
		layer = MOB_LAYER + 5
		density = 1
		var
			punch = 0
		verb
			PunchIt()
				set category = "Training"
				set name="Hit the Machine"
				set src in oview(2)
				if(usr.defence_max >= usr.powerlevel_max *3)
					usr<<"Your defense is at the max!"
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||src.punch||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.punch = 1
					usr.frozen = 1
					usr.hiting = 1
					usr.doing = 1
					usr.training=1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					sleep(22)
					if(!usr)
						spawn(25)if(src)
							src.icon_state="machine"
							src.punch=0
							return
					spawn(5)src.punch = 0
					src.icon_state = "machine"
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					usr.exp += 8.5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 8.5*usr.EXPrebirthgain
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					if(!usr.staminabuff)usr.stamina += 2.6*usr.staminarebirthgain
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statdef)
						var/strbonus=((usr.level*2+usr.statdef)/5)
						usr.defence_max += strbonus*usr.defenserebirthgain
						usr.defence += strbonus*usr.defenserebirthgain
					var/def_gain = usr.level*2
					usr.defence_max += def_gain*usr.defenserebirthgain
					usr.defence += def_gain*usr.defenserebirthgain
					if(prob(10))
						usr<<"\white The machine counters your attack and your defence rises..."
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					spawn(1)usr.training=0






//----------------------------------------------------Plot Equipments
obj/GymSuperAdvanced
	SuperAdvancedKiDeflectMachine
		icon = 'Gym.dmi'
		icon_state = "kimachine"
		name="Super Advanced Ki Machine"
		density = 1
		value=600000
		var
			shots=0
			shooting=0
		proc
			ShootBlast()
				src.shots+=1
				if(src.shots>=150)
					src.shooting=0
					src.shots=0
				if(!src.shooting)return
				var/obj/KiTrainingBlast/A=new
				A.loc=locate(src.x+1,src.y,src.z)
				A.owner=src
				A.power=0
				A.dir=EAST
				spawn(20)src.ShootBlast()
		verb
			Start_Ki_Training()
				set category = null
				set src in oview(8)
				if(src.shooting)
					usr<<"This machine is already turned on."
					return
				src.shots=0
				src.shooting=1
				src.ShootBlast()
			Stop_Ki_Training()
				set category=null
				set src in oview(8)
				if(src.shooting)
					usr<<"This machine is now turned off."
					src.shooting=0
					return
			Deflect()
				set category = "Training"
				set src in oview(8)
				if(usr.stamina >= usr.stamina_max||usr.doing)return
				if(usr.ki<1000)
					usr<<"Your ki is too low."
					return
				if(usr.kidefense_max >= usr.powerlevel_max *3)
					usr<< "Your ki defense is at max!"
					return
/*				usr.gymafk++
				if(usr.gymafk>=50)
					alert(usr,"AFK CHECK!")
					if(!usr)return
					usr.gymafk=0
					return*/
				if(usr.ki>=5000&&usr.stamina<=usr.stamina_max-5)
					usr.ki-=10000000
					if(!usr.staminabuff)usr.stamina+=3.2
					usr.icon_state="attack"
					spawn(3)if(usr)usr.icon_state=""
					usr.doing=1
					spawn(3)if(usr)usr.doing=0
					for(var/obj/KiTrainingBlast/A in get_step(usr,usr.dir))
						if(A.dir==EAST&&usr.dir==WEST)
							A.dir=usr.dir
							if(usr.statki)
								var/strbonus=((usr.level*10))
								usr.kidefense_max += strbonus*usr.kidefenserebirthgain
								usr.kidefense += strbonus*usr.kidefenserebirthgain
								usr.ki+=strbonus*(1*usr.kirebirthgain)
								usr.ki_max+=strbonus*(1*usr.kirebirthgain)
							var/boost=(3*usr.level*2+rand(5000,15000))
							usr.kidefense+=boost*usr.kidefenserebirthgain
							usr.kidefense_max+=boost*usr.kidefenserebirthgain
							usr.ki+=boost*(0.45*usr.kirebirthgain)
							usr.ki_max+=boost*(0.45*usr.kirebirthgain)
							if(prob(10))
								usr<<"Your ki defense has increased."
							usr.exp+=7.2*usr.EXPrebirthgain
							if(usr.expbuff)usr.exp+=7.2*usr.EXPrebirthgain
							usr.Level_Up()
	SuperAdvancedWeight
		icon = 'Gym.dmi'
		name="Super Advanced Weight"
		icon_state = "weight"
		value=500000
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.strength_max >= usr.powerlevel_max *3)
					usr<<"Your strength is at the max!"
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.training||src.lift||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.lift = 1
					if(!usr)return
					usr.frozen = 1
					usr.doing = 1
					usr.hiting = 1
					usr.training=1
					src.icon_state = "weight-lift"
					usr.icon_state = "lift"
					sleep(22)
					spawn(5)src.lift = 0
					src.icon_state = "weight"
					if(!usr)return
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"
					usr.exp += 15*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 15*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 5*usr.staminarebirthgain
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statstr)
						var/strbonus=((usr.level*usr.statstr)/2)
						usr.strength_max += strbonus*usr.strengthrebirthgain
						usr.strength += strbonus*usr.strengthrebirthgain
					var/str_gain = (3*usr.level*2+rand(5000,15000))
					usr.strength_max += str_gain*usr.strengthrebirthgain
					usr.strength += str_gain*usr.strengthrebirthgain
					if(prob(10))
						usr<<"\white You feel your Muscles bulge slightly..."
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					usr.training=0
	SuperAdvancedMachine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Super Advanced Machine"
		layer = MOB_LAYER + 5
		density = 1
		value=500000
		var
			punch = 0
		verb
			PunchIt()
				set category = "Training"
				set name="Hit the Machine"
				set src in oview(2)
				if(usr.defence_max >= usr.powerlevel_max *3)
					usr<<"Your defense is at the max!"
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.training||src.punch||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.punch = 1
					if(!usr)return
					usr.frozen = 1
					usr.hiting = 1
					usr.training=1
					usr.doing = 1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					sleep(22)
					spawn(5)src.punch = 0
					src.icon_state = "machine"
					if(!usr)return
					if(!src in get_step(usr,usr.dir))return
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					usr.exp += 15*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 15*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 5*usr.EXPrebirthgain
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					usr.Level_Up()
					usr.frozen = 0
					if(usr.statdef)
						var/strbonus=((usr.level*usr.statdef)/2)
						usr.defence_max += strbonus*usr.defenserebirthgain
						usr.defence += strbonus*usr.defenserebirthgain
					var/def_gain = (2*usr.level*2+rand(5000,10000))
					usr.defence_max += def_gain*usr.defenserebirthgain
					usr.defence += def_gain*usr.defenserebirthgain
					if(prob(10))
						usr<<"\white The machine counters your attack and your defence rises..."
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					spawn(1)if(usr)usr.training=0
	SuperAdvancedTreadmill
		icon = 'Gym.dmi'
		name="Super Treadmill"
		icon_state = "treadmill"
		value=550000
		var
			run = 0
		verb
			Run_on_Treadmill()
				set category = "Training"
				set src in oview(0)
				if(usr.stamina >= usr.stamina_max)
					usr<<"You are too tired."
					return
				if(usr.doing||usr.training||src.run||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					src.dir=EAST
					src.run = 1
					src.icon_state = "treadmill on"
					usr.doing = 1
					usr.hiting = 1
					usr.training=1
					usr.exp += 20*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 20*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 5*usr.staminarebirthgain
					usr.stamina_exp += rand(500,1000)*usr.staminarebirthgain
					usr.speed-=1
					usr.speed_max-=1
					if(usr.speed<1000)
						usr.speed=1000
					if(usr.speed_max<1000)
						usr.speed_max=1000
					usr.Level_Up()
					usr.Fatigue_Level_Up()
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
					usr.dir = EAST
					if(!usr)return
					usr.icon_state = "run"
					usr.frozen = 1
					sleep(35)
					src.icon_state = "treadmill"
					src.run = 0
					if(!usr)return
					usr.icon_state = ""
					usr.frozen = 0
					usr.doing = 0
					usr.hiting = 0
					usr.training=0
	SuperAdvancedTraining_Dummy
		icon = 'Gym.dmi'
		icon_state = "dummy"
		name="Super Advanced Dummy"
		density = 1
		value=250000
		var
			hit = 0
		verb
			Hit_the_Dummy()
				set category = "Training"
				set src in oview(2)
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.hiting)return
				else
/*					usr.gymafk++
					if(usr.gymafk>=50)
						alert(usr,"AFK CHECK!")
						if(!usr)return
						usr.gymafk=0
						return*/
					usr.hiting = 1
					usr.unarmed_exp += 90
					usr.exp += 5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 5*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 1.7*usr.staminarebirthgain
					usr.UA_Level_Up()
					flick("attack",usr)
					spawn(1)usr.Level_Up()
					spawn(5)if(usr)usr.hiting=0
					if(usr.stamina >= usr.stamina_max)
						usr.stamina = usr.stamina_max
			Shoot_the_Dummy()
				set category = "Training"
				set src in oview(4)
				if(usr.ki <= 0)
					usr<<"Your ki is too low."
					return
				if(usr.stamina >= usr.stamina_max||usr.doing||usr.hiting)return
				else
					usr.hiting = 1
					usr.ki_exp += 90*usr.kirebirthgain
					usr.exp += 5*usr.EXPrebirthgain
					if(usr.expbuff)usr.exp += 5*usr.EXPrebirthgain
					if(!usr.staminabuff)usr.stamina += 3*usr.staminarebirthgain
					usr.ki -= rand(400,1000)+usr.level*20
					if(usr.ki<0)
						usr.ki=0
					usr.Ki_Level_Up()
					missile('Ki Blast.dmi',usr,src)
					spawn(1)usr.Level_Up()
					spawn(5)if(usr)usr.hiting=0
					if(usr.stamina>=usr.stamina_max)
						usr.stamina=usr.stamina_max
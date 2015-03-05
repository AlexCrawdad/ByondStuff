mob
	var/tmp
		blowing=0
		oldicon=""
		npc=0
	proc
		NPCZanzo()
			oview(8)<<"[src]: Zanzoken!"
			oldicon=icon
			icon=""
			var/random=rand(1,3)
			x+=random
			var/chance=rand(1,3)
			y+=chance
			var/random2=rand(1,3)
			x-=random2
			var/chance2=rand(1,3)
			y-=chance2
			sleep(2)
			if(!src)return
			icon=oldicon
		Wander()
			while(src)
				var/Found = FALSE
				for(var/mob/PC/P in oview(8))
					if(get_dist(src,P)>1)
						if(!src.thrown)
							step_towards(src,P)
							sleep(1)
							if(name=="{NPC}Zombie"&&horde_event)
								AttackHorde(P)
								goto start_here_for_horde
							if(src.name=="{NPC}Green Saibaman"&&!src.blowing)
								if(prob(2))
									src.blowing=1
									view(8)<<"\white [src]: \font Argh! AHHHH!!!!"
									sleep(15)
									view(8)<<"\white [src]: \font BLOW UP! HA!"
									for(var/mob/M in oview(8,src))
										var/damage = src.ki*2
										if(!M.dead&&!M.safe&&M.pk)
											var/chance1 = rand(1,100)
											var/chance2= rand(1,100)
											var/damage1=(damage*chance1*0.01)-(M.kidefense*chance2*0.01)/(((2+get_dist(usr,M))/2))
											if(damage1 < 0)damage1 = (damage1*0.0001)
											if(damage1 < 1)damage1 = 1
											if(M.damage_enabled)M << "<font color=red>You took [damage1] damage!"
											if(src.damage_enabled)src<<"<font color=red>You caused [damage1] to [M]!"
											M.powerlevel-=damage1
											M.DeathCheck(src)
									world<<"<font color=red>Battle Information:<font color=white> [src] has blew up!"
									del(src)
									break
					else
						if(get_dist(src,P)<=1)
							if(!src.thrown)src.Attack2(P)
							sleep(1)
							if(src.name=="{NPC}Green Saibaman"&&!src.blowing)
								if(prob(2))
									src.blowing=1
									view(8)<<"\white [src]: \font Argh! AHHHH!!!!"
									sleep(15)
									view(8)<<"\white [src]: \font BLOW UP! HA!"
									for(var/mob/M in oview(8,src))
										var/damage = src.ki*2
										if(!M.dead&&!M.safe&&M.pk)
											var/chance1 = rand(1,100)
											var/chance2= rand(1,100)
											var/damage1=(damage*chance1*0.01)-(M.kidefense*chance2*0.01)/(((2+get_dist(usr,M))/2))
											if(damage1 < 0)damage1 = (damage1*0.0001)
											if(damage1 < 1)damage1 = 1
											if(M.damage_enabled)M << "<font color=red>You took [damage1] damage!"
											if(src.damage_enabled)src<<"<font color=red>You caused [damage1] to [M]!"
											M.powerlevel-=damage1
											M.DeathCheck(src)
									world<<"<font color=red>Battle Information:<font color=white> [src] has blew up!"
									del(src)
									break
					Found = TRUE
					break
				if(Found != TRUE)sleep(15)
				for(var/mob/PC/P in oview(8,src))if(P in oview(8,src))
					if(src&&!thrown&&!KO&&!frozen&&!GMLocked&&!binded&&prob(15)&&get_dist(src,P)>1)NPCZanzo()
				start_here_for_horde
				sleep(15)
		WanderMed()
			while(src)
				var/Found = FALSE
				for(var/mob/PC/P in oview(8))
					if(get_dist(src,P)>1)
						if(!src.thrown)step_towards(src,P)
					else
						if(get_dist(src,P)<=1)
							if(!src.thrown)src.Attack2(P)
					Found = TRUE
					break
				if(Found != TRUE)sleep(15)
				for(var/mob/PC/P in oview(8,src))if(P in oview(8,src))
					if(src&&!thrown&&!KO&&!frozen&&!GMLocked&&!binded&&prob(15)&&get_dist(src,P)>1)NPCZanzo()
					if(name=="{NPC}Zombie"&&horde_event)
						AttackHorde(P)
						goto start_here_for_horde
				start_here_for_horde
				sleep(8)
		WanderHard()
			while(src)
				var/Found = FALSE
				for(var/mob/PC/P in oview(8))
					if(get_dist(src,P)>1)
						if(!src.thrown)step_towards(src,P)
						if(name=="{NPC}Zombie"&&horde_event)
							AttackHorde(P)
							goto start_here_for_horde
					else
						if(get_dist(src,P)<=1)
							if(!src.thrown)src.Attack2(P)
					Found = TRUE
					break
				if(Found != TRUE)sleep(15)
				for(var/mob/PC/P in oview(8,src))if(P in oview(8,src))
					if(src&&!thrown&&!KO&&!frozen&&!GMLocked&&!binded&&prob(15)&&get_dist(src,P)>1)NPCZanzo()
				start_here_for_horde
				sleep(3)
		WanderExtreme()
			while(src)
				var/Found = FALSE
				for(var/mob/PC/P in oview(8))
					if(get_dist(src,P)>1)
						if(!src.thrown)step_towards(src,P)
					else
						if(get_dist(src,P)<=1)
							if(!src.thrown)src.Attack2(P)
					Found = TRUE
					break
				if(Found != TRUE)sleep(15)
				for(var/mob/PC/P in oview(8,src))if(P in oview(8,src))
					if(src&&!thrown&&!KO&&!frozen&&!GMLocked&&!binded&&prob(15)&&get_dist(src,P)>1)NPCZanzo()
					if(name=="{NPC}Zombie"&&horde_event)
						if(get_dist(src,P)<=1)AttackHorde(P)
						goto start_here_for_horde
				start_here_for_horde
				sleep(1)
		Attack2(mob/M)
			if(M==owner)return
			var/attack_text = rand(1,2)
			var/text
			if(attack_text == 1)text = "\red [usr] Punches you!"
			if(attack_text == 2)text = "\red [usr] Kicks you!"
			if(src.KO||src.safe)return
			if(!M||M.buku||M==src||M.dead||src.cooldown||src.buku||src.attack_lock||M.safe)return
			src.attacking=1
			spawn(12)if(src)src.attacking=0
			if(src.SuperSonicCheck(M)==TRUE)src.SuperSonicStart(M)
			var/attackpower = src.strength+src.powerlevel*0.1
			var/defensepower=(M.defence+(M.powerlevel*0.1)+(1+M.unarmed_skill/1.5))
			var/chance1 = rand(1,100)
			var/chance2= rand(1,100)
			var/damage=(attackpower*chance1*0.01)-(defensepower*chance2*0.01)
			if(damage < 0)damage = ((attackpower*0.0001))*chance1
			if(damage < 1)damage = 1
			var/chance3 = rand(1,100)
			var/chance4= rand(1,100)
			var/cdamage=((attackpower*chance3*0.01)*2)-(defensepower*chance4*0.01)
			if(cdamage < 0)cdamage = ((attackpower*0.0001)*2)*chance3
			if(cdamage < 1)cdamage = (1*2)
			if(istype(M,/mob/PC))
				if(src.cooldown)return
				else
					if(prob(M.dodge/5))
						flick("IT",M)
						M.attacker = src.name
						usr.cooldown = 1
						spawn((usr.speed/1000) * 2)if(usr)usr.cooldown = 0
						return
					else
						if(prob(M.block/5))
							M.attacker = src.name
							M.powerlevel -= damage/4
							if(M.damage_enabled)M << "<font color=red>You took [damage] damage!"
							M.DeathCheck(src)
							usr.cooldown = 1
							spawn((usr.speed/1000) * 2)if(usr)usr.cooldown = 0
							return
						else
							if(prob(M.counter/5))
								usr.powerlevel -= ((damage) + (damage *0.30))
								if(M.damage_enabled)M << "<font color=red>You took [damage] damage!"
								usr.DeathCheck(M)
								usr.cooldown = 1
								spawn((usr.speed/1000) * 2)if(usr)usr.cooldown = 0
								return
							else
								if(prob(usr.critical))
									M << "[text]"
									M.attacker = src.name
									M.powerlevel-=cdamage
									if(M.damage_enabled)M << "<font color=red>[usr] hit a critical and you took [cdamage] damage!"
									M.DeathCheck(src)
									usr.cooldown = 1
									spawn((usr.speed/1000) * 2)if(usr)usr.cooldown = 0
									return
								else
									M << "[text]"
									M.attacker = src.name
									M.powerlevel -= damage
									if(M.damage_enabled)M << "<font color=red>You took [damage] damage!"
									M.DeathCheck(src)
									usr.cooldown = 1
									spawn((usr.speed/1000) * 2)if(usr)usr.cooldown = 0
									return


		AttackHorde(mob/M)
			if(M==owner)return
			if(get_dist(src,M)>1)return
			var/attack_text=rand(1,2)
			var/text
			if(attack_text==1)
				M<<sound('weakpunch.wav')
				text="\red [usr] Punches you!</font>"
			if(attack_text==2)
				M<<sound('weakkick.wav')
				text="\red [usr] Kicks you!</font>"
			M.DAMAGEEFFECT()
			M<<text
			M.loc=locate(2,400,6)
			return
mob
	NPC
		New()
			density=1
			pk=0
			safe=1
			..()
	Monster
		New()
			..()
			density=1
			pk=1
			safe=0
			src.AddName()
			if(istype(src,/mob/Monster/Split_Form)==FALSE||istype(src,/mob/Monster/Cell_Jr)==FALSE)spawn(10)src.Wander()
		Cell
			name="{NPC}Cell"
			icon='NPCs.dmi'
			icon_state="cell"
			level=600
			powerlevel=40000000
			powerlevel_max=40000000
			ki=200000000
			ki_max=200000000
			strength=65000000
			strength_max=65000000
			defence=67000000
			defence_max=67000000
			speed=2700
			zenni=25000
			exp=44000
			npc=1
			karma = "Evil"
			race = "Bio-Android"
			Del()
				if(prob(2))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		YoungVampire
			name="{NPC}Young Vampire"
			icon='NPCs.dmi'
			icon_state="cell"
			level=600
			powerlevel=3000000000
			powerlevel_max=3000000000
			ki=3000000000
			ki_max=3000000000
			strength=3000000000
			strength_max=3000000000
			defence=3000000000
			defence_max=3000000000
			speed=2700
			zenni=25000
			exp=44000
			npc=1
			karma = "Evil"
			race = "Vampire"
			Del()
				if(prob(2))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		VampireWorker
			name="{NPC}Vampire Knight"
			icon='NPCs.dmi'
			icon_state="cell"
			level=600
			powerlevel=(3000000000*2*2)
			powerlevel_max=(3000000000*2*2)
			ki=(3000000000*2*2)
			ki_max=(3000000000*2*2)
			strength=(3000000000*2*2)
			strength_max=(3000000000*2*2)
			defence=(3000000000*2*2)
			defence_max=(3000000000*2*2)
			speed=2700
			zenni=25000
			exp=44000
			npc=1
			karma = "Evil"
			race = "Vampire"
			Del()
				if(prob(2))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		VampireLord
			name="{NPC}Vampire Lord"
			icon='NPCs.dmi'
			icon_state="cell"
			level=600
			powerlevel=(3000000000*2*2*2*2)
			powerlevel_max=(3000000000*2*2*2*2)
			ki=(3000000000*2*2*2*2)
			ki_max=(3000000000*2*2*2*2)
			strength=(3000000000*2*2*2*2)
			strength_max=(3000000000*2*2*2*2)
			defence=(3000000000*2*2*2*2)
			defence_max=(3000000000*2*2*2*2)
			speed=2700
			zenni=25000
			exp=44000
			npc=1
			karma = "Evil"
			race = "Vampire"
			Del()
				if(prob(2))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		Green_Saiba_Man
			name = "{NPC}Green Saibaman"
			icon = 'Green Saibaman.dmi'
			powerlevel = 15000
			powerlevel_max = 15000
			ki = 16000
			ki_max = 16000
			speed = 50000
			strength = 14500
			defence = 14500
			karma = "Evil"
			race = "Saibaman"
			level = 25
			zenni = 50
			exp = 1000
			critical=1
			npc=1
			Del()
				if(prob(2))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		Goon_1
			name = "{NPC}Henchman 1"
			icon = 'Henchman 1.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 45000
			powerlevel_max = 45000
			ki = 0
			ki_max = 0
			speed = 5000
			strength = 14500
			defence = 14500
			critical = 8
			karma = "Evil"
			race = "Henchman"
			level = 35
			KO = 0
			zenni = 150
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 3000
			critical=3
			npc=1
			Del()
				if(prob(2))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		Goon_2
			name = "{NPC}Henchman 2"
			icon = 'Henchman 2.dmi'
			density = 1
			powerlevel = 55000
			powerlevel_max = 55000
			speed = 5000
			strength = 18500
			defence = 18500
			critical = 12
			karma = "Evil"
			race = "Henchman"
			level = 50
			zenni = 500
			pk = 1
			exp = 3000
			critical=3
			npc=1
			Del()
				if(prob(2))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		Goon_3
			name = "{NPC}Henchman 3"
			icon = 'Henchman 3.dmi'
			density = 1
			powerlevel = 47000
			powerlevel_max = 47000
			speed = 5000
			strength = 12500
			defence = 12500
			critical = 3
			karma = "Evil"
			race = "Henchman"
			level = 25
			zenni = 500
			pk = 1
			exp = 3000
			critical=3
			npc=1
			Del()
				if(prob(2))
					var/ran2 = rand(1,41)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		TuffleVillager
			name = "{NPC}Tuffle"
			icon = 'Bebi - Form 1.dmi'
			density = 1
			powerlevel = 450000
			powerlevel_max = 450000
			speed = 4500
			strength = 270000
			defence = 265000
			critical = 6
			karma = "Evil"
			race = "Tuffle"
			level = 150
			zenni = 1000
			pk = 1
			exp = 21000
			critical=100
			npc=1
			Del()
				if(prob(2))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()


		Bat
			name = "{NPC}Bat"
			icon = 'NPCs3.dmi'
			icon_state = "Bat"
			powerlevel = 2000
			powerlevel_max = 2000
			ki = 1000
			kidefense = 2000
			speed = 50000
			strength = 2000
			defence = 2000
			karma = "Good"
			race = "Bat"
			level = 30
			zenni = 200
			exp = 400
			tp = 9
			critical=2
			npc=1
			Del()
				if(prob(2))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		Dragon
			name = "{NPC}Dragon"
			icon = 'NPCs3.dmi'
			icon_state = "Dragon"
			density = 1
			powerlevel = 1000000
			ki = 1180000
			kidefense = 11800000
			speed = 4500
			strength = 1500000
			defence = 1500000
			kidefense = 1800000
			critical = 80
			karma = "Evil"
			race = "Dragon"
			level = 600
			zenni = 800
			tp = 50
			pk = 1
			exp = 25000
			npc=1
			Del()
				if(prob(2))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		Ozzaru
			name = "{NPC}Oozaru"
			icon = 'Oozaru.dmi'
			density = 1
			powerlevel = 200000
			powerlevel_max = 200000
			ki = 1800
			ki_max = 1800
			speed = 3500
			strength = 2500
			defence = 2500
			critical = 100
			karma = "Evil"
			race = "Saiyan"
			level = 10000
			zenni = 30000
			pk = 1
			exp = 50000
			npc=1
			New()
				..()
				src.overlays+=new/obj/techs/Overlays/Oozaru_top
		Raditz
			name = "{NPC}Raditz"
			icon='Sims.dmi'
			icon_state = "raditz"
			density = 1
			powerlevel = 45000000
			powerlevel_max = 45000000
			speed = 45000
			strength = 27000000
			defence = 26500000
			critical = 60
			karma = "Evil"
			race = "Saiyan"
			level = 15000
			zenni = 10000
			pk = 1
			exp = 10000
			npc=1
			Del()
				if(prob(10))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		PlanetZGaurd
			name = "{NPC}Planet Z Gaurd"
			icon = 'Human_Saitan.dmi'
			density = 1
			powerlevel = 2150000000*2*2
			ki = 2150000000*2*2
			kidefense = 2150000000*2*2
			speed = 4500
			strength = 2150000000*2*2
			defence = 2150000000*2*2
			kidefense = 2150000000*2*2
			critical = 90
			karma = "Evil"
			race = "Zii'in"
			level = 100000
			zenni = 50000
			tp = 78
			pk = 1
			exp = 75000
			npc=1
			Del()
				if(prob(10))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()
		PlanetZRebel
			name = "{NPC}Rebel"
			icon = 'Male android3.dmi'
			density = 1
			powerlevel = (21500000000*2*2)
			ki = (2150000000*2*2)
			kidefense = (2150000000*2*2)
			speed = 4500
			strength = (2150000000*2*2)
			defence = (2150000000*2*2)
			kidefense = (2150000000*2*2)
			critical = 90
			karma = "Good"
			race = "Zii'in"
			level = 500000
			zenni = 50000
			tp = 78
			pk = 1
			exp = 75000
			npc=1
			Del()
				if(prob(10))
					var/ran2 = rand(1,4)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/Ki_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/STR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/DEF_Shard
						O.loc = src.loc
				else
					var/obj/O = new/obj/Equipment/Zenni_Drop
					O.loc = src.loc
					var/obj/Z = new/obj/Equipment/TP_Drop
					Z.loc = src.loc
				..()


	NPC
		Dead_Namek
			name = "{NPC}Dead Namek"
			icon = 'NPCs2.dmi'
			icon_state = "Dying Namek"
			density = 0
			dead = 1
			safe = 1
	NPC
		Dead_Henchman
			name = "{NPC}Dead Henchman"
			icon = 'NPCs2.dmi'
			icon_state = "Dying Hench"
			density = 0
			dead = 1
			safe = 1
	NPC
		Bodyguard
			name = "{NPC}Frieza's Bodyguard"
			icon = 'NPCs2.dmi'
			icon_state = "Henchman"
			density = 1
			dead = 1
			safe = 1



mob
	Monster
		Simulator_NPC
			name = "{NPC}Simulation Fighter"
			density = 1
			dead = 0
			safe = 0
			powerlevel = 750
			powerlevel_max = 750
			ki = 0
			ki_max = 0
			speed = 5000
			strength = 50
			defence = 15
			critical = 2
			race = "AI"
			level = 15
			KO = 0
			zenni = 20
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 1
			tnl = 1
			New()
				..()
			Bump(mob/M)
				if(istype(M,/mob/PC))src.Attack2(M)
		Clone_Simulator_NPC
			name = "{NPC}Clone Simulation Fighter"
			powerlevel = 1250
			powerlevel_max = 1250
			speed = 5000
			strength = 100
			defence = 75
			critical = 22
			race = "AI"
			level = 15
			zenni = 1
			pk = 1
			exp = 0
			tnl = 0
			New()
				..()
			Bump(mob/M)
				if(istype(M,/mob/PC))src.Attack3(M)
			proc/Attack3(mob/M)
				var/attack_text = rand(1,3)
				var/text = ""
				if(attack_text)text = "\red [usr] Punches you in the Face!"
				if(attack_text == 2)text = "\red [usr] Kicks you in the Chest!"
				if(attack_text == 3)text = "\red [usr] Punches you in the Stomach!"
				if(!M)return
				if(M == src)return
				if(M.safe)return
				if(M.dead && M.race != "Majin")return
				var/attack_power = round(src.strength + (src.powerlevel / 100))
				var/defence_power = M.defence
				var/chance1 = rand(1,100)
				var/chance2= rand(1,100)
				var/damage=((attack_power*chance1*0.01)-(defence_power*chance2*0.01))
				if(damage < 0)damage = (((attack_power*0.0001))*chance1)
				if(damage < 1)damage = 1
				if(M.type == /mob/PC)
					if(M.form_1 || M.form_2 || M.form_3 || M.form_4 || M.form_5)
						if(src.race == "Saiyan" && M.form_1)src.PSaiyanTrans()
						if(src.race == "Half Saiyan" && M.form_1)src.HalfSaiyanTrans()
						if(src.race == "Changeling" && M.form_1)src.ChanglingTrans()
						if(src.race == "Human" && M.form_1)src.HumanTrans()
						if(src.race == "Tuffle" && M.form_2)src.TuffleTrans()
						if(src.race == "Bio-Android" && M.form_3)src.BioTrans()
					if(src.cooldown)return
					else
						if(prob(M.dodge))
							flick("IT",M)
							M.attacker = src.name
							usr.cooldown = 1
							spawn((usr.speed/1000) * 2)if(usr)usr.cooldown = 0
							return
						else
							if(prob(M.block))
								M.attacker = src.name
								M.powerlevel -= damage / 4
								M.DeathCheck(src)
								usr.cooldown = 1
								spawn((usr.speed/1000) * 2)if(usr)usr.cooldown = 0
								return
							else
								if(prob(M.counter))
									usr.powerlevel -= ((damage) + (damage *0.30))
									usr.DeathCheck(M)
									usr.cooldown = 1
									spawn((usr.speed/1000) * 2)if(usr)usr.cooldown = 0
									return
								else
									if(prob(usr.critical))
										M << "[text]"
										M.attacker = src.name
										M.powerlevel -= (damage * 2)
										M.DeathCheck(src)
										usr.cooldown = 1
										spawn((usr.speed/1000) * 2)if(usr)usr.cooldown = 0
										return
									else
										M << "[text]"
										M.attacker = src.name
										M.powerlevel -= damage
										M.DeathCheck(src)
										usr.cooldown = 1
										spawn((usr.speed/1000) * 2)if(usr)usr.cooldown = 0
										return

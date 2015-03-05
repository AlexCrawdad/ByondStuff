mob
	var
		combofighting=0
		combolimit=2
		combospeed=20000
		sonicspeed=0
		tmp
			combocount=0
			lastkick="1"
			lastpunch="1"
			lastpk=""
			incombo=0
			thrown=0
			throwing=0
			attacking=0
			attacker=""
			spar=0





	proc
		RemoveArmor(var/mob/M,var/D)
			if(prob(armorblock))
				src<<"\blue Your armor absorbs some of [M]'s attack!"
				M<<"\blue [src]'s armor absorbs some of your attack!"
				powerlevel-=D
				for(var/obj/Equipment/Armor/A in src)
					A.condition-=D
					if(A.condition<=0)
						src<<"\blue Your armor has been destroyed!"
						overlays-=A
						armor_eq=0
						armor=0
						armorblock=0
						del(A)
		Thrown(var/mob/T)
			if(!src)return
			if(!T)return
			var/fail=70
			if(unarmed_skill>3000)fail=60
			if(unarmed_skill>5000)fail=50
			if(unarmed_skill>7000)fail=40
			if(unarmed_skill>9000)fail=30
			if(unarmed_skill>10000)fail=20
			if(unarmed_skill>12000)fail=10
			if(unarmed_skill>14000)fail=5
			if(prob(fail))
				T<<"\blue You failed to throw [src]!"
				return
			var/atk=T.strength+T.powerlevel*0.05+unarmed_skill
			var/def=defence+powerlevel*0.05+ki*0.05+unarmed_skill*0.8
			if(atk<def)
				T<<"\blue [src] overpowers your throw!"
				return
			T<<"\blue You threw [src]!"
			src<<"\blue [T] threw you!"
			var/D=1
			if(atk>def*2)D=2
			if(atk>def*3)D=3
			if(atk>def*4)D=4
			if(atk>def*5)D=5
			if(atk>def*6)D=6
			if(atk>def*7)D=7
			if(atk>def*8)D=8
			if(atk>def*9)D=9
			if(atk>def*10)D=10
			if(istype(src,/mob/PC))
				icon_state="thrown"
				spawn(30)if(src)icon_state=""
			thrown=1
			density=0
			boxing=0
			dualtrain=0
			rest=0
			meditation=0
			var/DT=T.dir
			var/PT=atk-def
			while(D)
				D-=1
				for(var/atom/A in get_step(src,DT))
					if(istype(A,/obj/Buildings/Door1))
						var/obj/Buildings/Door1/DO=A
						DO.OpenDoor()
					if(istype(A,/obj/Buildings/Door2))
						var/obj/Buildings/Door2/DO=A
						DO.OpenDoor()
					if(A.density)
						powerlevel-=PT*(D/10)
						spawn(0)KO()
						if(istype(A,/mob))
							var/mob/M=A
							if(M.pk&&!M.safe)
								M.powerlevel-=PT*(D/10)
								if(M.damage_enabled)M<<"<font color=red>You took [PT*(D/10)] damage!"
								if(damage_enabled)src<<"<font color=red>You caused [PT*(D/10)] to [M]!"
								M.DAMAGEEFFECT()
								spawn(0)M.KO()
						if(istype(A,/obj/Buildings))
							var/obj/O=A
							O.hp-=PT*(D/10)
							spawn(0)O.DestroyIt()
					sleep(0)
					if(A.density)
						thrown=0
						density=1
						if(istype(src,/mob/PC))icon_state=""
						boxing=0
						dualtrain=0
						D=0
						spawn(1)if(src)
							for(var/turf/Floors/Safe_Zone/S in oview(8,src))
								if(S in oview(1,src))
									if(!szactivated&&!dead&&z!=7&&z!=6&&z!=5)
										insafezone=1
										szactivated=1
										safe=1
										traintimer=0
										temptraintimer=0
										timer()
						break
				step(src,DT)
				if(D<=0)
					switch(DT)
						if(NORTH)dir=SOUTH
						if(SOUTH)dir=NORTH
						if(EAST)dir=WEST
						if(WEST)dir=EAST
						if(NORTHEAST)dir=SOUTHWEST
						if(NORTHWEST)dir=SOUTHEAST
						if(SOUTHEAST)dir=NORTHWEST
						if(SOUTHWEST)dir=NORTHEAST
					thrown=0
					density=1
					if(istype(src,/mob/PC))icon_state=""
					boxing=0
					dualtrain=0
					spawn(1)if(src)
						for(var/turf/Floors/Safe_Zone/S in oview(8,src))
							if(S in oview(1,src))
								if(!szactivated&&!dead&&z!=7&&z!=6&&z!=5)
									insafezone=1
									szactivated=1
									safe=1
									traintimer=0
									temptraintimer=0
									timer()
					break
				sleep(1)
	PC
		verb
			Throw()
				set category = "Combat"
				if(!pk)
					usr<<"You are not a combatant!"
					return
				if(FuseFollower||doing||throwing||cooldown||KO||attack_lock||!usr)return
				if(dead)
					usr<<"You are dead."
					return
				spawn(5+(speed/1000))if(usr)throwing=0
				for(var/mob/M in get_step(usr,dir))
					if(!M)return
					if(!M in get_step(usr,dir))return
					if(M.FuseFollower)continue

					if(M.safe)
						usr<<"[M] is safe and cannot be attacked."
						return
					if(M.dead)
						usr<<"[M] is dead."
						return
					if(!M.pk)
						usr<<"[M] is not a combatant!"
						return
					return M.Thrown(usr)
			Punch()
				set category = "Combat"
				set name = "Attack"
				for(var/mob/M in get_step(usr,dir))if(M.name=="{NPC}Zombie"&&horde_event)
					var/exp_gainer=tnl*0.25
					exp+=exp_gainer
					spawn(1)if(usr)Level_Up()
					del(M)
					return
				if(!pk)
					usr<<"You are not a combatant!"
					return
				if(KO||doing||safe||FuseFollower||cooldown||attack_lock||!usr)return
				if(dead)
					usr<<"You are dead."
					return
				cooldown=1
				spawn((speed/1000)+2)cooldown=0
				flick("attack",usr)
				for(var/mob/M in get_step(usr,dir))
					if(!M)return
					if(!M in get_step(usr,dir))return
					if(M.FuseFollower)continue
					if(M.safe)
						usr<<"[M] is safe and cannot be attacked."
						return
					if(M.dead)
						usr<<"[M] is dead."
						return
					if(M.KO)
						usr<<"[M] is already K.O!"
						return
					if(!M.pk)
						usr<<"[M] is not a combatant!"
						return
					var/attackpower=(strength+((powerlevel+(unarmed_skill*10))*0.1))+(unarmed_skill/1.5)
					var/defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
					var/chance1 = rand(1,100)
					var/chance2= rand(1,100)
					var/damage=(attackpower*chance1*0.01)-(defensepower*chance2*0.01)
					if(damage < 0)damage = (attackpower*0.0001)*chance1
					if(damage < 1)damage = 1
					if(spar)
						attackpower=(strength/500+((powerlevel/500+(unarmed_skill*10))*0.1))+(unarmed_skill/1.5)
						defensepower=(M.defence+((M.powerlevel+(M.unarmed_skill*10))*0.1))+(M.unarmed_skill/1.5)
						damage=attackpower-defensepower
					if(damage<=0)damage=rand(300,1500)
					attacking=1
					spawn(12)if(usr)attacking=0
					if(SuperSonicCheck(M)==TRUE)SuperSonicStart(M)
					if(attacker==M&&M.spar)exp+=7
					if(!M||M==null)return
					M.attacker=usr
					spawn(20)if(M)M.attacker=""
					if(M.armorblock)
						if(prob(M.armorblock))
							if(M.Counter_Attack(usr,M.strength,defence)==TRUE)return
							else if(M.Block_Attack(usr,strength,M.defence)==TRUE)return
							M.RemoveArmor(usr,damage/5)
							M.KO()
					if(prob(1+(critical/5)))
						var/chance=rand(1,2)
						if(chance==1)
							new/obj/techs/Overlays/Crater_Center(M.loc)
							M<<"\red [usr] punches you with a critical!"
							usr<<"\red You punch [M] with a critical!"
							view() << sound('clash.wav')
						if(chance==2)
							new/obj/techs/Overlays/Crater_Center(M.loc)
							M<<"\red [usr] kicks you with a critical!"
							usr<<"\red You kick [M] with a critical!"
							view() << sound('clash.wav')
						M.powerlevel-=round(damage * 2)
						M.overlays += Pretty_Effect
						spawn(5) M.overlays -= Pretty_Effect
						if(M.damage_enabled)M<<"<font color=red>You took [damage * 2] damage!"
						if(usr.damage_enabled)usr<<"<font color=red>You caused [damage * 2] to [M]!"
						view() << sound('punch_med.wav')
						spawn(5) M.overlays -= Pretty_Effect
						M.DAMAGEEFFECT()
						usr.overlays += Pretty_Effect
						spawn(5) usr.overlays -= Pretty_Effect
						M.KO()
						if(!M)return
						spawn(0)M.Thrown(usr)
					else
						if(M.Counter_Attack(usr,M.strength,defence)==TRUE)return
						else if(M.Block_Attack(usr,strength,M.defence)==TRUE)return
						var/chance=rand(1,2)
						if(chance==1)
							M<<"\red [usr] punches you!"
							usr<<"\red You punch [M]!"
						if(chance==2)
							M<<"\red [usr] kicks you!"
							usr<<"\red You kick [M]!"
						if(M.damage_enabled)M<<"<font color=red>You took [damage] damage!"
						if(usr.damage_enabled)usr<<"<font color=red>You caused [damage] to [M]!"
						view() << sound('punch_med.wav')
						M.DAMAGEEFFECT()
						spawn(5) M.overlays -= Pretty_Effect
						usr.overlays += Pretty_Effect
						spawn(5) usr.overlays -= Pretty_Effect
						M.powerlevel-=round(damage)
						M.KO()



			Spar()
				set category = "Combat"
				if(spam_delay)return
				spam_delay=1
				if(spar)
					spar=0
					view(8)<<"\white [usr] is no longer in a sparring stance."
					spawn(25)if(usr)spam_delay=0
				else
					spar=1
					view(8)<<"\white [usr] is now in a sparring stance."
					spawn(25)if(usr)spam_delay=0
	proc
		SuperSonicCheck(mob/M)
			if(attacking&&M.attacking)
				if(dir==NORTH&&M.dir==SOUTH)return TRUE
				if(dir==SOUTH&&M.dir==NORTH)return TRUE
				if(dir==EAST&&M.dir==WEST)return TRUE
				if(dir==WEST&&M.dir==EAST)return TRUE
				if(dir==NORTHEAST&&M.dir==SOUTHWEST)return TRUE
				if(dir==SOUTHWEST&&M.dir==NORTHEAST)return TRUE
				if(dir==NORTHWEST&&M.dir==SOUTHEAST)return TRUE
				if(dir==SOUTHEAST&&M.dir==NORTHWEST)return TRUE
			else return FALSE
		SuperSonicStart(mob/M,Times=2)
			while(M&&src)
				if(!attacking||!M.attacking)return
				if(!src||!M||M.KO||KO)return
				var/turf/L1=loc
				var/turf/L2=M.loc
				doing=1
				M.doing=1
				frozen=0
				M.frozen=0
				var/t=Times
				Repeat
				if(t)
					t-=1
					sleep(2)
					if(prob(50))
						spawn(1)
							flick("attack",src)
							flick("attack2",M)
							flick("attack2",src)
							flick("attack",M)
						if(x+5&&M.x+5<world.maxx)
							loc=locate(x+4,y,z)
							M.loc=locate(M.x+4,M.y,M.z)
						else
							if(y+5&&M.y+5<world.maxy)
								loc=locate(x,y+4,z)
								M.loc=locate(M.x,M.y+4,M.z)
					else
						spawn(1)
							flick("attack",src)
							flick("attack2",M)
							flick("attack2",src)
							flick("attack",M)
						if(y+5&&M.y+5<world.maxy)
							loc=locate(x,y+4,z)
							M.loc=locate(M.x,M.y+4,M.z)
						else
							if(x+5&&M.x+5<world.maxx)
								loc=locate(x+4,y,z)
								M.loc=locate(M.x+4,M.y,M.z)
					sleep(4)
					if(!src||!M)return
					loc=L1
					M.loc=L2
					sleep(4)
					if(prob(50))
						spawn(1)
							flick("attack",src)
							flick("attack2",M)
							flick("attack2",src)
							flick("attack",M)
						if(!src||!M)return
						if(x+5&&M.x+5<world.maxx)
							loc=locate(x+4,y,z)
							M.loc=locate(M.x+4,M.y,M.z)
						else
							if(y+5&&M.y+5<world.maxy)
								loc=locate(x,y+4,z)
								M.loc=locate(M.x,M.y+4,M.z)
					else
						spawn(1)
							flick("attack",src)
							flick("attack2",M)
							flick("attack2",src)
							flick("attack",M)
						if(!src||!M)return
						if(y+5&&M.y+5<world.maxy)
							loc=locate(x,y+4,z)
							M.loc=locate(M.x,M.y+4,M.z)
						else
							if(x+5&&M.x+5<world.maxx)
								loc=locate(x+4,y,z)
								M.loc=locate(M.x+4,M.y,M.z)
					sleep(2)
					if(!src)return
					loc=L1
					if(!M)return
					M.loc=L2
					doing=0
					M.doing=0
					frozen=0
					M.frozen=0
					if(!attacking||!M.attacking)return
					if(!src||!M||M.KO||KO)return
					if(t)goto Repeat
					else
						doing=0
						M.doing=0
						frozen=0
						M.frozen=0
				else
					doing=0
					M.doing=0
					frozen=0
					M.frozen=0
mob/PC/verb/Finish(mob/M in get_step(usr,dir))
	set category = "Combat"
	if(!M)return
	if(dead)
		usr<<"You are dead."
		return
	if(M.FuseFollower||FuseFollower)return
	if(M.safe||safe||!M.pk||!pk)
		usr<<"[M] can't be attacked right now."
		return
	if(finish_delay)return
	if(M.KO)
		finish_delay=1
		spawn(15)if(usr)finish_delay=0
		if(customfinish)view(6)<<"<font color=red>[usr] [customfinishtxt] [M]!"
		else view(6)<<"<font color=red>[usr] roars DIE! at top of their lungs before finishing their foe off!"
		M.DeathCheck(usr)
		spawn(1)Level_Up()
	else
		finish_delay=1
		spawn(15)if(usr)finish_delay=0
		usr<<"[M] is not KO yet!"
		return


mob/var/Pretty_Effect = 'AttackPretty.dmi'
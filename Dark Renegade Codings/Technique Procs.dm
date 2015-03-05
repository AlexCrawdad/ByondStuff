obj
	var
		tmp
			passed=0
			controldisabled=0
	proc
		TechAttackHoming(mob/O,Z,Power,I,IS,Effect)
			src.owner=O
			src.power=Power
			if(I!=0)src.icon=I
			if(IS!=0)src.icon_state=IS
			src.range=0
			src.name=Z
			O.ki-=O.ki*O.kiuse
			src.dir=O.dir
			src.loc=O.loc
			src.controldisabled=1
			while(src)
				if(!O)
					del(src)
					break
				src.range+=1
				src.target=O.target
				var/Found=FALSE
				var/hastarget=0
				for(var/mob/ST in view(8,src))
					if(istype(ST,/mob/NPC))continue
					if(ST.FuseFollower)continue
					if(ST==src.target)if(ST.pk&&ST!=O)hastarget=1
				for(var/mob/M in view(8,src))
					if(M == src)return
					if(istype(M,/mob/NPC))continue
					if(M.FuseFollower)continue
					if(hastarget)
						step_towards(src,src.target)
						Found=TRUE
					else
						if(M==O)return
						if(M.pk)
							if(O.in_guild&&!O.attackguild&&M.guild==O.guild)Found=FALSE
							else
								if(O.in_party&&!O.attackparty&&M.party_name==O.party_name)Found=FALSE
								else
									step_towards(src,M)
									Found=TRUE
					break
				if(Found!=TRUE)step(src,src.dir)
				var/turf/T=src.loc
				if(!T)return
				if(!T.density&&src.power>=50000000)
					if(istype(src,/turf/Earth/Island_Edge_005))
						T.overlays+='Dirt.dmi'
						T.RemoveDirt(100)
				for(var/mob/M in T)
					if(M == src)return
					if(M.FuseFollower)continue
					if(M!=O||M==O&&src.range>=10)
						spawn(1)src.TrailDelete()
						if((M.pk&&!M.safe&&!M.FuseFollower&&!M.dead))
							if(M.kiabsorb)
								var/absorbpower=M.kidefense*0.5+M.ki*0.15
								var/absorbdamage=src.power-absorbpower
								if(absorbpower>=src.power)
									M.ki+=src.power
									if(M.ki>M.ki_max*2)
										M<<"Your body can't handle anymore ki!"
										M.powerlevel=0
										M.DeathCheck(O)
								else
									M.powerlevel-=absorbdamage
									M << "<font color=red>[O]'s [src] hits you!"
									O << "<font color=red>Your [src] hits [M]!"
									Explode(new /Effect/BasicBoom(M.loc,1,3))
									if(M.damage_enabled)M << "<font color=red>You took [absorbdamage] damage!"
									if(O.damage_enabled)O << "<font color=red>You caused [absorbdamage] to [M]!"
									if(O.kill)M.DeathCheck(O)
									else spawn(0)M.KO()
							else
								if(M.Dodge_Attack(src.owner)==TRUE)
									flick("IT",M)
									switch(src.dir)
										if(WEST)
											if(prob(50))M.loc=locate(M.x,M.y+2,M.z)
											else M.loc=locate(M.x,M.y-2,M.z)
										if(EAST)
											if(prob(50))M.loc=locate(M.x,M.y+2,M.z)
											else M.loc=locate(M.x,M.y-2,M.z)
										if(NORTH)
											if(prob(50))M.loc=locate(M.x+2,M.y,M.z)
											else M.loc=locate(M.x-2,M.y,M.z)
										if(SOUTH)
											if(prob(50))M.loc=locate(M.x+2,M.y,M.z)
											else M.loc=locate(M.x-2,M.y,M.z)
										if(NORTHWEST)
											if(prob(50))M.loc=locate(M.x,M.y+2,M.z)
											else M.loc=locate(M.x,M.y-2,M.z)
										if(NORTHEAST)
											if(prob(50))M.loc=locate(M.x,M.y+2,M.z)
											else M.loc=locate(M.x,M.y-2,M.z)
										if(SOUTHEAST)
											if(prob(50))M.loc=locate(M.x+2,M.y,M.z)
											else M.loc=locate(M.x-2,M.y,M.z)
										if(SOUTHWEST)
											if(prob(50))M.loc=locate(M.x+2,M.y,M.z)
											else M.loc=locate(M.x-2,M.y,M.z)
								else
									var/chance1 = rand(1,100)
									var/chance2= rand(1,100)
									var/damage=(src.power*chance1*0.01)-(M.kidefense*chance2*0.01)
									if(damage < 0)damage = ((power*0.0001))*chance1
									if(damage < 1)damage = 1
									if(Effect=="Critical")
										if(prob(40))damage=(src.power*rand(2,3))-(M.kidefense*chance2)
										if(damage < 0) damage = ((power*0.00001)*rand(2,3))*chance1
										if(damage < 1) damage = 1
									if(Z=="Kienzan Disk")
										if(prob(5))
											M.has_tail=0
											M.overlays-='Tail.dmi'
											M.tail_grow_delay=30
											M.Tail_Grow()
									M.powerlevel-=damage
									M << "<font color=red>[src.owner]'s [src] hits you!"
									src.owner << "<font color=red>Your [src] hits [M]!"
									Explode(new /Effect/BasicBoom(M.loc,1,3))
									if(O.kill)M.DeathCheck(src.owner)
									else spawn(0)M.KO()
							if(src.power>=20000000)
								var/obj/techs/Overlays/Crater_Center/C=new
								C.loc=src.loc
							else
								if(src.power>=8000000)
									var/obj/techs/Overlays/Crater_Small/C=new
									C.loc=src.loc
							var/drange=1
							if(src.power>=10000000)drange=2
							if(src.power>=20000000)drange=3
							if(src.power>=30000000)drange=4
							if(src.power>=40000000)drange=5
							if(src.power>=50000000)drange=6
							if(src.power>=60000000)drange=7
							if(src.power>=70000000)drange=8
							for(var/obj/Buildings/DE in oview(drange,src))
								DE.hp-=src.power/(1+get_dist(src,DE))
								spawn(0)DE.DestroyIt()
							src.ExplodeDamage(0,drange,src.power)
							if(src.power<=0)
								src.TrailDelete()
								break
						else
							src.TrailDelete()
							break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=src.owner
					if(!DEO.see_invisible)
						if(istype(DE,/obj/Buildings)&&DE.invisibility)continue
					DE.hp-=src.power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
						if(src.power>=10000000)drange=2
						if(src.power>=20000000)drange=3
						if(src.power>=30000000)drange=4
						if(src.power>=40000000)drange=5
						if(src.power>=50000000)drange=6
						if(src.power>=60000000)drange=7
						if(src.power>=70000000)drange=8
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						DEO.frozen=0
						DEO.doing=0
						if(istype(DEO,/mob/PC))DEO.icon_state=""
						src.TrailDelete()
						break
				if(src.power<=0)
					src.TrailDelete()
					break
				if(src.range>=20)
					if(src.power>=20000000)
						var/obj/techs/Overlays/Crater_Center/C=new
						C.loc=src.loc
					else
						if(src.power>=8000000)
							var/obj/techs/Overlays/Crater_Small/C=new
							C.loc=src.loc
					var/drange=1
					if(src.power>=10000000)drange=2
					if(src.power>=20000000)drange=3
					if(src.power>=30000000)drange=4
					if(src.power>=40000000)drange=5
					if(src.power>=50000000)drange=6
					if(src.power>=60000000)drange=7
					if(src.power>=70000000)drange=8
					for(var/obj/Buildings/DE in oview(drange,src))
						DE.hp-=src.power/(1+get_dist(src,DE))
						spawn(0)DE.DestroyIt()
					src.ExplodeDamage(0,drange,src.power)
					src.TrailDelete()
					break
				sleep(1)
		TechAttackStraight(mob/O,Z,Power,I,IS,Effect)
			src.owner=O
			src.power=Power
			if(I!=0)src.icon=I
			if(IS!=0)src.icon_state=IS
			src.range=0
			src.name=Z
			src.controldisabled=1
			if(src.name==O.custom_name)O.ki-=O.ki*O.custom_ki
			if(src.name!=O.custom_name)O.ki-=O.ki*O.kiuse
			switch(O.dir)
				if(NORTHWEST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					src.dir = WEST
					src.loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					src.dir = EAST
					src.loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
			while(src)
				if(!src.owner||src.owner==null||!O)
					del(src)
					break
				src.range+=1
				var/turf/T=src.loc
				if(!T)return
				if(!T.density&&src.power>50000000)
					if(istype(T,/turf/Earth/Island_Edge_005))
						var/obj/techs/Overlays/CraterTrail/TTrail=new
						TTrail.dir=src.dir
						TTrail.loc=T
				for(var/mob/M in T)
					if(M == src)return
					if(M.FuseFollower)continue
					var/mob/OW=src.owner
					if(!OW)return
					OW.doing=0
					OW.frozen=0
					if((M.pk&&!M.safe&&!M.FuseFollower&&!M.dead&&passed<=1))
						passed++
						spawn(5)passed--
						var/chance1 = rand(1,100)
						var/chance2= rand(1,100)
						var/damage=(src.power*chance1*0.01)-(M.kidefense*chance2*0.01)
						if(damage < 0)damage = ((power*0.0001))*chance1
						if(damage < 1)damage = 1
						if(Effect=="Critical")
							if(prob(40))damage=(src.power*rand(2,3))-(M.kidefense*chance2)
							if(damage < 0) damage = ((power*0.00001)*rand(2,3))*chance1
							if(damage < 1) damage = 1


						if(Z=="Distructo Disk")
							if(prob(5))
								M.has_tail=0
								M.overlays-='Tail.dmi'
								M.tail_grow_delay=30
								M.Tail_Grow()
						var/apower=src.power
						src.power-=M.powerlevel
						M.powerlevel-=damage
						M << "<font color=red>You took [damage] damage!"
						OW << "<font color=red>You caused [damage] to [M]!"
						Explode(new /Effect/BasicBoom(M.loc,1,3))
						if(M.damage_enabled)M << "<font color=red>[OW]'s [src] hits you!"
						if(OW.damage_enabled)OW << "<font color=red>Your [src] hits [M]!"
						if(O.kill)M.DeathCheck(OW)
						else spawn(0)if(M)M.KO()
						if(apower>=20000000)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
						else
							if(src.power>=8000000)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=src.loc
						var/drange=1
						if(apower>=10000000)drange=2
						if(apower>=20000000)drange=3
						if(apower>=30000000)drange=4
						if(apower>=40000000)drange=5
						if(apower>=50000000)drange=6
						if(apower>=60000000)drange=7
						if(apower>=70000000)drange=8
						for(var/obj/Buildings/DE in oview(drange,src))
							DE.hp-=src.power/(1+get_dist(src,DE))
							spawn(0)DE.DestroyIt()
						src.ExplodeDamage(M,drange,apower)
						if(src.power<=0)
							src.TrailDelete()
							break
					else
						src.TrailDelete()
						break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=src.owner
					if(!DEO.see_invisible)
						if(istype(DE,/obj/Buildings)&&DE.invisibility)continue
					DE.hp-=src.power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
						if(src.power>=10000000)drange=2
						if(src.power>=20000000)drange=3
						if(src.power>=30000000)drange=4
						if(src.power>=40000000)drange=5
						if(src.power>=50000000)drange=6
						if(src.power>=60000000)drange=7
						if(src.power>=70000000)drange=8
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						DEO.frozen=0
						DEO.doing=0
						if(istype(DEO,/mob/PC))DEO.icon_state=""
						src.TrailDelete()
						break
				for(var/mob/N as mob in get_step(src,src.dir))
					if(N.kiabsorb)
						var/absorbpower=N.kidefense*0.5+N.ki*0.15
						var/absorbdamage=src.power-absorbpower
						if(absorbpower>=src.power)
							N.ki+=src.power
							if(N.ki>N.ki_max*2)
								N<<"Your body can't handle anymore ki!"
								N.powerlevel=0
								N.DeathCheck(O)
						else
							N.powerlevel-=absorbdamage
							N << "<font color=red>[src.owner]'s [src] hits you!"
							src.owner << "<font color=red>Your [src] hits [N]!"
							Explode(new /Effect/BasicBoom(N.loc,1,3))
							if(O.kill)N.DeathCheck(src.owner)
							else spawn(0)N.KO()
						src.TrailDelete()
						break
					else
						if(N.Dodge_Attack(src.owner)==TRUE)
							flick("IT",N)
							switch(src.dir)
								if(WEST)
									if(prob(50))N.loc=locate(N.x,N.y+2,N.z)
									else N.loc=locate(N.x,N.y-2,N.z)
								if(EAST)
									if(prob(50))N.loc=locate(N.x,N.y+2,N.z)
									else N.loc=locate(N.x,N.y-2,N.z)
								if(NORTH)
									if(prob(50))N.loc=locate(N.x+2,N.y,N.z)
									else N.loc=locate(N.x-2,N.y,N.z)
								if(SOUTH)
									if(prob(50))N.loc=locate(N.x+2,N.y,N.z)
									else N.loc=locate(N.x-2,N.y,N.z)
								if(NORTHWEST)
									if(prob(50))N.loc=locate(N.x,N.y+2,N.z)
									else N.loc=locate(N.x,N.y-2,N.z)
								if(NORTHEAST)
									if(prob(50))N.loc=locate(N.x,N.y+2,N.z)
									else N.loc=locate(N.x,N.y-2,N.z)
								if(SOUTHEAST)
									if(prob(50))N.loc=locate(N.x+2,N.y,N.z)
									else N.loc=locate(N.x-2,N.y,N.z)
								if(SOUTHWEST)
									if(prob(50))N.loc=locate(N.x+2,N.y,N.z)
									else N.loc=locate(N.x-2,N.y,N.z)
						else
							if(N.Deflect_Attack(src.owner)==TRUE)
								var/mob/DO=src.owner
								if(!DO||!src||!N)break
								spawn(0)DO.DeleteTrails()
								src.range=0
								src.owner=N
								src.dir=N.dir
				if(src.power<=0)
					src.TrailDelete()
					break
				if(src.range>=20)
					if(src.power>=20000000)
						var/obj/techs/Overlays/Crater_Center/C=new
						C.loc=src.loc
					else
						if(src.power>=8000000)
							var/obj/techs/Overlays/Crater_Small/C=new
							C.loc=src.loc
					var/drange=1
					if(src.power>=10000000)drange=2
					if(src.power>=20000000)drange=3
					if(src.power>=30000000)drange=4
					if(src.power>=40000000)drange=5
					if(src.power>=50000000)drange=6
					if(src.power>=60000000)drange=7
					if(src.power>=70000000)drange=8
					for(var/obj/Buildings/DE in oview(drange,src))
						DE.hp-=src.power/(1+get_dist(src,DE))
						spawn(0)DE.DestroyIt()
					src.ExplodeDamage(0,drange,src.power)
					src.TrailDelete()
					break
				step(src,src.dir)
				sleep(1)
		TechAttackBeam(mob/O,Z,Power,I,IS,IST,Effect)
			src.owner=O
			src.power=Power
			src.controldisabled=1
			if(I!=0)src.icon=I
			if(IS!=0)src.icon_state=IS
			src.range=0
			src.name=Z
			O.ki-=O.ki*O.kiuse
			O.overlays+=icon('Techs.dmi',"[IS]ki")
			src.clashable=1
			O.beaming=1
			switch(O.dir)
				if(NORTHWEST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					src.dir = WEST
					src.loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					src.dir = EAST
					src.loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
			while(src)
				src.controldisabled=1
				if(!src.owner||src.owner==null||!O)
					for(var/obj/Tech/BeamH/BC in get_step(src,src.dir))BC.clashing=0
					for(var/obj/Tech/BR in world)if(BR.owner==src.owner)del(BR)
					del(src)
					break
				if(!src.clashing)
					src.range+=1
					var/turf/T=src.loc
					if(!T)return
					if(!T.density&&src.power>50000000)
						if(istype(T,/turf/Earth/Island_Edge_005))
							var/obj/techs/Overlays/CraterTrail/TTrail=new
							TTrail.dir=src.dir
							TTrail.loc=T
					for(var/mob/M in T)
						if(M==src)return
						if(M.FuseFollower)continue
						if((M.pk&&!M.safe&&!M.FuseFollower&&!M.dead))
							var/mob/OW=src.owner
							if(Effect=="Candy")
								var/chance1 = rand(1,100)
								var/chance2= rand(1,100)
								var/damage=(src.power*chance1*0.01)-(M.kidefense*chance2*0.01)
								if(damage < 0)damage = ((power*0.0001))*chance1
								if(damage < 1)damage = 1
								src.power-=M.powerlevel
								M.powerlevel-=damage
								M << "<font color=red>You took [damage] damage!"
								OW << "<font color=red>You caused [damage] to [M]!"
								Explode(new /Effect/BasicBoom(M.loc,1,3))
								if(M.damage_enabled)M << "<font color=red>[OW]'s [src] hits you!"
								if(OW.damage_enabled)OW << "<font color=red>Your [src] hits [M]!"
								if(M.powerlevel<=0)
									if(M.race == "Android")
										if(istype(M,/mob/PC))M.icon_state = ""
										M.doing = 0
										M.frozen = 0
										M.powerlevel = 0
										if(OW.kill)M.DeathCheck(OW)
										else spawn(0)M.KO()
									else
										var/obj/Equipment/Consumable/Candy/C = new
										if(!src||!M||!C)break
										C.loc = src.loc
										C.name = "[M.name]'s Candy"
										if(istype(M,/mob/PC))
											C.candy_pl = round(M.powerlevel_max/1500)
											if(C.candy_pl<1)C.candy_pl=1
											C.candy_ki = round(M.ki_max/usr.level/2000)
											if(C.candy_ki< 1)C.candy_ki=1
											C.candy_kidef = round(M.kidefense_max/usr.level/2000)
											if(C.candy_kidef < 1)C.candy_kidef=1
											C.candy_str = round(M.strength_max/usr.level/1500)
											if(C.candy_str < 1)C.candy_str= 1
											C.candy_def = round(M.defence_max/usr.level/1500)
											if(C.candy_def < 1 )C.candy_def= 1
										C.icon = 'Candy.dmi'
										if(istype(M,/mob/PC))M.icon_state = ""
										C.loc = M.loc
										M.powerlevel_max -= C.candy_pl/2
										M<<"Powerlevel Lost = [C.candy_pl/2]"
										M.ki_max -= C.candy_ki/2
										M<<"Ki Lost = [C.candy_ki/2]"
										M.kidefense_max -= C.candy_kidef/2
										M<<"Ki Defence Lost = [C.candy_kidef/2]"
										M.strength_max -= C.candy_str/2
										M<<"Strength Lost = [C.candy_str/2]"
										M.defence_max -= C.candy_def/2
										M<<"Defence Lost = [C.candy_def/2]"
										M.powerlevel = 0
										M.DeathCheck(OW,"Candy")
								if(src.power<=0)
									OW.frozen=0
									OW.doing=0
									if(istype(OW,/mob/PC))OW.icon_state=""
									src.TrailDelete()
									break
							else
								var/chance1 = rand(1,100)
								var/chance2= rand(1,100)
								var/damage=(src.power*chance1*0.01)-(M.kidefense*chance2*0.01)
								if(damage < 0)damage = ((power*0.0001))*chance1
								if(damage < 1)damage = 1
								if(Effect=="Critical")
									if(prob(40))damage=((src.power*rand(1.3,1.7))*chance1)-(M.kidefense*chance2)
									if(damage < 0)damage = (src.power*rand(1.3,1.7)*chance1)
									if(damage < 1)damage = 1
								var/apower=src.power
								if(damage<1)damage=1
								src.power-=M.powerlevel
								M.powerlevel-=damage
								M << "<font color=red>You took [damage] damage!"
								OW << "<font color=red>You caused [damage] to [M]!"
								Explode(new /Effect/BasicBoom(M.loc,1,3))
								if(M&&M.damage_enabled)M << "<font color=red>[OW]'s [src] hits you!"
								if(OW&&OW.damage_enabled)OW << "<font color=red>Your [src] hits [M]!"
								if(OW&&OW.kill)M.DeathCheck(OW)
								else spawn(0)M.KO()
								if(apower>=20000000)
									var/obj/techs/Overlays/Crater_Center/C=new
									C.loc=src.loc
								else
									if(src.power>=8000000)
										var/obj/techs/Overlays/Crater_Small/C=new
										C.loc=src.loc
								var/drange=1
								if(apower>=10000000)drange=2
								if(apower>=20000000)drange=3
								if(apower>=30000000)drange=4
								if(apower>=40000000)drange=5
								if(apower>=50000000)drange=6
								if(apower>=60000000)drange=7
								if(apower>=70000000)drange=8
								for(var/obj/Buildings/DE in oview(drange,src))
									DE.hp-=src.power/(1+get_dist(src,DE))
									spawn(0)DE.DestroyIt()
								src.ExplodeDamage(M,drange,apower)
								if(src.power<=0)
									if(!OW)return
									OW.frozen=0
									OW.doing=0
									if(istype(OW,/mob/PC))OW.icon_state=""
									src.TrailDelete()
									break
						else
							var/mob/OW=src.owner
							OW.frozen=0
							OW.doing=0
							if(istype(OW,/mob/PC))OW.icon_state=""
							src.TrailDelete()
							break
					for(var/obj/Buildings/DE in T)
						var/mob/DEO=src.owner
						if(!DEO.see_invisible)if(istype(DE,/obj/Buildings)&&DE.invisibility)continue
						DE.hp-=src.power
						if(DE.DestroyIt()==TRUE)
							var/drange=1
							if(src.power>=10000000)drange=2
							if(src.power>=20000000)drange=3
							if(src.power>=30000000)drange=4
							if(src.power>=40000000)drange=5
							if(src.power>=50000000)drange=6
							if(src.power>=60000000)drange=7
							if(src.power>=70000000)drange=8
							for(var/obj/Buildings/DE2 in oview(drange,DE))
								DE2.hp-=src.power/(1+get_dist(src,DE2))
								spawn(0)DE2.DestroyIt()
							src.ExplodeDamage(0,drange,src.power)
							DEO.frozen=0
							DEO.doing=0
							if(istype(DEO,/mob/PC))DEO.icon_state=""
							src.TrailDelete()
							break
					for(var/mob/N as mob in get_step(src,src.dir))
						if(N.kiabsorb)
							var/mob/OW=src.owner
							var/absorbpower=N.kidefense*0.5+N.ki*0.15
							var/absorbdamage=src.power-absorbpower
							if(absorbpower>=src.power)
								N.ki+=src.power
								if(N.ki>N.ki_max*2)
									N<<"Your body can't handle anymore ki!"
									N.powerlevel=0
									N.DeathCheck(O)
							else
								N.powerlevel-=absorbdamage
								N << "<font color=red>You took [absorbdamage] damage!"
								OW << "<font color=red>You caused [absorbdamage] to [N]!"
								Explode(new /Effect/BasicBoom(N.loc,1,3))
								if(N.damage_enabled)N << "<font color=red>[OW]'s [src] hits you!"
								if(OW.damage_enabled)OW << "<font color=red>Your [src] hits [N]!"
								if(O.kill)N.DeathCheck(OW)
								else spawn(0)N.KO()
							OW.frozen=0
							OW.doing=0
							if(istype(OW,/mob/PC))OW.icon_state=""
							src.TrailDelete()
							break
						else
							if(N.Dodge_Attack(src.owner)==TRUE)
								flick("IT",N)
								switch(src.dir)
									if(WEST)
										if(prob(50))N.loc=locate(N.x,N.y+2,N.z)
										else N.loc=locate(N.x,N.y-2,N.z)
									if(EAST)
										if(prob(50))N.loc=locate(N.x,N.y+2,N.z)
										else N.loc=locate(N.x,N.y-2,N.z)
									if(NORTH)
										if(prob(50))N.loc=locate(N.x+2,N.y,N.z)
										else N.loc=locate(N.x-2,N.y,N.z)
									if(SOUTH)
										if(prob(50))N.loc=locate(N.x+2,N.y,N.z)
										else N.loc=locate(N.x-2,N.y,N.z)
							else
								if(N.Deflect_Attack(src.owner)==TRUE)
									var/mob/DO=src.owner
									DO.DeleteTrails()
									if(!DO||!src)return
									src.range=0
									DO.doing=0
									if(istype(DO,/mob/PC))DO.icon_state=""
									DO.frozen=0
									N.doing=1
									N.frozen=1
									if(istype(N,/mob/PC))flick("attack",N)
									src.owner=N
									src.dir=N.dir
					for(var/obj/Tech/BeamH/C in get_step(src,src.dir))
						if(C.clashable)
							if(!C.clashing)
								if(src.dir==NORTH&&C.dir==SOUTH)
									C.clashing=1
									src.clashing=1
									goto CLASH
								if(src.dir==SOUTH&&C.dir==NORTH)
									C.clashing=1
									src.clashing=1
									goto CLASH
								if(src.dir==EAST&&C.dir==WEST)
									C.clashing=1
									src.clashing=1
									goto CLASH
								if(src.dir==WEST&&C.dir==EAST)
									C.clashing=1
									src.clashing=1
									goto CLASH
							else
								if(src.dir==C.dir)
									C.power+=src.power
									var/mob/OW=src.owner
									OW.frozen=0
									OW.doing=0
									if(istype(OW,/mob/PC))OW.icon_state=""
									src.TrailDelete()
									break
								else
									C.power-=src.power*0.6
									var/mob/OW=src.owner
									OW.frozen=0
									OW.doing=0
									if(istype(OW,/mob/PC))OW.icon_state=""
									src.TrailDelete()
									break
						else
							if(src.power<C.power)
								var/mob/OW=src.owner
								OW.frozen=0
								OW.doing=0
								if(istype(OW,/mob/PC))OW.icon_state=""
								if(src.power>=20000000)
									var/obj/techs/Overlays/Crater_Center/CR=new
									CR.loc=src.loc
								else
									if(src.power>=8000000)
										var/obj/techs/Overlays/Crater_Small/CR=new
										CR.loc=src.loc
								var/drange=1
								var/explosion=src.power+(C.power-src.power)
								if(explosion>=10000000)drange=2
								if(explosion>=20000000)drange=3
								if(explosion>=30000000)drange=4
								if(explosion>=40000000)drange=5
								if(explosion>=50000000)drange=6
								if(explosion>=60000000)drange=7
								if(explosion>=70000000)drange=8
								C.power-=src.power
								src.ExplodeDamage(0,drange,src.power)
								src.TrailDelete()
								break
					if(src.power<=0)
						var/mob/OW=src.owner
						OW.frozen=0
						OW.doing=0
						if(istype(OW,/mob/PC))OW.icon_state=""
						src.TrailDelete()
						break
					if(src.range>=20)
						var/mob/OW=src.owner
						OW.frozen=0
						OW.doing=0
						if(istype(OW,/mob/PC))OW.icon_state=""
						if(src.power>=20000000)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
						else
							if(src.power>=8000000)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=src.loc
						var/drange=1
						if(src.power>=10000000)drange=2
						if(src.power>=20000000)drange=3
						if(src.power>=30000000)drange=4
						if(src.power>=40000000)drange=5
						if(src.power>=50000000)drange=6
						if(src.power>=60000000)drange=7
						if(src.power>=70000000)drange=8
						src.ExplodeDamage(0,drange,src.power)
						src.TrailDelete()
						break
					step(src,src.dir)
					var/obj/Tech/BeamT/B=new
					B.loc=T
					B.power=src.power
					B.dir=src.dir
					B.owner=src.owner
					B.icon=I
					B.icon_state=IST
					sleep(1)
					CLASH
				else
					for(var/obj/Tech/BeamH/C in get_step(src,src.dir))
						if(C.clashing&&C)
							var/mob/KS1=src.owner
							var/mob/KS2=C.owner
							KS1.clasharrow=src.dir
							KS2.clasharrow=C.dir
							var/P1=src.power+src.clashrush
							var/P2=C.power+C.clashrush
							if(P1>P2)
								var/Ap=(src.power*0.1)+rand(1,10)
								var/Cp=(C.power*0.1)+rand(1,10)
								switch(src.dir)
									if(NORTH)
										var/obj/Tech/BeamT/T=new
										T.loc=src.loc
										T.icon_state=IST
										T.owner=src.owner
										T.dir=src.dir
										step(C,NORTH)
										step(src,NORTH)
										C.dir=SOUTH
										sleep(1)
										if(!C||!src)break
										step(C,SOUTH)
										step(src,SOUTH)
										src.dir=NORTH
										sleep(1)
										step(C,NORTH)
										step(src,NORTH)
										C.dir=SOUTH
										for(T in C.loc)if(T.owner==C.owner)spawn(3)if(T)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(SOUTH)
										var/obj/Tech/BeamT/T=new
										T.dir=src.dir
										T.loc=src.loc
										T.icon_state=IST
										T.owner=src.owner
										step(C,SOUTH)
										step(src,SOUTH)
										C.dir=NORTH
										sleep(1)
										step(C,NORTH)
										step(src,NORTH)
										src.dir=SOUTH
										sleep(1)
										step(C,SOUTH)
										step(src,SOUTH)
										C.dir=NORTH
										for(T in C.loc)if(T.owner==C.owner)spawn(3)if(T)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(EAST)
										var/obj/Tech/BeamT/T=new
										T.loc=src.loc
										T.dir=src.dir
										T.icon_state=IST
										T.owner=src.owner
										step(C,EAST)
										step(src,EAST)
										C.dir=WEST
										sleep(1)
										step(C,WEST)
										step(src,WEST)
										src.dir=EAST
										sleep(1)
										step(C,EAST)
										step(src,EAST)
										C.dir=WEST
										for(T in C.loc)if(T.owner==C.owner)spawn(3)if(T)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(WEST)
										var/obj/Tech/BeamT/T=new
										T.loc=src.loc
										T.dir=src.dir
										T.icon_state=IST
										T.owner=src.owner
										step(C,WEST)
										step(src,WEST)
										C.dir=EAST
										sleep(1)
										step(C,EAST)
										step(src,EAST)
										src.dir=WEST
										sleep(1)
										step(C,WEST)
										step(src,WEST)
										C.dir=EAST
										for(T in C.loc)if(T.owner==C.owner)spawn(3)if(T)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
								if(C.range<1)
									var/mob/W=C.owner
									W.UnFreeze(20)
									src.clashing=0
									if(C)C.TrailDelete()
									break
								if(src.power<=0)
									var/mob/W=src.owner
									W.frozen=0
									W.doing=0
									if(istype(W,/mob/PC))W.icon_state=""
									C.clashing=0
									src.TrailDelete()
									break
							if(src.power<=C.power*2)sleep(8)
							else
								if(src.power>C.power*2&&src.power<=C.power*5)sleep(6)
								else
									if(src.power>C.power*5&&src.power<=C.power*10)sleep(4)
									else
										if(src.power>C.power*10)sleep(2)
				sleep(1)

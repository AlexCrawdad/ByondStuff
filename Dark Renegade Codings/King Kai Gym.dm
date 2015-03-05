mob/var/plotnum=0
var/worldplotnum=0
turf
	Passages
		KKGym
			Entrance
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						if(M.level<=1250)
							M.loc=locate(339,224,7)
							M.density=1
							M.it_blocked=1
							M.it_lock=1
						else
							M<<"Only level 1250 and lower may enter."
							return
			Exit
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						M.loc=locate(212,355,7)
						M.density=1
						M.it_blocked=0
						M.it_lock=0
		The_Lookout
			Entrance
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						M.loc=locate(19,2,5)
			Exit
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))M.loc=locate(313,399,1)





		Grav_room_Enter
			Entrance
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						M.loc=locate(278,226,5)
			Grav_room_Exit
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))M.loc=locate(167,227,1)




		Sub_Room
			Entrance
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						if(M.Yessub)
							for(var/obj/O in M.contents)
								if(O.dball)
									M<<"You can't bring the Dragonballs in here."
									return
							M.loc=locate(57,226,6)
							M<<"<font color=yellow><font size=3>You have entered the Subscriber area, walk on the Checkered tiles for levels!"
						else
							M<<"You are not a Subscriber"
							return
			Exit
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))M.loc=locate(175,213,1)


			SubTC
				Entered(var/mob/PC/M)
					if(istype(M,/mob/PC))
						var/strrand=rand(5,5000)
						var/defrand=rand(5,5000)
						M.exp+=rand(9000,500000)
						M.strength+=strrand
						M.strength_max+=strrand
						M.defence+=defrand
						M.defence_max+=defrand
						M.powerlevel-=strrand*9000
						M.stamina+=rand(0.5,3)
						M.expbuff=1
						spawn(1)M.Level_Up()
						M.GRAVITYDeath()









		Plot_Enter
			Entrance
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						if(M.plotnum==0)
							M<<"You have not Bought a Plot yet!"
						if(M.plotnum==1)
							M.loc=locate(5,383,10)
						if(M.plotnum==2)
							M.loc=locate(5,359,10)
						if(M.plotnum==3)
							M.loc=locate(5,335,10)
						if(M.plotnum==4)
							M.loc=locate(5,311,10)
						if(M.plotnum==5)
							M.loc=locate(5,287,10)
						if(M.plotnum==6)
							M.loc=locate(5,263,10)
						if(M.plotnum==7)
							M.loc=locate(5,239,10)
						if(M.plotnum==8)
							M.loc=locate(5,215,10)
						if(M.plotnum==9)
							M.loc=locate(5,191,10)
						if(M.plotnum==10)
							M.loc=locate(5,167,10)
						if(M.plotnum==11)
							M.loc=locate(5,143,10)
						if(M.plotnum==12)
							M.loc=locate(5,119,10)
						if(M.plotnum==13)
							M.loc=locate(5,95,10)
						if(M.plotnum==14)
							M.loc=locate(5,71,10)
						if(M.plotnum==15)
							M.loc=locate(5,47,10)
						if(M.plotnum==16)
							M.loc=locate(5,23,10)
						if(M.plotnum==17)
							M.loc=locate(48,383,10)
						if(M.plotnum==18)
							M.loc=locate(48,359,10)
						if(M.plotnum==19)
							M.loc=locate(48,335,10)
						if(M.plotnum==20)
							M.loc=locate(48,311,10)
						if(M.plotnum==21)
							M.loc=locate(48,287,10)
						if(M.plotnum==22)
							M.loc=locate(48,263,10)
						if(M.plotnum==23)
							M.loc=locate(48,239,10)
						if(M.plotnum==24)
							M.loc=locate(48,215,10)
						if(M.plotnum==25)
							M.loc=locate(48,191,10)
						if(M.plotnum==26)
							M.loc=locate(48,167,10)
						if(M.plotnum==27)
							M.loc=locate(48,143,10)
						if(M.plotnum==28)
							M.loc=locate(48,119,10)
						if(M.plotnum==29)
							M.loc=locate(48,95,10)
						if(M.plotnum==30)
							M.loc=locate(48,71,10)
						if(M.plotnum==31)
							M.loc=locate(48,47,10)
						if(M.plotnum==32)
							M.loc=locate(48,23,10)
			Plot_Exit
				density=1
				Enter(mob/M)
					if(istype(M,/mob/PC))M.loc=locate(267,365,1)
obj
	var
		radarlvl=1
			var/db1=0
			var/db2=0
			var/db3=0
			var/db4=0
			var/db5=0
			var/db6=0
			var/db7=0
obj/Equipment
	DragonRadar
		value=20000
		name="Dragon Radar {Level: 1}"
		icon = 'Dragon Radar.dmi'
		icon_state = "DBRadar1"
		Click()
			set category = null
			if(usr.z)
				if(usr.dbrad == 0)
					if(src.radarlvl==1)
						if(usr.CheckEarthBalls()!=TRUE)
							usr<<"The Earth Dragonballs haven't been spawned."
							return
						for(var/obj/Earth_Dragonballs/Earth_Dragonball_1 in world)
							if(Earth_Dragonball_1.x==0||Earth_Dragonball_1.y==0||Earth_Dragonball_1.z==0)usr<<"<font color = lime>[Earth_Dragonball_1.name]: </font> [Earth_Dragonball_1.loc]"
							else usr<<"<font color = lime>[Earth_Dragonball_1.name]: </font> [Earth_Dragonball_1.x], [Earth_Dragonball_1.y], [Earth_Dragonball_1.z]"
					if(src.radarlvl==2)
						if(usr.CheckNamekBalls()!=TRUE)
							usr<<"The Namek Dragonballs haven't been spawned."
							return
						for(var/obj/Namek_Dragonballs/Namek_Dragonball_1 in world)
							if(Namek_Dragonball_1.x==0||Namek_Dragonball_1.y==0||Namek_Dragonball_1.z==0)usr<<"<font color = #2E8B57>[Namek_Dragonball_1.name]: </font> [Namek_Dragonball_1.loc]"
							else usr<<"<font color = #2E8B57>[Namek_Dragonball_1.name]: </font> [Namek_Dragonball_1.x], [Namek_Dragonball_1.y], [Namek_Dragonball_1.z]"
					if(src.radarlvl==3)
						if(usr.CheckBlackBalls()!=TRUE)
							usr<<"The Black Star Dragonballs haven't been spawned."
							return
						for(var/obj/Black_Dragonballs/Black_Dragonball_1 in world)
							if(Black_Dragonball_1.x==0||Black_Dragonball_1.y==0||Black_Dragonball_1.z==0)usr<<"<font color = #708090>[Black_Dragonball_1.name]: </font> [Black_Dragonball_1.loc]"
							else usr<<"<font color = #708090>[Black_Dragonball_1.name]: </font> [Black_Dragonball_1.x], [Black_Dragonball_1.y], [Black_Dragonball_1.z]"
				else
					for(var/obj/dragonradar/hud/H in usr.client.screen)del(H)
					usr.dbrad = 0
			else return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr<<"You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else usr<<"You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				if(!src.equiped)
					src.icon_state = "DBRadar[src.radarlvl]"
					usr<<"You have dropped the: <u>[src]</u>."
					for(var/obj/dragonradar/hud/H in usr.client.screen)del(H)
					usr.dbrad = 0
					usr.inven_min -= 1
					src.loc = usr.loc
				else usr<<"You are unable to drop: <u>[src]</u>, it's already equipped."
client
	proc
		UpdateRadarEarth()
			set background=1
			spawn while(src.mob.dbrad)
				if(!src.mob.dbrad)break
				var/icon/R=icon('Dragon Radar2.dmi',"")
				R.DrawBox(rgb(255,255,255), 17, 17-3, 17, 17+3)
				R.DrawBox(rgb(255,255,255), 17-3, 17, 17+3, 17)
				for(var/obj/Earth_Dragonballs/O in world)
					if(O.z == src.mob.z)
						var/dx = 16-(src.mob.x/25 - O.x/25)+1
						var/dy = 16-(src.mob.y/25 - O.y/25)+1
						R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
						sleep(1)
				for(var/mob/M in world)
					if(M.z == src.mob.z)
						if(M.e_db_1||M.e_db_2||M.e_db_3||M.e_db_4||M.e_db_5||M.e_db_6||M.e_db_7)
							var/dx = 16-(src.mob.x/25 - M.x/25)+1
							var/dy = 16-(src.mob.y/25 - M.y/25)+1
							R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
							sleep(1)
				src.radar.icon = R
				sleep(10)
		UpdateRadarNamek()
			set background=1
			spawn while(src.mob.dbrad)
				if(!src.mob.dbrad)break
				var/icon/R=icon('Dragon Radar2.dmi',"")
				R.DrawBox(rgb(255,255,255), 17, 17-3, 17, 17+3)
				R.DrawBox(rgb(255,255,255), 17-3, 17, 17+3, 17)
				for(var/obj/Namek_Dragonballs/O in world)
					if(O.z == src.mob.z)
						var/dx = 16-(src.mob.x/25 - O.x/25)+1
						var/dy = 16-(src.mob.y/25 - O.y/25)+1
						R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
						sleep(1)
				for(var/mob/M in world)
					if(M.z == src.mob.z)
						if(M.n_db_1||M.n_db_2||M.n_db_3||M.n_db_4||M.n_db_5||M.n_db_6||M.n_db_7)
							var/dx = 16-(src.mob.x/25 - M.x/25)+1
							var/dy = 16-(src.mob.y/25 - M.y/25)+1
							R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
							sleep(1)
				src.radar.icon = R
				sleep(10)
		UpdateRadarBlack()
			set background=1
			spawn while(src.mob.dbrad)
				if(!src.mob.dbrad)break
				var/icon/R=icon('Dragon Radar2.dmi',"")
				R.DrawBox(rgb(255,255,255), 17, 17-3, 17, 17+3)
				R.DrawBox(rgb(255,255,255), 17-3, 17, 17+3, 17)
				for(var/obj/Black_Dragonballs/O in world)
					if(O.z == src.mob.z)
						var/dx = 16-(src.mob.x/25 - O.x/25)+1
						var/dy = 16-(src.mob.y/25 - O.y/25)+1
						R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
						sleep(1)
				for(var/mob/M in world)
					if(M.z == src.mob.z)
						if(M.b_db_1||M.b_db_2||M.b_db_3||M.b_db_4||M.b_db_5||M.b_db_6||M.b_db_7)
							var/dx = 16-(src.mob.x/25 - M.x/25)+1
							var/dy = 16-(src.mob.y/25 - M.y/25)+1
							R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
							sleep(1)
				src.radar.icon = R
				sleep(10)
obj/dragonradar/hud
	icon = 'Dragon Radar.dmi'
	s0/icon_state = "radar"
	s1/icon_state = "1"
	s2/icon_state = "2"
	s3/icon_state = "3"
	s4/icon_state = "4"
	s1n/icon_state = "n1"
	s2n/icon_state = "n2"
	s3n/icon_state = "n3"
	s4n/icon_state = "n4"
	s1b/icon_state = "b1"
	s2b/icon_state = "b2"
	s3b/icon_state = "b3"
	s4b/icon_state = "b4"
mob/var/tmp/dbrad = 0
client
	var/obj/dragonradar/radar
mob
	proc
		CheckEarthBalls()
			for(var/obj/Earth_Dragonballs/O in world)if(O.dball)return TRUE
		CheckNamekBalls()
			for(var/obj/Namek_Dragonballs/O in world)if(O.dball)return TRUE
		CheckBlackBalls()
			for(var/obj/Black_Dragonballs/O in world)if(O.dball)return TRUE

var/randomzombies=0
var/totalzombies=0
var/apocalypse_on=0
mob/var/zombie_kills=0
mob/var/got_comet=0

mob/Monster/
	ApocalypseZombie
		name="Apocalypse Zombie"
		icon='Events.dmi'
		icon_state="zombie"
		karma="Evil"
		race="Human"
		level=600
		powerlevel=10000000000000000000000000000
		powerlevel_max=10000000000000000000000
		ki=100000000000000000000
		ki_max=100000000000000000000
		kidefense=1
		kidefense_max=1
		strength=100000000000000000000
		strength_max=100000000000000000000
		defence=100000000000000000000
		defence_max=100000000000000000000
		speed=2700
		zenni=25000
		pk=1
		Del()
			..()
			totalzombies-=1
		New()
			..()
			CreateName()
			spawn(10)if(src)WALKRAND()
		proc/WALKRAND()
			while(src)
				var/Found=FALSE
				for(var/mob/PC/P in oview(8)).
					step_rand(src,2)
					Found=TRUE
					break
				if(Found!=TRUE)sleep(8)
				sleep(8)


proc
	Apocalypse_Start()
/*		world<<"<font color=white>Weatherman:</font><font color=red>The Zombies are invading.."
		sleep(200)
		world<<"<font color=white>Weatherman:</font><font color=red>RUN FOR IT!"
		sleep(100)
		totalzombies=0
		spawn(1)Zombie_Spawn()
		world<<"<font color=white>Weatherman:</font><font color=red>Uh-Oh, They're in my Office!"
		sleep(20)
		world<<"<font color=white>Weatherman:</font><font color=red>Acccck!"
		sleep(10)
		world<<"<font color=blue>News Channel:</font><font color=red>We lost Contact!"
		sleep(600)
		world<<"<font color=blue>News Channel:</font><font color=red>They're Rapidly destroying the planet!"
		sleep(20)
		world<<"<font color=blue>News Channel:</font><font color=red>What's this? A team of brave survivors are destroying the Zombies!"
		sleep(100)
		world<<"<font color=blue>News Channel:</font><font color=red>No! They're invading the station!"
		sleep(1000)
		world<<"<font color=blue>News Channel:</font><font color=red>Phew, it was the Weatherman!"
		sleep(10)
		world<<"<font color=blue>News Channel:</font><font color=red>(Gimmeh that Mike!) Hey-!"
		sleep(10)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		world<<"<font color=white>Weatherman:</font><font color=red>Hey I'm back folks, Hows it been?"
		sleep(500)
		world<<"<font color=white>Weatherman:</font><font color=red>No answer, seriously? *Laughs*"
		sleep(300)
		world<<"<font color=blue>News Channel:</font><font color=red>Finally, got the mic Back!"
		sleep(500)
		world<<"<font color=blue>News Channel:</font><font color=red>Wow, the players are tearin' up the Zombies!"
		sleep(600)
		world<<"<font color=blue>News Channel:</font><font color=red>Its going good..."
		sleep(2000)
		world<<"<font color=blue>News Channel:</font><font color=red>Come on guys, kill those monsters..."
		sleep(4000)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		world<<"<font color=blue>News Channel:</font><font color=red>The supsense, it can kill anyone!"
		sleep(50)
		world<<"<font color=white>Weatherman:</font><font color=red>You're telling me? I died 3 times so far, thankfully king kai has been Kind..."
		sleep(50)
		world<<"<font color=blue>News Channel:</font><font color=red>Who is king kai? And you can't be serious, if you died, you wouldnt be talking!"
		sleep(50)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		world<<"<font color=white>Weatherman:</font><font color=red>Nevermind..."
		sleep(2000)
		world<<"<font color=white>Weatherman:</font><font color=red>Shhh"
		sleep(5000)
		world<<"<font color=white>Weatherman:</font><font color=red>Zombies, they're Everywhere! *Nervously Laughs*"
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(2000)
		world<<"<font color=white>Weatherman:</font><font color=red>This keeps getting worse..."
		sleep(5000)
		world<<"<font color=blue>News Channel:</font><font color=red>Those zombies! They are evil..."*/
		world<<"<font size=5>The apocalypse has arrived! Kill the zombies with 'Fire Comet' to win, the more you kill, the greater the prize."
		totalzombies=0
		apocalypse_on=1
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
			sleep(50)
			Learn_Fire_Text()
			sleep(150)
			Learn_Fire()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(600)
		if(totalzombies<=50)
			spawn(1)Zombie_Spawn()
		sleep(500)
		world<<"The apocalypse has ended!"
		totalzombies=0
		apocalypse_on=0
		Winner()
		for(var/mob/Monster/ApocalypseZombie/S in world)
			if(S)
				del(S)
		for(var/mob/S in world)
			if(S.client)
				for(var/obj/Technique/FireComet/T in S)del(T)
				S.got_comet=0

	Zombie_Spawn()
		randomzombies = rand(50,200)
		while(randomzombies)
			var/turf/T=locate(rand(1,400),rand(1,400),1)
			if(T.dbable)
				totalzombies+=1
				randomzombies--
				new/mob/Monster/ApocalypseZombie(T)
				sleep(1)

	Learn_Fire()
		for(var/mob/S in world)
			if(S.client)
				S.contents+=new/obj/Technique/FireComet
				S.got_comet=1

	Learn_Fire_Text()
		world<<"<font color=green>(Telepathy)</font>Goku: Zombies!?!"
		sleep(30)
		world<<"<font color=green>(Telepathy)</font>You: It appears so, any Ideas?"
		sleep(30)
		world<<"<font color=green>(Telepathy)</font>Goku: Well, I have been saving up a little Move to use..."
		sleep(15)
		world<<"<font color=green>(Telepathy)</font>Goku: Wanna try it?"
		sleep(20)
		world<<"<font color=green>(Telepathy)</font>You: Sure, anything to stop these Zombies!"
		sleep(25)
		world<<"<font color=green>(Telepathy)</font>Goku: Be warned, It kills anything in one shot!"
		sleep(30)
		world<<"<font color=red> You have learnt 'Fire Comet'!"
		sleep(15)
		world<<"<font color=green>(Telepathy)</font>Goku: There you go, I'm losing energy, I cannot talk any longer..."
		world<<"<i>Goku's voice fades away, it appears you are on your own now.</i>"

	Winner()
		for(var/mob/S in world)
			if(S.client)
				if(S.zombie_kills>=15)
					S.zombie_kills=0
					S<<"You won 1000 Levels!"
					spawn(1)
						var/amount=1000
						amount=1000
						while(amount>0)
							if(!S)return
							S.exp=S.tnl
							S.Level_Up()
							amount--
							sleep(0.155)
				if(S.zombie_kills>=30)
					S.zombie_kills=0
					S<<"You won 2000 Levels!"
					spawn(1)
						var/amount=2000
						amount=2000
						while(amount>0)
							if(!S)return
							S.exp=S.tnl
							S.Level_Up()
							amount--
							sleep(0.155)
				if(S.zombie_kills>=45)
					S.zombie_kills=0
					S<<"You won 3500 Levels!"
					spawn(1)
						var/amount=3500
						amount=3500
						while(amount>0)
							if(!S)return
							S.exp=S.tnl
							S.Level_Up()
							amount--
							sleep(0.155)
				if(S.zombie_kills>=60)
					S.zombie_kills=0
					S<<"You won 5000 Levels!"
					spawn(1)
						var/amount=5000
						amount=5000
						while(amount>0)
							if(!S)return
							S.exp=S.tnl
							S.Level_Up()
							amount--
							sleep(0.155)
				if(S.zombie_kills>=120)
					S.zombie_kills=0
					S<<"You won 7000 Levels!"
					spawn(1)
						var/amount=7000
						amount=7000
						while(amount>0)
							if(!S)return
							S.exp=S.tnl
							S.Level_Up()
							amount--
							sleep(0.155)
				if(S.zombie_kills>=250)
					S.zombie_kills=0
					S<<"You won 15000 Levels!"
					spawn(1)
						var/amount=15000
						amount=15000
						while(amount>0)
							if(!S)return
							S.exp=S.tnl
							S.Level_Up()
							amount--
							sleep(0.155)
				if(S.zombie_kills>=500)
					S.zombie_kills=0
					S<<"You won 30000 Levels!"
					spawn(1)
						var/amount=30000
						amount=30000
						while(amount>0)
							if(!S)return
							S.exp=S.tnl
							S.Level_Up()
							amount--
							sleep(0.155)

obj
	Technique
		FireComet
			verb
				Fire_Comet()
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
					if(usr.ki<500)
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
					usr.using=1
					usr.doing=1
					view() << sound('kiblast.wav')
					usr.frozen=1
					usr.tech_cooldown=1
					spawn(1)
						usr.frozen=0
						usr.doing=0
					spawn(8)if(usr)
						usr.using=0
						usr.tech_cooldown=0
					var/obj/Tech/BeamH/A=new
					src.setpower+=(usr.powerlevel*100000000000000000000+(usr.ki_skill/1.1))*(usr.kiuse/0.9)
					if(usr.legendary_chromosome)A.TechAttackStraight(usr,"Ki Blast",usr.ki*usr.kiuse+src.setpower,'F1R3 C0M3T.dmi',"",0)
					else A.TechAttackStraight(usr,"Ki Blast",usr.ki*usr.kiuse+src.setpower,'F1R3 C0M3T.dmi',"",0)











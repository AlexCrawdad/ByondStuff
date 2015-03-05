mob/var/banked_zenni = 0
mob
	NPC
		Banker
			name = "{NPC}Banker"
			icon_state="Banker"
			density = 1
			safe = 1
			New()
				..()
				src.AddName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking||usr.fused)return
					usr.talking = 1
					switch(input("Hello [usr]. What can I do for you today?")in list("Deposit","Withdrawl","Transfer Funds","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Deposit")
							if(usr.zenni<1)
								usr<<"<font color=white>Banker:</font> You don't have any zenni!"
								usr.talking=0
								return
							var/deposit = input("How much do you wish to deposit?([usr.zenni] zenni(es))")as num
							if(deposit>usr.zenni)deposit=usr.zenni
							if(deposit <= 0)
								usr.talking = 0
								return
							else
								usr.zenni -= round(deposit)
								usr.banked_zenni += round(deposit)
								usr.talking = 0
								usr<<"<font color=white>Banker:</font> [deposit] zenni(es) has been successfully transferred into your account!"
								return
						if("Withdrawl")
							if(usr.banked_zenni<1)
								usr<<"<font color=white>Banker:</font> You don't have any zenni in your account!"
								usr.talking=0
								return
							var/withdrawl = input("How much do you wish to withdraw?([usr.banked_zenni] banked zenni(es))")as num
							if(withdrawl > usr.banked_zenni)withdrawl=usr.banked_zenni
							if(withdrawl<=0)
								usr.talking=0
								return
							else
								usr.banked_zenni -= round(withdrawl)
								usr.zenni += round(withdrawl)
								usr.talking = 0
								usr<<"<font color=white>Banker:</font> [withdrawl] zenni(es) has been successfully withdrawn from your account!"
								return
						if("Transfer Funds")
							var/transfer = input("How much do you wish to transfer?([usr.banked_zenni] banked zenni(es))")as num
							if(transfer > usr.banked_zenni)transfer=usr.banked_zenni
							if(transfer <= 0)
								usr.talking = 0
								return
							else
								var/varPeople = list()
								for(var/mob/PC/M in world)varPeople += M
								var/varTo = input("Who would you like to transfer [transfer] zenni(es) to whom?","Transfer Funds") in varPeople + list("Cancel")
								if(varTo == "Cancel" || varTo == "[usr]")
									usr.talking = 0
									return
								else
									usr.banked_zenni -= round(transfer)
									varTo:banked_zenni += round(transfer)
									usr.talking = 0
									usr<<"<font color=white>Banker:</font> [transfer] zenni(es) has been successfully transferred to [varTo]'s account."
									varTo << "<font color=white>Banker:</font> [transfer] zenni(es) has been successfully transferred to your account from [usr]."
									return
		BankerGH
			name = "{NPC}GH Banker"
			icon_state="Banker"
			density = 1
			safe=1
			New()
				..()
				CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking)return
					usr.talking = 1
					switch(input("Hello [usr]. What can I do for you today?")in list("Deposit","Withdrawl","Transfer Funds","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Deposit")
							if(usr.zenni<1)
								usr<<"<font color=white>Banker:</font> You don't have any zenni!"
								usr.talking=0
								return
							var/deposit = input("How much do you wish to deposit?([usr.zenni] zenni(es))")as num
							if(deposit>usr.zenni)deposit=usr.zenni
							if(deposit <= 0)
								usr.talking = 0
								return
							else
								usr.zenni -= round(deposit)
								usr.banked_zenni += round(deposit)
								usr.talking = 0
								usr<<"<font color=white>Banker:</font> [deposit] zenni(es) has been successfully transferred into your account!"
								return
						if("Withdrawl")
							if(usr.banked_zenni<1)
								usr<<"<font color=white>Banker:</font> You don't have any zenni in your account!"
								usr.talking=0
								return
							var/withdrawl = input("How much do you wish to withdraw?([usr.banked_zenni] banked zenni(es))")as num
							if(withdrawl > usr.banked_zenni)withdrawl=usr.banked_zenni
							if(withdrawl<=0)
								usr.talking=0
								return
							else
								usr.banked_zenni -= round(withdrawl)
								usr.zenni += round(withdrawl)
								usr.talking = 0
								usr<<"<font color=white>Banker:</font> [withdrawl] zenni(es) has been successfully withdrawn from your account!"
								return
						if("Transfer Funds")
							var/transfer = input("How much do you wish to transfer?([usr.banked_zenni] banked zenni(es))")as num
							if(transfer > usr.banked_zenni)transfer=usr.banked_zenni
							if(transfer <= 0)
								usr.talking = 0
								return
							else
								var/varPeople = list()
								for(var/mob/PC/M in world)varPeople += M
								var/varTo = input("Who would you like to transfer [transfer] zenni(es) to whom?","Transfer Funds") in varPeople + list("Cancel")
								if(varTo == "Cancel" || varTo == "[usr]")
									usr.talking = 0
									return
								else
									usr.banked_zenni -= round(transfer)
									varTo:banked_zenni += round(transfer)
									usr.talking = 0
									usr<<"<font color=white>Banker:</font> [transfer] zenni(es) has been successfully transferred to [varTo]'s account."
									varTo << "<font color=white>Banker:</font> [transfer] zenni(es) has been successfully transferred to your account from [usr]."
									return
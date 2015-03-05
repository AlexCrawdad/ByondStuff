var/list/Parties=list()
mob
	var
		tmp
			party_name=""
			in_party=0
			party_leader=0
			party_member=0
	PC
		verb
			Create_Party()
				set category="Channels"
				if(in_party)return
				else
					switch(alert("Do you want to create a party?","","Yes","No"))
						if("No")return
						else
							var/partyname=input("Type in the Party name with NO HTML(20 characters max).")as text|null
							if(partyname==" "||partyname==null||!partyname)return
							partyname = html_encode(partyname)
							if(lentext(partyname) > 20)
								alert("Party name cannot exceed 20 Characters.")
								return
							if(Parties.Find(partyname))
								alert("That name is already taken.")
								return
							switch(alert("Create the party: [partyname]?","Party Create","Yes","No"))
								if("No")return
								if("Yes")
									if(Parties.Find(partyname))
										alert("That name is already taken.")
										return
									party_name=partyname
									party_leader=1
									in_party=1
									verbs-=new/mob/PC/verb/Create_Party()
									verbs+=new/mob/PartyVerbs/verb/Party_Boot()
									verbs+=new/mob/PartyVerbs/verb/Party_Chat()
									verbs+=new/mob/PartyVerbs/verb/Party_Invite()
									verbs+=new/mob/PartyVerbs/verb/Party_Members()
									verbs+=new/mob/PartyVerbs/verb/Party_Leave()
									Parties.Add(partyname)
									return
	PartyVerbs
		verb
			Party_Boot()
				set category="Party"
				var/list/L=new/list()
				for(var/mob/M in world)if(M.in_party&&M.party_name==party_name&&M!=usr)L.Add(M)
				L.Add("Cancel")
				var/mob/B=input("Who do you wish to boot from: [party_name]?")in L
				if(B=="Cancel"||!B||B.party_name!=party_name||!in_party)return
				switch(alert("Do you want to boot [B] from: [party_name]?","","Boot","Cancel"))
					if("Cancel")return
					else
						for(var/mob/N in world)if(N.party_name==party_name)N<<"<font color=lime>[party_name] Information:<font color=white> [usr] has booted [B]!"
						B.in_party=0
						B.party_leader=0
						B.party_member=0
						B.party_name=B.name
						B.verbs+=new/mob/PC/verb/Create_Party()
						B.verbs-=new/mob/PartyVerbs/verb/Party_Boot()
						B.verbs-=new/mob/PartyVerbs/verb/Party_Chat()
						B.verbs-=new/mob/PartyVerbs/verb/Party_Invite()
						B.verbs-=new/mob/PartyVerbs/verb/Party_Members()
						B.verbs-=new/mob/PartyVerbs/verb/Party_Leave()
						return
		verb
			Party_Chat(T as text)
				set category="Party"
				if(channelmute!="")
					usr<<"All chat channels have been muted."
					return
				if(!T)
					usr<<"Your message may not be blank."
					return
				T = html_encode(T)
				if(lentext(T) > 100)
					usr<<"Your message cannot exceed 100 characters."
					return
				for(var/mob/M in world)if(M.party_name==party_name)M<<"<font color=lime>{[party_name]}[usr]:<font color=white><font size=-2> [T]"
				return
			Party_Invite()
				set category="Party"
				var/list/L=new/list()
				for(var/mob/PC/M in world)
					if(M.in_party||!M.loggedin)continue
					L.Add(M)
				L.Add("Cancel")
				var/mob/B=input("Who do you wish to invite to: [party_name]?")in L
				if(B=="Cancel"||!B||B.in_party||!in_party)return
				switch(alert("Do you want to invite [B] to: [party_name]?","","Invite","Cancel"))
					if("Cancel")return
					else
						switch(alert(B,"[usr] is inviting you to join: [party_name]. Do you accept?","","Join","No"))
							if("No")return
							else
								if(!usr||!in_party)return
								B.in_party=1
								B.party_leader=0
								B.party_member=1
								B.party_name=src.party_name
								B.verbs-=new/mob/PC/verb/Create_Party()
								B.verbs+=new/mob/PartyVerbs/verb/Party_Chat()
								B.verbs+=new/mob/PartyVerbs/verb/Party_Members()
								B.verbs+=new/mob/PartyVerbs/verb/Party_Leave()
								for(var/mob/N in world)if(N.party_name==party_name)N<<"<font color=lime>[party_name] Information:<font color=white> [usr] has invited [B]!"
								return
			Party_Members()
				set category="Party"
				if(spam_delay)return
				usr<<"<font color=lime>---------------<br><font color=white>[party_name] Members:"
				for(var/mob/C in world)if(C.party_name==party_name)usr<<"<font color=lime>Name: [C.name]"
				usr<<"<font color=lime>---------------<br>"
				spawn(40)if(usr)spam_delay=0
			Party_Leave()
				set category="Party"
				if(!in_party)return
				switch(alert("Do you want to leave: [party_name]?","","Yes","No"))
					if("No")return
					if("Yes")
						if(!in_party)return
						if(!party_leader)
							for(var/mob/M in world)if(M.party_name==party_name)M<<"<font color=lime>[party_name] Information:<font color=white> [usr] has left the party!"
							in_party=0
							party_leader=0
							party_member=0
							party_name=name
							verbs+=new/mob/PC/verb/Create_Party()
							verbs-=new/mob/PartyVerbs/verb/Party_Boot()
							verbs-=new/mob/PartyVerbs/verb/Party_Chat()
							verbs-=new/mob/PartyVerbs/verb/Party_Invite()
							verbs-=new/mob/PartyVerbs/verb/Party_Members()
							verbs-=new/mob/PartyVerbs/verb/Party_Leave()
							return
						else
							Parties.Remove(party_name)
							for(var/mob/M in world)
								if(M.party_name==party_name)
									M<<"<font color=lime>[party_name] Information:<font color=white> [usr], the leader, has left the party!"
									M.in_party=0
									M.party_leader=0
									M.party_member=0
									M.party_name=M.name
									M.verbs+=new/mob/PC/verb/Create_Party()
									M.verbs-=new/mob/PartyVerbs/verb/Party_Boot()
									M.verbs-=new/mob/PartyVerbs/verb/Party_Chat()
									M.verbs-=new/mob/PartyVerbs/verb/Party_Invite()
									M.verbs-=new/mob/PartyVerbs/verb/Party_Members()
									M.verbs-=new/mob/PartyVerbs/verb/Party_Leave()
							in_party=0
							party_leader=0
							party_member=0
							party_name=name
							verbs += new/mob/PC/verb/Create_Party()
							verbs -= new/mob/PartyVerbs/verb/Party_Boot()
							verbs -= new/mob/PartyVerbs/verb/Party_Chat()
							verbs -= new/mob/PartyVerbs/verb/Party_Invite()
							verbs -= new/mob/PartyVerbs/verb/Party_Members()
							verbs -= new/mob/PartyVerbs/verb/Party_Leave()
							return
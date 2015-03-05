var/polltotal=0
var/pollyes=0
var/pollno=0
var/poll=0
var/pollmsg=""
var/pollbox1=""
var/pollbox2=""
mob/var/voted=0
world/New()
	..()
	var/savefile/X=new("World Save Files/Poll.sav")
	X["total"]>>polltotal
	X["yes"]>>pollyes
	X["no"]>>pollno
	X["poll"]>>poll
	X["msg"]>>pollmsg
	X["pollbox1"]>>pollbox1
	X["pollbox2"]>>pollbox2
world/Del()
	var/savefile/X=new("World Save Files/Poll.sav")
	X["total"]<<polltotal
	X["yes"]<<pollyes
	X["no"]<<pollno
	X["poll"]<<poll
	X["msg"]<<pollmsg
	X["pollbox1"]<<pollbox1
	X["pollbox2"]<<pollbox2
	..()
mob/PC
	verb
		View_Poll()
			set category="Channels"
			if(poll)
				if(!voted)
					winset(usr,"poll.polltext","text=\"[pollmsg]\"")
					winset(usr,"poll","pos=10,10")
					winshow(usr,"poll",1)
				else usr<<"You have already voted!"
			else usr<<"There is currently no world poll activated."
		PollYes()
			set hidden=1
			if(poll)
				if(!voted)
					winset(usr,"poll.Epic1","is-disabled=true")
					switch(alert(usr,"Vote [pollbox1]? Are you sure?","Yes","Yes","No"))
						if("Yes")
							if(voted)return
							voted=1
							pollyes++
							winshow(usr,"poll",0)
						if("No")
							if(voted)return
							winset(usr,"poll.Epic1","is-disabled=false")
				else usr<<"You have already voted in this poll!"
			else usr<<"There is no world poll at the moment"
		PollNo()
			set hidden=1
			if(poll)
				if(!voted)
					winset(usr,"poll.Epic2","is-disabled=true")
					switch(alert(usr,"Vote [pollbox2]? Are you sure?","Yes","Yes","No"))
						if("Yes")
							if(voted)return
							voted=1
							pollno++
							winshow(usr,"poll",0)
						if("No")
							if(voted)return
							winset(usr,"poll.Epic2","is-disabled=false")
				else usr<<"You have already voted in this poll!"
			else usr<<"There is no world poll at the moment."
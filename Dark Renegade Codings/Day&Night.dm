/*
Outside Area Demo
By: Shadowdarke (shadowdarke@hotmail.com)
Sept. 6th, 2001

Outside Area Demo demonstrates how to implement day/night cycles two ways,
with overlays or with the luminosity variable. This demo also shows how to
change a turf from one area to another.

The area overlay day/night cycle is much faster than turf overlay day/night
systems, accomplishing the same effect with a couple lines of code and no
lag producing loops. I've tested it with maps as large as 500x500x5 with no
lag at all from the day/night cycle.*/


var/GM_Activated = 0
var/GM_Weather = 0
world
	area = /area/outside	// make outside the default area

	New()									// When the world begins
		..()								// do the regular things
		for(var/area/outside/O in world)	// Look for outside areas
			spawn() O.daycycle()			// begind the daycycle
			spawn(150) O.SetWeather()			// begin the weathercycle


area
	outside	// lay this area on the map anywhere you want it to change from night to day
		layer = 99998	// set this layer above everything else so the overlay obscures everything
		var
			lit = 1	// determines if the area is lit or dark.
			weather = 0


		proc
			daycycle()
				var/B25 = new/obj/darkness/night25
				var/B50 = new/obj/darkness/night50

				if(GM_Activated)
					return
				lit = 1 - lit	// toggle lit between 1 and 0
				if(lit)
					overlays += B25	// add a 25% dither for a fading effect
					sleep(3)	// pause a moment
					overlays -= B25	// remove the dither
					overlays += B50	// add the 50% dither
					B50:x = src.x
					B50:y = src.y
					B50:z = src.z
					spawn(36000) daycycle()
				else
					overlays -= B50	// remove the 50% dither
					overlays += B25	// add a 25% dither for a fading effect
					sleep(3)	// pause a moment
					overlays -= B25	// remove the dither
					spawn(72000) daycycle()	// change the 20 to make longer days and nights




/*	If you prefer real darkness (luminosity = 0), replace the daycycle() proc
	with the one below. Using luminosity for outside darkness is better if
	you want to use other light sources like torches.*/

			daycycle_2()
				luminosity = 1 - luminosity	// toggle between 1 and 0
				spawn(72000) daycycle()	// change the 20 to make longer days and nights


			SetWeather()
				var/W1 = new /obj/weather/snow
				var/W2 = new /obj/weather/rain
				if(GM_Weather)
					return
					if(prob(40))
						if(!weather)
							if(prob(50))
								for(var/area/outside/O in world)
									O.overlays -= W1
									O.overlays -= W2
									O.overlays += W1
									W1:x = O.x
									W1:y = O.y
									W1:z = O.z
									if(prob(10))
										world << "<font color=#3399cc>Weatherman: <font color=red>Looks like we have a one hundred percent chance of snow, with a little bit of cold to top it off!"
									else
										if(prob(10))
											world << "<font color=#3399cc>Weatherman: <font color=red>Snow... Wow, in the middle of.. Which month is this?"
										else
											if(prob(10))
												world << "<font color=#3399cc>Weatherman: <font color=red>Put on your Jackets, its Snowing! But if it was me, I'd be inside the warm Safe Zone, like I am now."
											else
												if(prob(10))
													world << "<font color=#3399cc>Weatherman: <font color=red>It's Snowing again folks, I think the weather Hates me.."
												else
													world << "<font color=#3399cc>Weatherman: <font color=red>More snow! I think I'll go outside this time *walks out* Wow its not that ba- *freezes*"
							else
								for(var/area/outside/O in world)
									O.overlays -= W1
									O.overlays -= W2
									O.overlays += W2
									W2:x = O.x
									W2:y = O.y
									W2:z = O.z
									if(prob(10))
										world << "<font color=#3399cc>Weatherman: <font color=red>Rain! Rain! Rain!"
									else
										if(prob(10))
											world << "<font color=#3399cc>Weatherman: <font color=red>More Rain! With a 100% chance of water!"
										else
											if(prob(10))
												world << "<font color=#3399cc>Weatherman: <font color=red>Wow Rain again! with a Flood warning till... what time does it say?"
											else
												if(prob(10))
													world << "<font color=#3399cc>Weatherman: <font color=red>At this rate the Game will bog down with water..."
												else
													world << "<font color=#3399cc>Weatherman: <font color=red>More rain! I think I'll go outside this time *walks out* Eh, just a light drizz- Ack! Flash Floo-! *Almost Drowns*"

							weather = 1
						else
							for(var/area/outside/O in world)
								O.overlays-=W1
								O.overlays-=W2
								if(prob(10))
									world << "<font color=#3399cc>Weatherman: <font color=red>100% Chance of some Sun! with a 10% chance of a Picnic!"
								else
									if(prob(10))
										world << "<font color=#3399cc>Weatherman: <font color=red>Ah, Sunny! A perfect time to go to the beach!"
									else
										if(prob(10))
											world << "<font color=#3399cc>Weatherman: <font color=red>More Sun! with a 90% chance of Tempatures reaching 80 degrees ferenheit today!"
										else
											if(prob(10))
												world << "<font color=#3399cc>Weatherman: <font color=red>Sunny! with a chance of D! Get it?"
											else
												world << "<font color=#3399cc>Weatherman: <font color=red>Even More good weather! The thermometer says 70 Degrees today! I think I'll go outside this time *walks out* Ah, Decent weather! *900 degrees* Wha- *Sizzle*"
								weather = 0
					else
						weather = 0
						for(var/area/outside/O in world)
							O.overlays-=W1
							O.overlays-=W2
							if(prob(10))
								world << "<font color=#3399cc>Weatherman: <font color=red>100% Chance of some Sun! with a 10% chance of a Picnic!"
							else
								if(prob(10))
									world << "<font color=#3399cc>Weatherman: <font color=red>Ah, Sunny! A perfect time to go to the beach!"
								else
									if(prob(10))
										world << "<font color=#3399cc>Weatherman: <font color=red>More Sun! with a slight chance of heat!"
									else
										if(prob(10))
											world << "<font color=#3399cc>Weatherman: <font color=red>Sunny! with a chance of D! Get it?"
										else
											world << "<font color=#3399cc>Weatherman: <font color=red>Even More good weather! The thermometer says 70 Degrees today! I think I'll go outside this time *walks out* Ah, Decent weather! *900 degrees* Wha- *Sizzle*"

					spawn(18000) SetWeather()






	inside	// a sample area not affected by the daycycle or weather
		luminosity = 1

obj
	weather
		layer = 99999	// weather appears over the darkness because I think it looks better that way

		rain
			icon = 'rain.dmi'

		snow
			icon = 'snow.dmi'

		storm
			icon = 'storm.dmi'
	darkness
		layer = 99997
		night25
			icon = 'black25.dmi'
		night50
			icon = 'black50.dmi'


mob
	proc
/*		GMdaycycle()
			var/B25 = new/obj/darkness/night25
			var/B50 = new/obj/darkness/night50
			for(var/area/outside/O in world)
				switch(input("Day or Night?") in list("Day","Night","Start Normal Cycle"))
					if("Day")
						O.lit = 1
						GM_Activated = 1
						O.overlays -= B50	// remove the 50% dither
						O.overlays += B25	// add a 25% dither for a fading effect
						sleep(3)	// pause a moment
						O.overlays -= B25	// remove the dither

					if("Night")
						O.lit = 0
						GM_Activated = 1
						O.overlays += B25	// add a 25% dither for a fading effect
						sleep(3)	// pause a moment
						O.overlays -= B25	// remove the dither
						O.overlays += B50	// add the 50% dither
						B50:x = O.x
						B50:y = O.y
						B50:z = O.z

					if("Start Normal Cycle")
						GM_Activated = 0
						spawn() O.daycycle()*/
		GMWeather()
			var/W1 = new /obj/weather/snow
			var/W2 = new /obj/weather/rain
			switch(input("Rain, Snow or Shine?") in list("Rain","Snow","Shine","Storm","Start Normal Cycle"))
				if("Rain")
					for(var/area/outside/O in world)
						O.overlays -= W1
						O.overlays -= W2
						O.overlays += W2
						W2:x = O.x
						W2:y = O.y
						W2:z = O.z
						GM_Weather = 1
						world << "<font color=#3399cc>Weather Information: <font color=blue>It just started pouring rain so stay indoors and keep dry!"

				if("Snow")
					for(var/area/outside/O in world)
						O.overlays -= W1
						O.overlays -= W2
						O.overlays += W1
						W1:x = O.x
						W1:y = O.y
						W1:z = O.z
						GM_Weather = 1
						world << "<font color=#3399cc>Weather Information: <font color=white>It just started to snow so start that fire!"

				if("Shine")
					for(var/area/outside/O in world)
						O.overlays -= W1
						O.overlays -= W2
						GM_Weather = 1
						world << "<font color=#3399cc>Weather Information: <font color=yellow>The Sun is shining, come out and enjoy the beauty!"

				if("Storm")
					for(var/area/outside/O in world)
						O.overlays -= W1
						O.overlays -= W2
						GM_Weather = 1
						world << "<font color=#3399cc>Weather Information: <font color=red>Theres a Storm coming! So go inside the SZ!!"

				if("Start Normal Cycle")
					for(var/area/outside/O in world)
						GM_Weather = 0
						spawn() O.SetWeather()
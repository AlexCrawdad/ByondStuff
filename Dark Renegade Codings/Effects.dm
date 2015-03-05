obj/BluePU/icon = 'BluePU.dmi'

obj/GreenPU/icon = 'GreenPU.dmi'

obj/OrangePU/icon = 'OrangePU.dmi'

obj/RedPU/icon = 'RedPU.dmi'

obj/YellowPU/icon = 'YellowPU.dmi'

obj/PurplePU/icon = 'PurplePU.dmi'


obj/fade
	layer = FADE_LAYER
	icon = 'Fade.dmi'
	icon_state = "0"
	screen_loc = "SOUTHWEST to NORTHEAST"

mob/proc/Fade ( rgb , unfade=yes , speed=0.1 , pause=1 )
	if( unfade == start_at ) goto unfade
	if( rgb ) for( var/obj/fade/f in client.screen ) f.icon += rgb
	for( var/i=0 to 5 )
		sleep( speed )
		for( var/obj/fade/f in client.screen ) f.icon_state="[i]"
	if( !unfade ) return
	sleep( pause )
	unfade
	if( rgb && unfade == start_at ) for( var/obj/fade/f in client.screen ) f.icon+=rgb
	for( var/i=0 to 5 )
		sleep( speed )
		for( var/obj/fade/f in client.screen ) f.icon_state="[5-i]"
	if( rgb || unfade == start_at ) for( var/obj/fade/f in client.screen ) f.icon = initial(f.icon)
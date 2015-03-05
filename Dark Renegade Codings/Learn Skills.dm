mob
	var
		learn_angryblast=0
		learn_lifedrain=0
		learn_freeze=0
		learn_burningstar=0
		learn_mouthblast=0
		learn_electricrain=0
		learn_ghost=0
		learn_omega_blast=0
		learn_flameshower=0
		learn_cellforms=0
		learn_starshower=0
		learn_masenko=0
		learn_dondonpa=0
		learn_explosive_wave=0
		learn_dimensionsword=0
		learn_distructodisk=0
		learn_kienzandisk=0
		learn_spiritball=0
		learn_aura=0
		learn_karmabomb=0
		learn_energyfield=0
		learn_angryexplosion=0
		learn_supernova=0
		learn_deathball=0
		learn_sauzerblade=0
		learn_finalexplosion=0
		learn_giganticmeteor=0
		learn_blastershell=0
		learn_rapidblast=0
		learn_blowup=0
		learn_flameblast=0
		learn_deathbeam=0
		learn_demonsword=0
		learn_universalscan=0
		learn_fusiondance=0
		learn_acidbomb=0
		learn_galacticdonut=0
		learn_demonshackle=0
		learn_imprisonmentball=0
		learn_powerup=0
		learn_fakemoon=0
		learn_enrage=0
		learn_sense=0
		learn_finalshine=0
		learn_bigbangattack=0
		learn_finalflash=0
		learn_galickgun=0
		learn_tribeam=0
		learn_solarflare=0
		learn_splitform=0
		learn_specialbeam=0
		learn_lightgrenade=0
		learn_zanzoken=0
		learn_dragonfist=0
		learn_afterimage=0
		learn_it=0
		learn_ssdeadlybomber=0
		learn_fly=0
		learn_hellzonegrenade=0
		learn_genocideattack
		learn_invertpower=0
		learn_deathwave=0
		learn_finishbuster=0
		learn_burningattack=0
		learn_absorb=0
		learn_kiabsorb=0
		learn_revengeball=0
		learn_kishower=0
		learn_sacrifice=0
		learn_adtrain=0
		learn_gravfield=0
		learn_buffpl=0
		learn_buffki=0
		learn_buffstr=0
		learn_buffdef=0
		learn_buffstam=0
		learn_explode=0
		learn_acidrain=0
		learn_replacement=0
		learn_dragonscan=0
		learn_stonespit=0
		learn_zapcannon=0
		learn_blazingblast=0
		learn_novablast=0
		learn_starbang=0
		learn_waterjetblast=0
		learn_godlyblast=0
		learn_phantomburning=0
		learn_soul_punisher=0
		learn_final_kamehameha=0
		learn_custom_attack=0
		learn_custom_attack2=0
		learn_custom_attack3=0
		learn_sonicspeed=0
		learn_senseanyone=0
		learn_bardockkame=0
		learn_ultrakame=0
		learn_superbardockkame=0
		learn_burningstorm=0
		learn_burningatack=0
		learn_tentimeskame=0
		learn_destructivewave=0
		learn_dimensionshatter=0
		learn_supercrusherball=0
		learn_wolffist=0
		learn_darkarc=0
		learn_electricball=0
		learn_energybomb=0
		learn_energyball=0
		learn_darkball=0
		learn_apocalypseball=0
		learn_canonblast=0
		learn_eonatack=0
		learn_bravecanon=0
		learn_deathcanon=0
		learn_destroyerkamehameha=0
		learn_finishball=0
		learn_fireball=0
		learn_firebeam=0
		learn_fireblast=0
		learn_flametornado=0
		learn_iceball=0
		learn_galacticbuster=0
		learn_supergalickgun=0
		learn_ultragalickgun=0
		learn_dragonfire=0
		learn_redball=0
		learn_hellimpact=0
		learn_horridianball=0
		learn_waterball=0
		learn_iceblast=0
		learn_justiceball=0
		learn_kicanon=0
		learn_killdriver=0
		learn_kikatalyst=0
		learn_ultrafireball=0
		learn_hellfire=0
		learn_spikeatack=0
		learn_rainball=0
		learn_kicatalyst=0
		learn_fireslayer=0
		learn_buuspike=0
		learn_neoball=0
		learn_firebird=0
		learn_planetblast=0
		learn_starblast=0
		learn_sunblast=0
		learn_supertriball=0
		learn_xball=0
		learn_blackhole=0
		learn_firewolf=0
		learn_dragonhole=0
		learn_ultimatedisk=0
		learn_nukeball=0
		learn_ultimatekameball=0
		learn_laserblast=0
		learn_boomerang=0
		learn_mysticobomb=0
		learn_iceslayer=0
		learn_soulpunisher=0
		learn_starbeam=0
		learn_sunball=0
		learn_superbeamray=0
		learn_ultimateblast=0
		learn_icekame=0
		learn_acidhail=0
		learn_firecut=0
		learn_ultradisk=0
		learn_dualfire=0
		learn_suneruptionblast=0
		learn_galacticblast=0
		learn_blastcanon=0
		learn_buublast=0
		learn_lightningbuster=0
		learn_buublitz=0
		learn_celticblitz=0
		learn_plasmacomet=0
		learn_plasmaslicer=0
		learn_plasmaball=0
		learn_finalbuster=0
		learn_furyblast=0
		learn_powerbind=0
		learn_crazygun=0
		learn_lightningrain=0
		learn_plasmagun=0
		learn_deathbomb=0
		learn_firebomb=0
		learn_powerbomb=0
		learn_flamespike=0
		learn_starball=0
		learn_windblast=0
		learn_lavablast=0
		learn_windslayer=0
		learn_waterslayer=0
		learn_finalbuu=0
		learn_starslayer=0
		learn_nuclearblast=0
		learn_it_block=0
		learn_firecomet=0
		CBM=0
	proc
		Skill_Gain()
			if(istype(src,/mob/PC))
/*				if(level>=11000)
					if(!learn_it_block)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> IT Block."
						contents+=new/obj/Technique/InstantTransmissionBlock
						learn_it_block=1*/
				if(race=="Bio-Warrior")
					if(level>=1000)
						if(!learn_invertpower&&!form_1)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Invert Power."
							contents+=new/obj/Technique/InvertPower
							learn_invertpower=1
					if(level >= 2000)
						if(!learn_acidbomb)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Acid Bomb."
							contents+=new/obj/Technique/AcidBomb
							learn_acidbomb=1
					if(level>=2500)
						if(!learn_masenko)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Masenko."
							contents+=new/obj/Technique/Masenko
							learn_masenko=1
					if(level>=3000)
						if(!learn_deathbeam)
							learn_deathbeam=1
							contents+=new/obj/Technique/DeathBeam
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Death Beam."
					if(level>=2000)
						if(!learn_stonespit)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Stone Spit."
							contents+=new/obj/Technique/StoneSpit
							learn_stonespit=1
					if(level>=3500)
						if(!learn_dragonfist)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dragon Fist."
							contents+=new/obj/Technique/DragonFist
							learn_dragonfist=1
				if(race=="Legendary Saiyan")
					if(level>=500)
						if(!learn_fakemoon)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fake Moon."
							contents+=new/obj/Technique/FakeMoon
							learn_fakemoon=1
					if(level>=750)
						if(!learn_galacticdonut)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Galactic Donut."
							contents+=new/obj/Technique/GalacticDonut
							learn_galacticdonut=1
					if(level>=1000)
						if(!learn_fusiondance)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fusion Dance."
							contents+=new/obj/Technique/FusionDance
							learn_fusiondance=1
					if(level>=2200)
						if(!learn_blastershell)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Blaster Shell."
							contents+=new/obj/Technique/BlasterShell
							learn_blastershell=1
					if(level>=2500)
						if(!learn_masenko)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Masenko."
							contents+=new/obj/Technique/Masenko
							learn_masenko=1
					if(level>=1200)
						if(!learn_finalexplosion)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Final Explosion."
							contents+=new/obj/Technique/FinalExplosion
							learn_finalexplosion=1
					if(level>=1800)
						if(!learn_giganticmeteor)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Gigantic Meteor."
							contents+=new/obj/Technique/GiganticMeteor
							learn_giganticmeteor=1
					if(src.level>=500)
						if(!src.learn_horridianball)
							src << "<center><font color = white> .:: You learn Horridian Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/HorridianBall
							src.learn_horridianball = 1
					if(src.level>=500)
						if(!src.learn_nukeball)
							src << "<center><font color = white> .:: You learn Nuke Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/NukeBall
							src.learn_nukeball = 1
					if(level>=1500)
						if(!learn_finalshine)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Shine Missile."
							contents+=new/obj/Technique/ShineMissile
							learn_finalshine=1
				if(race=="Galactic Warrior")
					if(level>=3500)
						if(!learn_finalshine)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Shine Missile."
							contents+=new/obj/Technique/ShineMissile
							learn_finalshine=1
					if(level>=750)
						if(!learn_masenko)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Masenko."
							contents+=new/obj/Technique/Masenko
							learn_masenko=1
					if(level>=1500)
						if(!learn_kishower)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Ki Shower."
							contents+=new/obj/Technique/KiShower
							learn_kishower=1
				if(race=="Android")
					if(level>=800)
						if(!learn_lifedrain)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Life Drain."
							contents+=new/obj/Technique/LifeAbsorb
							learn_lifedrain=1
					if(level>=250)
						if(!learn_universalscan)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Universal Scan."
							contents+=new/obj/Technique/UniversalScan
							learn_universalscan=1
					if(level>=250)
						if(!learn_dragonscan)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dragon Scan."
							contents+=new/obj/Technique/DragonScan
							learn_dragonscan=1
					if(level>=1000)
						if(!learn_invertpower&&!form_1)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Invert Power."
							contents+=new/obj/Technique/InvertPower
							learn_invertpower=1
					if(level>=1500)
						if(!learn_kishower)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Ki Shower."
							contents+=new/obj/Technique/KiShower
							learn_kishower=1
					if(src.gene_model17)
						if(src.level>=1000)
							if(!src.learn_suneruptionblast)
								src << "<center><font color = blue> .:: You learn Sun Eruption Blast  ::.</font></center></center>"
								src.contents += new/obj/Technique/SunEruptionBlast
								src.learn_suneruptionblast = 1
							if(level>=800)
								if(!learn_lifedrain)
									src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Life Drain."
									contents+=new/obj/Technique/LifeAbsorb
									learn_lifedrain=1
							if(level>=250)
								if(!learn_universalscan)
									src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Universal Scan."
									contents+=new/obj/Technique/UniversalScan
									learn_universalscan=1
							if(level>=250)
								if(!learn_dragonscan)
									src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dragon Scan."
									contents+=new/obj/Technique/DragonScan
									learn_dragonscan=1
							if(level>=1000)
								if(!learn_invertpower&&!form_1)
									src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Invert Power."
									contents+=new/obj/Technique/InvertPower
									learn_invertpower=1
							if(level>=1500)
								if(!learn_kishower)
									src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Ki Shower."
									contents+=new/obj/Technique/KiShower
									learn_kishower=1
							if(level>=1500)
								if(!learn_plasmaslicer)
									src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Plasma Slicer."
									contents+=new/obj/Technique/PlasmaSlicer
									learn_plasmaslicer=1
							if(level>=1500)
								if(!learn_plasmaball)
									src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Plasma Ball."
									contents+=new/obj/Technique/PlasmaBall
									learn_plasmaball=1
							if(level>=1500)
								if(!learn_plasmagun)
									src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Plasma Gun."
									contents+=new/obj/Technique/PlasmaGun
									learn_plasmagun=1
							if(level>=1500)
								if(!learn_starball)
									src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Star Ball."
									contents+=new/obj/Technique/StarBall
									learn_starball=1
							if(level>=1500)
								if(!learn_nuclearblast)
									src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Nuclear Blast."
									contents+=new/obj/Technique/NuclearBlast
									learn_nuclearblast=1
							if(src.gene_model13)
								if(src.level>=550)
									if(!src.learn_apocalypseball)
										src << "<center><font color = blue> .:: You learn Apocalypse Ball  ::.</font></center></center>"
										src.contents += new/obj/Technique/ApocalypseBall
										src.learn_apocalypseball = 1
								if(src.level>=750)
									if(!src.learn_spikeatack)
										src << "<center><font color = blue> .:: You learn Spike Atack  ::.</font></center></center>"
										src.contents += new/obj/Technique/SpikeAtack
										src.learn_spikeatack = 1
								if(src.level>=950)
									if(!src.learn_planetblast)
										src << "<center><font color = blue> .:: You learn Planet Blast  ::.</font></center></center>"
										src.contents += new/obj/Technique/PlanetBlast
										src.learn_planetblast = 1
								if(src.level>=1000)
									if(!src.learn_sunblast)
										src << "<center><font color = blue> .:: You learn Sun Blast  ::.</font></center></center>"
										src.contents += new/obj/Technique/SunBlast
										src.learn_sunblast = 1
								if(src.level>=1000)
									if(!src.learn_ultimatedisk)
										src << "<center><font color = blue> .:: You learn Ultimate Disk  ::.</font></center></center>"
										src.contents += new/obj/Technique/UltimateDisk
										src.learn_ultimatedisk = 1
								if(src.level>=1000)
									if(!src.learn_ultimateblast)
										src << "<center><font color = blue> .:: You learn Ultimate Blast  ::.</font></center></center>"
										src.contents += new/obj/Technique/UltimateBlast
										src.learn_ultimateblast = 1
								if(src.level>=1000)
									if(!src.learn_deathbomb)
										src << "<center><font color = blue> .:: You learn Death Bomb  ::.</font></center></center>"
										src.contents += new/obj/Technique/DeathBomb
										src.learn_deathbomb = 1
				if(race=="Saiyan")
					if(level>=500)
						if(!learn_fakemoon)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fake Moon."
							contents+=new/obj/Technique/FakeMoon
							learn_fakemoon=1
					if(level>=750)
						if(!learn_galacticdonut)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Galactic Donut."
							contents+=new/obj/Technique/GalacticDonut
							learn_galacticdonut=1
					if(level>=1000)
						if(!learn_fusiondance)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fusion Dance."
							contents+=new/obj/Technique/FusionDance
							learn_fusiondance=1
					if(level>=2200)
						if(legendary_chromosome&&!learn_blastershell)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Blaster Shell."
							contents+=new/obj/Technique/BlasterShell
							learn_blastershell=1
					if(level>=2200)
						if(legendary_chromosome&&!learn_galacticblast)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Galactic Blast."
							contents+=new/obj/Technique/GalacticBlast
							learn_galacticblast=1
					if(level>=2200)
						if(legendary_chromosome&&!learn_powerbind)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Power Bind."
							contents+=new/obj/Technique/PowerBind
							learn_powerbind=1
					if(level>=2500)
						if(!learn_masenko)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Masenko."
							contents+=new/obj/Technique/Masenko
							learn_masenko=1
					if(level>=1200)
						if(!learn_finalexplosion)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Final Explosion."
							contents+=new/obj/Technique/FinalExplosion
							learn_finalexplosion=1
					if(level>=1800)
						if(legendary_chromosome&&!learn_giganticmeteor)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Gigantic Meteor."
							contents+=new/obj/Technique/GiganticMeteor
							learn_giganticmeteor=1
					if(level>=1800)
						if(legendary_chromosome&&!learn_furyblast)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fury Blast."
							contents+=new/obj/Technique/FuryBlast
							learn_furyblast=1
					if(level>=1500)
						if(!learn_finalshine)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Shine Missile."
							contents+=new/obj/Technique/ShineMissile
							learn_finalshine=1
					if(src.level>=1000)
						if(!src.learn_tentimeskame)
							src << "<center><font color = white> .:: You learn Ten Times Kamehameha  ::.</font></center></center>"
							src.contents += new/obj/Technique/TenTimesKame
							src.learn_tentimeskame = 1
					if(src.level>=890)
						if(!src.learn_supergalickgun)
							src << "<center><font color = blue> .:: You learn Super Galick Gun  ::.</font></center></center>"
							src.contents += new/obj/Technique/SuperGalickGun
							src.learn_supergalickgun = 1
					if(src.level>=1000)
						if(!src.learn_ultragalickgun)
							src << "<center><font color = blue> .:: You learn Ultra Galick Gun  ::.</font></center></center>"
							src.contents += new/obj/Technique/UltraGalickGun
							src.learn_ultragalickgun = 1
				if(race=="Half Saiyan")
					if(level >= 500)
						if(!learn_fakemoon)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fake Moon."
							contents+=new/obj/Technique/FakeMoon
							learn_fakemoon=1
					if(level>=2500)
						if(!learn_dondonpa)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dodonpa."
							contents+=new/obj/Technique/Dodonpa
							learn_dondonpa=1
					if(level>=750)
						if(!learn_galacticdonut)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Galactic Donut."
							contents+=new/obj/Technique/GalacticDonut
							learn_galacticdonut=1
					if(level>=1000)
						if(!learn_fusiondance)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fusion Dance."
							contents+=new/obj/Technique/FusionDance
							learn_fusiondance=1
					if(level>=1200)
						if(!learn_finalexplosion)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Final Explosion."
							contents+=new/obj/Technique/FinalExplosion
							learn_finalexplosion=1
					if(level>=1500)
						if(!learn_finalshine)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Shine Missile."
							contents+=new/obj/Technique/ShineMissile
							learn_finalshine=1
					if(level>=2000)
						if(!learn_masenko)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Masenko."
							contents+=new/obj/Technique/Masenko
							learn_masenko=1
					if(src.gene_saint)
						if(src.level>=600)
							if(!src.learn_burningatack)
								src << "<center><font color = yellow> .:: You learn Burning Atack  ::.</font></center></center>"
								src.contents += new/obj/Technique/BurningAtack
								src.learn_burningatack = 1
						if(src.level>=700)
							if(!src.learn_ultrakame)
								src << "<center><font color = white> .:: You learn Ultra Kamehameha  ::.</font></center></center>"
								src.contents += new/obj/Technique/UltraKame
								src.learn_ultrakame = 1
						if(src.level>=600)
							if(!src.learn_burningatack)
								src << "<center><font color = yellow> .:: You learn Burning Atack  ::.</font></center></center>"
								src.contents += new/obj/Technique/BurningAtack
								src.learn_burningatack = 1
						if(src.level>=650)
							if(!src.learn_starblast)
								src << "<center><font color = white> .:: You learn Shine Missile  ::.</font></center></center>"
								src.contents += new/obj/Technique/StarBlast
								src.learn_starblast = 1
						if(src.level >= 1000)
							if(!src.learn_ultimatekameball)
								src << "<center><font color = white> .:: You learn Ultimate Kame Ball  ::.</font></center></center>"
								src.contents += new/obj/Technique/UltimateKameBall
								src.learn_ultimatekameball = 1
						if(src.level >= 950)
							if(!src.learn_mysticobomb)
								src << "<center><font color = white> .:: You learn Mystico Bomb  ::.</font></center></center>"
								src.contents += new/obj/Technique/MysticoBomb
								src.learn_mysticobomb = 1
						if(src.level >= 950)
							if(!src.learn_windslayer)
								src << "<center><font color = white> .:: You learn Wind Slayer  ::.</font></center></center>"
								src.contents += new/obj/Technique/WindSlayer
								src.learn_windslayer = 1
							if(src.gene_demonic)
								if(src.level>=2100)
									if(!src.learn_finalbuster)
										src << "<font color = #4682b4>Technique Aquired<font color = white>: Final Buster </font>"
										src.contents += new/obj/Technique/FinalBuster
										src.learn_finalbuster=1
								if(src.level>=2100)
									if(!src.learn_lightningrain)
										src << "<font color = #4682b4>Technique Aquired<font color = blue>: Lightning Rain </font>"
										src.contents += new/obj/Technique/LightningRain
										src.learn_lightningrain=1
								if(src.level>=1000)
									if(!src.learn_windblast)
										src << "<font color = #4682b4>Technique Aquired<font color = blue>: Wind Blast </font>"
										src.contents += new/obj/Technique/WindBlast
										src.learn_windblast=1
								if(src.level>=1000)
									if(!src.learn_lavablast)
										src << "<font color = #4682b4>Technique Aquired<font color = blue>: Lava Blast </font>"
										src.contents += new/obj/Technique/LavaBlast
										src.learn_lavablast=1
				if(race=="Changeling")
					if(level>=2500)
						if(!learn_kienzandisk)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Kienzan Disk."
							contents+=new/obj/Technique/KienzanDisk
							learn_kienzandisk=1
					if(level>=1250)
						if(!learn_imprisonmentball)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Imprisonment Ball."
							contents+=new/obj/Technique/ImprisonmentBall
							learn_imprisonmentball=1
					if(level>=2000)
						if(!learn_deathwave)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Death Wave."
							contents+=new/obj/Technique/DeathWave
							learn_deathwave=1
					if(level>=750)
						if(!learn_sauzerblade)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Sauzer Blade."
							contents+=new/obj/Technique/SauzerBlade
							learn_sauzerblade=1
					if(level>=1000)
						if(!learn_fusiondance)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fusion Dance."
							contents+=new/obj/Technique/FusionDance
							learn_fusiondance=1
					if(level>=3000)
						if(!learn_supernova)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Super Nova."
							contents+=new/obj/Technique/SuperNova
							learn_supernova=1
					if(level>=1500)
						if(!learn_kishower)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Ki Shower."
							contents+=new/obj/Technique/KiShower
							learn_kishower=1
					if(src.level>=750)
						if(!src.learn_killdriver)
							src << "<center><font color = white> .:: You learn Kill Driver  ::.</font></center></center>"
							src.contents += new/obj/Technique/KillDriver
							src.learn_killdriver=1
					if(src.level>=850)
						if(!src.learn_superbeamray)
							src << "<center><font color = white> .:: You learn Super Beam Ray  ::.</font></center></center>"
							src.contents += new/obj/Technique/SuperBeamRay
							src.learn_superbeamray=1
						if(!src.learn_blackhole)
							src << "<center><font color = red> .:: You learn Black Hole  ::.</font></center></center>"
							src.contents += new/obj/Technique/BlackHole
							src.learn_blackhole = 1
					if(src.level>=350)
						if(!src.learn_dragonhole)
							src << "<center><font color = red> .:: You learn Dragon Hole  ::.</font></center></center>"
							src.contents += new/obj/Technique/DragonHole
							src.learn_dragonhole = 1
					if(src.level>=350)
						if(!src.learn_ultradisk)
							src << "<center><font color = red> .:: You learn Ultra Disk  ::.</font></center></center>"
							src.contents += new/obj/Technique/UltraDisk
							src.learn_ultradisk = 1
				if(race=="Demon")
					if(level>=800)
						if(!learn_demonshackle)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Demon Shackle."
							contents+=new/obj/Technique/DemonShackle
							learn_demonshackle=1
					if(level>=1500)
						if(!learn_flameblast)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Hell Blaze."
							contents+=new/obj/Technique/FlameBlast
							learn_flameblast=1
					if(level>=2000)
						if(!learn_demonsword)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Demon Sword."
							contents+=new/obj/Technique/DemonSword
							learn_demonsword=1
					if(level>=2000)
						if(!learn_dimensionsword)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dimension Sword Attack."
							learn_dimensionsword=1
					if(level>=1000)
						if(!learn_fusiondance)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fusion Dance."
							contents+=new/obj/Technique/FusionDance
							learn_fusiondance=1
					if(level>=2000)
						if(!learn_flameblast)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Flame Shower."
							contents+=new/obj/Technique/FlameShower
							learn_kishower=1
					if(level>=2000)
						if(!learn_stonespit)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Stone Spit."
							contents+=new/obj/Technique/StoneSpit
							learn_stonespit=1
					if(src.level>=550)
						if(!src.learn_fireball)
							src << "<center><font color = red> .:: You learn Fire Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/FireBall
							src.learn_fireball=1
					if(src.level>=750)
						if(!src.learn_fireblast)
							src << "<center><font color = red> .:: You learn Fire Blast  ::.</font></center></center>"
							src.contents += new/obj/Technique/FireBlast
							src.learn_fireblast=1
					if(src.level>=850)
						if(!src.learn_firebeam)
							src << "<center><font color = red> .:: You learn Fire Beam::.</font></center></center>"
							src.contents += new/obj/Technique/FireBeam
							src.learn_firebeam=1
					if(src.level>=850)
						if(!src.learn_firecut)
							src << "<center><font color = red> .:: You learn Fire Cut::.</font></center></center>"
							src.contents += new/obj/Technique/FireCut
							src.learn_firecut=1
					if(src.gene_angelic)
						if(src.level>=850)
							if(!src.learn_dualfire)
								src << "<center><font color = red> .:: You learn Dual Fire::.</font></center></center>"
								src.contents += new/obj/Technique/DualFire
								src.learn_dualfire=1
						if(src.level>=850)
							if(!src.learn_waterslayer)
								src << "<center><font color = red> .:: You learn Water Slayer::.</font></center></center>"
								src.contents += new/obj/Technique/WaterSlayer
								src.learn_waterslayer=1
						if(src.gene_chaotic)
							if(src.level>=850)
								if(!src.learn_flamespike)
									src << "<center><font color = red> .:: You learn Flame Spike::.</font></center></center>"
									src.contents += new/obj/Technique/FlameSpike
									src.learn_flamespike=1
				if(race=="Majin")
					if(level>=1000)
						if(!learn_invertpower&&!form_1)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Invert Power."
							contents+=new/obj/Technique/InvertPower
							learn_invertpower=1
					if(level>=1500)
						if(!learn_genocideattack)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Genocide Attack."
							contents+=new/obj/Technique/GenocideAttack
							learn_genocideattack=1
					if(level>=2000)
						if(!learn_angryexplosion)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Angry Explosion."
							contents+=new/obj/Technique/AngryExplosion
							learn_angryexplosion=1
					if(src.level>=650)
						if(!src.learn_buuspike)
							src<<"<center><font color = white> .:: You learn Buu Spike  ::.</font></center></center>"
							src.contents += new/obj/Technique/BuuSpike
							src.learn_buuspike=1
					if(src.level>=650)
						if(!src.learn_buublast)
							src<<"<center><font color = white> .:: You learn Buu Blast  ::.</font></center></center>"
							src.contents += new/obj/Technique/BuuBlast
							src.learn_buublast=1
					if(src.level>=650)
						if(!src.learn_buublitz)
							src<<"<center><font color = white> .:: You learn Buu Blitz  ::.</font></center></center>"
							src.contents += new/obj/Technique/BuuBlitz
							src.learn_buublitz=1
					if(src.level>=650)
						if(!src.learn_crazygun)
							src<<"<center><font color = white> .:: You learn Crazy Gun  ::.</font></center></center>"
							src.contents += new/obj/Technique/CrazyGun
							src.learn_crazygun=1
					if(src.level>=650)
						if(!src.learn_finalbuu)
							src<<"<center><font color = white> .:: You learn Final Buu  ::.</font></center></center>"
							src.contents += new/obj/Technique/FinalBuu
							src.learn_finalbuu=1
				if(src.race=="Namekian")
					if(src.level>=400)
						if(!src.learn_invertpower&&!src.form_1)
							src << "<font color = #4682b4>Technique Aquired<font color = white>: Invert Power  </font>"
							src.contents += new/obj/Technique/InvertPower
							src.learn_invertpower=1
					if(src.gene_mystic)
						if(src.level>=100)
							if(!src.learn_sacrifice)
								src << "<font color = #4682b4>Technique Aquired<font color = white>: Sacrifice </font>"
								src.contents += new/obj/Technique/Sacrifice
								src.learn_sacrifice=1
						if(src.level>=200)
							if(!src.learn_adtrain)
								src << "<font color = #4682b4>Technique Aquired<font color = white>: Advanced Training </font>"
								src.contents += new/obj/Technique/AdvancedTraining
								src.learn_adtrain=1
						if(src.level>=300)
							if(!src.learn_gravfield)
								src << "<font color = #4682b4>Technique Aquired<font color = white>: Gravity Field </font>"
								src.contents += new/obj/Technique/GravityField
								src.learn_gravfield=1
						if(src.level>=400)
							if(!src.learn_buffdef)
								src << "<font color = #4682b4>Technique Aquired<font color = white>: Buff Defense </font>"
								src.contents += new/obj/Technique/BuffDefense
								src.learn_buffdef=1
						if(src.level>=450)
							if(!src.learn_buffstr)
								src << "<font color = #4682b4>Technique Aquired<font color = white>: Buff Strength </font>"
								src.contents += new/obj/Technique/BuffStrength
								src.learn_buffstr=1
						if(src.level>=500)
							if(!src.learn_buffki)
								src << "<font color = #4682b4>Technique Aquired<font color = white>: Buff Ki  </font>"
								src.contents += new/obj/Technique/BuffKi
								src.learn_buffki=1
						if(src.level>=500)
							if(!src.learn_fusiondance)
								src << "<font color = #4682b4>Technique Aquired<font color = white>: Fusion Dance  </font>"
								src.contents += new/obj/Technique/FusionDance
								src.learn_fusiondance = 1
						if(src.level>=550)
							if(!src.learn_buffpl)
								src << "<font color = #4682b4>Technique Aquired<font color = white>: Buff Powerlevel  </font>"
								src.contents += new/obj/Technique/BuffPowerlevel
								src.learn_buffpl=1
						if(src.level>=600)
							if(!src.learn_buffstam)
								src << "<font color = #4682b4>Technique Aquired<font color = white>: Buff Stamina  </font>"
								src.contents += new/obj/Technique/BuffStamina
								src.learn_buffstam=1
						if(src.level>=950)
							if(!src.learn_electricball)
								src<<"<center><font color = blue> .:: You learn Electric Ball  ::.</font></center></center>"
								src.contents += new/obj/Technique/ElectricBall
								src.learn_electricball=1
						if(src.level>=250)
							if(!src.learn_canonblast)
								src << "<center><font color = blue> .:: You learn Canon Blast  ::.</font></center></center>"
								src.contents += new/obj/Technique/CanonBlast
								src.learn_canonblast=1
						if(src.level>=250)
							if(!src.learn_bravecanon)
								src << "<center><font color = blue> .:: You learn Brave Canon  ::.</font></center></center>"
								src.contents += new/obj/Technique/BraveCanon
								src.learn_bravecanon=1
						if(src.level>=350)
							if(!src.learn_energybomb)
								src << "<center><font color = red> .:: You learn Energy Bomb  ::.</font></center></center>"
								src.contents += new/obj/Technique/EnergyBomb
								src.learn_energybomb = 1
						if(src.level>=350)
							if(!src.learn_energyball)
								src << "<center><font color = blue> .:: You learn Energy Ball  ::.</font></center></center>"
								src.contents += new/obj/Technique/EnergyBall
								src.learn_energyball = 1
						if(src.level>=350)
							if(!src.learn_kicatalyst)
								src << "<center><font color = red> .:: You learn Ki Catalyst  ::.</font></center></center>"
								src.contents += new/obj/Technique/KiCatalyst
								src.learn_kicatalyst = 1
						if(src.level>=350)
							if(!src.learn_ultrafireball)
								src << "<center><font color = red> .:: You learn Ultra Fire Ball  ::.</font></center></center>"
								src.contents += new/obj/Technique/UltraFireBall
								src.learn_ultrafireball = 1
						if(src.level>=350)
							if(!src.learn_lightningbuster)
								src << "<center><font color = red> .:: You learn Lightning Buster  ::.</font></center></center>"
								src.contents += new/obj/Technique/LightningBuster
								src.learn_lightningbuster = 1
							if(src.gene_mystic)
								if(src.level>=650)
									if(!src.learn_supertriball)
										src<<"<center><font color = blue> .:: You learn Super Tri Ball  ::.</font></center></center>"
										src.contents += new/obj/Technique/SuperTriBall
										src.learn_supertriball=1
								if(src.level>=250)
									if(!src.learn_eonatack)
										src << "<center><font color = blue> .:: You learn Eon Atack  ::.</font></center></center>"
										src.contents += new/obj/Technique/EonAtack
										src.learn_eonatack=1
								if(src.level>=250)
									if(!src.learn_deathcanon)
										src << "<center><font color = blue> .:: You learn Death Canon  ::.</font></center></center>"
										src.contents += new/obj/Technique/DeathCanon
										src.learn_deathcanon=1
								if(src.level>=350)
									if(!src.learn_ultrafireball)
										src << "<center><font color = red> .:: You learn Ultra Fire Ball  ::.</font></center></center>"
										src.contents += new/obj/Technique/UltraFireBall
										src.learn_ultrafireball = 1
								if(src.level>=350)
									if(!src.learn_kicatalyst)
										src << "<center><font color = red> .:: You learn Ki Catalyst  ::.</font></center></center>"
										src.contents += new/obj/Technique/KiCatalyst
										src.learn_kicatalyst = 1
								if(src.level>=350)
									if(!src.learn_blastcanon)
										src << "<center><font color = red> .:: You learn Blast Canon  ::.</font></center></center>"
										src.contents += new/obj/Technique/BlastCanon
										src.learn_blastcanon = 1
								if(src.level>=350)
									if(!src.learn_celticblitz)
										src << "<center><font color = green> .:: You learn Celtic Blitz  ::.</font></center></center>"
										src.contents += new/obj/Technique/CelticBlitz
										src.learn_celticblitz = 1
								if(src.level>=500)
									if(!src.learn_hellzonegrenade)
										src<<"<font color = #4682b4>Technique Aquired<font color = white>: Hell Zone Grenade  </font>"
										src.contents += new/obj/Technique/HellZoneGrenade
										src.learn_hellzonegrenade=1
								if(level>=750)
									if(!learn_masenko)
										src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Masenko."
										contents+=new/obj/Technique/Masenko
										learn_masenko=1
								if(src.level>=350)
									if(!src.learn_destructivewave)
										src<<"<center><font color = red> .:: You learn Destructive Wave  ::.</font></center></center>"
										src.contents += new/obj/Technique/DestructiveWave
										src.learn_destructivewave=1
				if(race=="Bio-Android")
					if(level>=2500)
						if(!learn_kienzandisk)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Kienzan Disk."
							contents+=new/obj/Technique/KienzanDisk
							learn_kienzandisk=1
					if(level>=1000)
						if(!learn_invertpower&&!form_1)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Invert Power."
							contents+=new/obj/Technique/InvertPower
							learn_invertpower=1
					if(level>=1750)
						if(!learn_energyfield)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Energy Field."
							contents+=new/obj/Technique/EnergyField
							learn_energyfield = 1
					if(level>=2000)
						if(!learn_kishower)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Ki Shower."
							contents+=new/obj/Technique/KiShower
							learn_kishower=1
					if(level>=1500)
						if(!learn_cellforms)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> to create cell jrs."
							contents+=new/obj/Technique/CreateCellJr
							learn_cellforms=1
					if(src.level>=850)
						if(!src.learn_galacticbuster)
							src << "<center><font color = white> .:: You learn Galactic Buster  ::.</font></center></center>"
							src.contents += new/obj/Technique/GalacticBuster
							src.learn_galacticbuster =1
					if(src.level>=750)
						if(!src.learn_neoball)
							src << "<center><font color = white> .:: You learn Neo Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/NeoBall
							src.learn_neoball =1
					if(src.level>=650)
						if(!src.learn_laserblast)
							src << "<center><font color = white> .:: You learn Laser Blast  ::.</font></center></center>"
							src.contents += new/obj/Technique/LaserBlast
							src.learn_laserblast =1
				if(race=="Tuffle")
					if(level>=1000)
						if(!learn_invertpower&&!form_1)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Invert Power."
							contents+=new/obj/Technique/InvertPower
							learn_invertpower=1
					if(level>=2000)
						if(!learn_kishower)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Ki Shower."
							contents+=new/obj/Technique/KiShower
							learn_kishower=1
					if(level>=3000)
						if(!learn_revengeball)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Revenge Ball."
							contents+=new/obj/Technique/RevengeDeathBall
							learn_revengeball=1
					if(src.level>=650)
						if(!src.learn_firebird)
							src << "<center><font color = white> .:: You learn Fire Bird  ::.</font></center></center>"
							src.contents += new/obj/Technique/FireBird
							src.learn_firebird=1
					if(src.level>=850)
						if(!src.learn_galacticbuster)
							src << "<center><font color = white> .:: You learn Galactic Buster  ::.</font></center></center>"
							src.contents += new/obj/Technique/GalacticBuster
							src.learn_galacticbuster =1
				if(src.race=="Dragon")
					if(level>=1000)
						if(!learn_invertpower&&!form_1)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Invert Power."
							contents+=new/obj/Technique/InvertPower
							learn_invertpower=1
					if(level>=3000)
						if(!learn_karmabomb)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Negative Karma Bomb."
							contents+=new/obj/Technique/KarmaBomb
							learn_karmabomb=1
					if(level>=1500)
						if(!learn_kishower)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Ki Shower."
							contents+=new/obj/Technique/KiShower
							learn_kishower=1
					if(src.level>=850)
						if(!src.learn_boomerang)
							src << "<center><font color = white> .:: You learn Boomerang  ::.</font></center></center>"
							src.contents += new/obj/Technique/Boomerang
							src.learn_boomerang=1
					if(src.level>=950)
						if(!src.learn_sunball)
							src << "<center><font color = white> .:: You learn Sun Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/SunBall
							src.learn_sunball=1
					if(src.gene_chaos)
						if(src.level>=950)
							if(!src.learn_sunball)
								src << "<center><font color = white> .:: You learn Sun Ball  ::.</font></center></center>"
								src.contents += new/obj/Technique/SunBall
								src.learn_sunball=1
						if(src.gene_holy)
							if(src.level>=950)
								if(!src.learn_starslayer)
									src << "<center><font color = white> .:: You learn Star Slayer  ::.</font></center></center>"
									src.contents += new/obj/Technique/StarSlayer
									src.learn_starslayer=1
				if(race=="Human")
					if(level>=1000)
						if(!learn_fusiondance)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fusion Dance."
							contents+=new/obj/Technique/FusionDance
							learn_fusiondance=1
					if(level>=2000)
						if(!learn_kishower)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Ki Shower."
							contents+=new/obj/Technique/KiShower
							learn_kishower=1
					if(level>=2500)
						if(!learn_dondonpa)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dondonpa."
							contents+=new/obj/Technique/Dodonpa
							learn_dondonpa=1
					if(src.level>=650)
						if(!src.learn_finishball)
							src << "<center><font color = white> .:: You learn Finish Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/FinishBall
							src.learn_finishball=1
					if(src.level>=750)
						if(!src.learn_wolffist)
							src << "<center><font color = yellow> .:: You learn Wolf Fist  ::.</font></center></center>"
							src.contents += new/obj/Technique/WolfFist
							src.learn_wolffist=1
					if(src.level>=850)
						if(!src.learn_firewolf)
							src << "<center><font color = yellow> .:: You learn Fire Wolf  ::.</font></center></center>"
							src.contents += new/obj/Technique/FireWolf
							src.learn_firewolf=1
				if(race=="Saibaman")
					if(level>=2000)
						if(!learn_acidbomb)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Acid Bomb."
							contents+=new/obj/Technique/AcidBomb
							learn_acidbomb=1
					if(level>=1200)
						if(!learn_blowup)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Blow Up."
							contents+=new/obj/Technique/BlowUp
							learn_blowup=1
					if(level>=1450)
						if(!learn_acidrain)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Acid Rain."
							contents+=new/obj/Technique/AcidRain
							learn_acidrain=1
					if(level>=1000)
						if(!learn_fusiondance)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fusion Dance."
							contents+=new/obj/Technique/FusionDance
							learn_fusiondance=1
					if(src.level >= 350)
						if(!src.learn_acidhail)
							src << "<center><font color = white> .:: You learn Acid Hail  ::.</font></center></center>"
							src.contents += new/obj/Technique/AcidHail
							src.learn_acidhail = 1
				if(race=="Konat")
					if(level>=1000)
						if(!learn_invertpower&&!form_1)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Invert Power."
							contents += new/obj/Technique/InvertPower
							learn_invertpower=1
					if(level>=1500)
						if(!learn_kishower)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Ki Shower."
							contents+=new/obj/Technique/KiShower
							learn_kishower=1
					if(level>=2500)
						if(!learn_dondonpa)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dodonpa."
							contents+=new/obj/Technique/Dodonpa
							learn_dondonpa=1
					if(src.level>=250)
						if(!src.learn_canonblast)
							src << "<center><font color = blue> .:: You learn Canon Blast  ::.</font></center></center>"
							src.contents += new/obj/Technique/CanonBlast
							src.learn_canonblast=1
					if(src.level>=250)
						if(!src.learn_eonatack)
							src << "<center><font color = blue> .:: You learn Eon Atack  ::.</font></center></center>"
							src.contents += new/obj/Technique/EonAtack
							src.learn_eonatack=1
					if(src.level>=250)
						if(!src.learn_bravecanon)
							src << "<center><font color = blue> .:: You learn Brave Canon  ::.</font></center></center>"
							src.contents += new/obj/Technique/BraveCanon
							src.learn_bravecanon=1
					if(src.level>=250)
						if(!src.learn_deathcanon)
							src << "<center><font color = blue> .:: You learn Death Canon  ::.</font></center></center>"
							src.contents += new/obj/Technique/DeathCanon
							src.learn_deathcanon=1
				if(race=="Kai")
					if(level>=2500)
						if(!learn_dondonpa)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dodonpa."
							contents+=new/obj/Technique/Dodonpa
							learn_dondonpa=1
					if(level>=1500)
						if(!learn_sacrifice)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Sacrifice."
							contents+=new/obj/Technique/Sacrifice
							learn_sacrifice=1
					if(level>=1000)
						if(!learn_fusiondance)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fusion Dance."
							contents+=new/obj/Technique/FusionDance
							learn_fusiondance=1
					if(level>=2000)
						if(!learn_adtrain)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Advanced Training."
							contents+=new/obj/Technique/AdvancedTraining
							learn_adtrain=1
					if(level>=1300)
						if(!learn_gravfield)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Gravity Field."
							contents+=new/obj/Technique/GravityField
							learn_gravfield=1
					if(level>=1400)
						if(!learn_buffdef)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Buff Defense."
							contents+=new/obj/Technique/BuffDefense
							learn_buffdef=1
					if(level>=1450)
						if(!learn_buffstr)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Buff Strength."
							contents+=new/obj/Technique/BuffStrength
							learn_buffstr=1
					if(level>=1500)
						if(!learn_buffki)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Buff Ki."
							contents+=new/obj/Technique/BuffKi
							learn_buffki=1
					if(level>=1000)
						if(!learn_fusiondance)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Fusion Dance."
							contents+=new/obj/Technique/FusionDance
							learn_fusiondance=1
					if(level>=1550)
						if(!learn_buffpl)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Buff Powerlevel."
							contents+=new/obj/Technique/BuffPowerlevel
							learn_buffpl=1
					if(level>=1600)
						if(!learn_buffstam)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Buff Stamina."
							contents+=new/obj/Technique/BuffStamina
							learn_buffstam=1
				if(race=="Ultimate Hybrid")
					if(level>=2000)
						if(!learn_kishower)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Ki Shower."
							contents+=new/obj/Technique/KiShower
							learn_kishower=1
					if(level>=2000)
						if(!learn_stonespit)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Stone Spit."
							contents+=new/obj/Technique/StoneSpit
							learn_stonespit=1
					if(level>=2500)
						if(!learn_dondonpa)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dodonpa."
							contents+=new/obj/Technique/Dodonpa
							learn_dondonpa=1
					if(level>=2500)
						if(!learn_masenko)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Masenko."
							contents+=new/obj/Technique/Masenko
							learn_masenko=1
					if(level>=1000)
						if(!learn_invertpower&&!form_1)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Invert Power."
							contents+=new/obj/Technique/InvertPower
							learn_invertpower=1
					if(src.level >= 350)
						if(!src.learn_burningstorm)
							src << "<center><font color = red> .:: You learn Burning Storm  ::.</font></center></center>"
							src.contents += new/obj/Technique/BurningStorm
							src.learn_burningstorm = 1
					if(src.level >= 460)
						if(!src.learn_xball)
							src << "<center><font color = red> .:: You learn X-Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/XBall
							src.learn_xball = 1
					if(src.level >= 1000)
						if(!src.learn_soulpunisher)
							src << "<center><font color = red> .:: You learn Soul Punisher  ::.</font></center></center>"
							src.contents += new/obj/Technique/SoulPunisher
							src.learn_soulpunisher = 1
				if(race=="Makyo")
					if(level>=1500)
						if(!learn_starshower)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Star Shower."
							contents+=new/obj/Technique/StarShower
							learn_starshower=1
					if(level>=800)
						if(!learn_starbang)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Star Bang."
							contents+=new/obj/Technique/StarBang
							learn_starbang=1
				if(src.race=="Bardock")
					if(src.level >= 120)
						if(!src.learn_bardockkame)
							src << "<center><font color = white> .:: You learn Kamehameha  ::.</font></center></center>"
							src.contents += new/obj/Technique/BardockKame
							src.learn_bardockkame = 1
					if(src.level >= 120)
						if(!src.learn_superbardockkame)
							src << "<center><font color = blue> .:: You learn Super Kamehameha  ::.</font></center></center>"
							src.contents += new/obj/Technique/SuperBardockKame
							src.learn_superbardockkame = 1
					if(src.level>=1000)
						if(!src.learn_tentimeskame)
							src << "<center><font color = white> .:: You learn Ten Times Kamehameha  ::.</font></center></center>"
							src.contents += new/obj/Technique/TenTimesKame
							src.learn_tentimeskame = 1
					if(src.level>=890)
						if(!src.learn_supergalickgun)
							src << "<center><font color = blue> .:: You learn Super Galick Gun  ::.</font></center></center>"
							src.contents += new/obj/Technique/SuperGalickGun
							src.learn_supergalickgun = 1
				if(src.race=="Uubub")
					if(src.level >= 900)
						if(!src.learn_icekame)
							src << "<center><font color = white> .:: You learn Ice Kamehameha  ::.</font></center></center>"
							src.contents += new/obj/Technique/IceKame
							src.learn_icekame = 1
					if(src.level >= 1000)
						if(!src.learn_iceslayer)
							src << "<center><font color = white> .:: You learn Ice Slayer  ::.</font></center></center>"
							src.contents += new/obj/Technique/IceSlayer
							src.learn_iceslayer = 1
					if(src.level>=250)
						if(!src.learn_bravecanon)
							src << "<center><font color = blue> .:: You learn Brave Canon  ::.</font></center></center>"
							src.contents += new/obj/Technique/BraveCanon
							src.learn_bravecanon=1
					if(src.level>=250)
						if(!src.learn_deathcanon)
							src << "<center><font color = blue> .:: You learn Death Canon  ::.</font></center></center>"
							src.contents += new/obj/Technique/DeathCanon
							src.learn_deathcanon=1
				if(src.race=="Legendary")
					if(src.level>=350)
						if(!src.learn_blastershell)
							src << "<center><font color = white> .:: You learn Blaster Shell  ::.</font></center></center>"
							src.contents += new/obj/Technique/BlasterShell
							src.learn_blastershell = 1
					if(src.level>=500)
						if(!src.learn_giganticmeteor)
							src << "<center><font color = white> .:: You learn Gigantic Meteor  ::.</font></center></center>"
							src.contents += new/obj/Technique/GiganticMeteor
							src.learn_giganticmeteor = 1
					if(src.level>=500)
						if(!src.learn_horridianball)
							src << "<center><font color = white> .:: You learn Horridian Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/HorridianBall
							src.learn_horridianball = 1
					if(src.level>=500)
						if(!src.learn_nukeball)
							src << "<center><font color = white> .:: You learn Nuke Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/NukeBall
							src.learn_nukeball = 1
				if(src.race=="Janemba")
					if(src.level>=350)
						if(!src.learn_dimensionshatter)
							src << "<center><font color = yellow> .:: You learn Dimension Shatter  ::.</font></center></center>"
							src.contents += new/obj/Technique/DimensionShatter
							src.learn_dimensionshatter = 1
					if(src.level>=350)
						if(!src.learn_hellimpact)
							src << "<center><font color = yellow> .:: You learn Hell Impact  ::.</font></center></center>"
							src.contents += new/obj/Technique/HellImpact
							src.learn_hellimpact = 1
				if(src.race=="Bojack")
					if(src.level>=350)
						if(!src.learn_supercrusherball)
							src << "<center><font color = green> .:: You learn Super Crusher Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/SuperCrusherBall
							src.learn_supercrusherball = 1
					if(src.level>=350)
						if(!src.learn_dragonfire)
							src << "<center><font color = red> .:: You learn Dragon Fire  ::.</font></center></center>"
							src.contents += new/obj/Technique/DragonFire
							src.learn_dragonfire = 1
					if(src.level>=350)
						if(!src.learn_fireslayer)
							src << "<center><font color = red> .:: You learn Fire Slayer  ::.</font></center></center>"
							src.contents += new/obj/Technique/FireSlayer
							src.learn_fireslayer = 1
				if(src.race=="Babidi")
					if(src.level>=350)
						if(!src.learn_darkarc)
							src << "<center><font color = red> .:: You learn Dark Arc  ::.</font></center></center>"
							src.contents += new/obj/Technique/DarkArc
							src.learn_darkarc = 1
					if(src.level>=350)
						if(!src.learn_rainball)
							src << "<center><font color = red> .:: You learn Rain Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/RainBall
							src.learn_rainball = 1
					if(src.level>=350)
						if(!src.learn_hellfire)
							src << "<center><font color = red> .:: You learn Hell Fire  ::.</font></center></center>"
							src.contents += new/obj/Technique/HellFire
							src.learn_hellfire = 1
				if(src.race=="DarkNamek")
					if(src.level>=350)
						if(!src.learn_energybomb)
							src << "<center><font color = red> .:: You learn Energy Bomb  ::.</font></center></center>"
							src.contents += new/obj/Technique/EnergyBomb
							src.learn_energybomb = 1
					if(src.level>=350)
						if(!src.learn_energyball)
							src << "<center><font color = blue> .:: You learn Energy Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/EnergyBall
							src.learn_energyball = 1
					if(src.level>=350)
						if(!src.learn_kicatalyst)
							src << "<center><font color = red> .:: You learn Ki Catalyst  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiCatalyst
							src.learn_kicatalyst = 1
					if(src.level>=350)
						if(!src.learn_ultrafireball)
							src << "<center><font color = red> .:: You learn Ultra Fire Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/UltraFireBall
							src.learn_ultrafireball = 1
				if(src.race=="DarkAngel")
					if(src.level>=350)
						if(!src.learn_darkball)
							src << "<center><font color = red> .:: You learn Dark Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/DarkBall
							src.learn_darkball = 1
					if(src.level>=350)
						if(!src.learn_redball)
							src << "<center><font color = red> .:: You learn Red Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/RedBall
							src.learn_redball = 1
					if(src.level>=350)
						if(!src.learn_justiceball)
							src << "<center><font color = red> .:: You learn Justice Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/JusticeBall
							src.learn_justiceball = 1
					if(src.level>=350)
						if(!src.learn_starbeam)
							src << "<center><font color = red> .:: You learn Star Beam  ::.</font></center></center>"
							src.contents += new/obj/Technique/StarBeam
							src.learn_starbeam = 1
				if(src.race=="Tenrai")
					if(src.level>=350)
						if(!src.learn_flametornado)
							src << "<center><font color = red> .:: You learn Flame Tornado  ::.</font></center></center>"
							src.contents += new/obj/Technique/FlameTornado
							src.learn_flametornado = 1
					if(src.level>=350)
						if(!src.learn_iceball)
							src << "<center><font color = red> .:: You learn Ice Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/IceBall
							src.learn_iceball = 1
					if(src.level>=350)
						if(!src.learn_iceblast)
							src << "<center><font color = red> .:: You learn Ice Blast  ::.</font></center></center>"
							src.contents += new/obj/Technique/IceBlast
							src.learn_iceblast = 1
					if(src.level>=350)
						if(!src.learn_waterball)
							src << "<center><font color = red> .:: You learn Water Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/WaterBall
							src.learn_waterball = 1
				if(src.race=="Cooler")
					if(src.level>=350)
						if(!src.learn_blackhole)
							src << "<center><font color = red> .:: You learn Black Hole  ::.</font></center></center>"
							src.contents += new/obj/Technique/BlackHole
							src.learn_blackhole = 1
					if(src.level>=350)
						if(!src.learn_dragonhole)
							src << "<center><font color = red> .:: You learn Dragon Hole  ::.</font></center></center>"
							src.contents += new/obj/Technique/DragonHole
							src.learn_dragonhole = 1
						if(!src.learn_supernova)
							src << "<center><font color = white> .:: You learn Super Nova  ::.</font></center></center>"
							src.contents += new/obj/Technique/SuperNova
							src.learn_supernova=1
					if(src.level>=450)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
					if(src.level>=150)
						if(!src.learn_imprisonmentball)
							src << "<center><font color = white> .:: You learn Imprisonment Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/ImprisonmentBall
							src.learn_imprisonmentball = 1
						if(!src.learn_deathwave)
							src << "<center><font color = white> .:: You learn Death Wave  ::.</font></center></center>"
							src.contents += new/obj/Technique/DeathWave
							src.learn_deathwave = 1
					if(src.level>=300)
						if(!src.learn_sauzerblade)
							src << "<center><font color = white> .:: You learn Sauzer Blade  ::.</font></center></center>"
							src.contents += new/obj/Technique/SauzerBlade
							src.learn_sauzerblade = 1
				if(level>=25)
					if(!learn_sense)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Sense."
						contents+=new/obj/Technique/Sense
						learn_sense=1
				if(level>=250)
					if(!learn_senseanyone)
						learn_senseanyone=1
						contents+=new/obj/Technique/SenseAnyone
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> to Sense Anyone."
				if(level>=50)
					if(!learn_aura)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> to create an aura."
						learn_aura=1
						src << "<font color = yellow>Please Select your Aura color!</font>"
						var/icon/D = new('Aura.dmi')
						var/new_rgb = F_Color_Selector.Get_Color(usr)
						D.Blend(new_rgb)
						usr.aura = D
						spawn(500)src.underlays += src.aura
						contents+=new/obj/Technique/Aura
				if(level>=75)
					if(!learn_fly)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> to fly."
						contents+=new/obj/Technique/Fly
						learn_fly=1
				if(level>=200)
					if(!learn_enrage)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> to Unleash your Rage."
						contents+=new/obj/Technique/UnleashRage
						learn_enrage=1
				if(level>=100)
					if(!learn_powerup)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Power Up."
						contents+=new/obj/Technique/PowerUp
						learn_powerup=1
				if(level>=750)
					if(!learn_it)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Instant Transmission."
						contents+=new/obj/Technique/InstantTransmission
						learn_it=1
				if(level>=2250)
					if(!learn_electricrain)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Electric Rain."
						contents+=new/obj/Technique/ElectricRain
						learn_electricrain=1
				if(level>=6000)
					if(!learn_explosive_wave)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Explosive Wave."
						contents+=new/obj/Technique/ExplosiveWave
						learn_explosive_wave=1
				if(level>=700)
					if(!learn_custom_attack)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Custom Attack."
						contents+=new/obj/Technique/CustomAttack
						learn_custom_attack=1
				if(level>=1000)
					if(!learn_custom_attack2)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Custom Attack 2."
						contents+=new/obj/Technique/CustomAttack2
						learn_custom_attack2=1
				if(level>=1500)
					if(!learn_custom_attack3)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Custom Attack 3."
						contents+=new/obj/Technique/CustomAttack3
						learn_custom_attack3=1
				if(level>=500)
					if(!pk)
						pk=1
						world<<"<font color=red><u>Training Information:</u></font> [src] has now become a permanent <font color=red>combatant</font>."
						sleep(10)
						src<<"[src], now that you're a permanent combatant, if you wish to level up fast, buy a <u>EXP</u> shard or go and train in <u>HBTC</u>, which is located north-east of Earth."
						sleep(20)
						src<<"[src], thank you for playing <u><font color=#8B0000>[shortname]</font></u>, the best Place to Play! We hope you enjoy your stay!"
				if(race!="Kai")
					if(level>=1500)
						if(!learn_rapidblast)
							src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Rapid ."
							contents+=new/obj/Technique/RapidBlast
							learn_rapidblast=1
				if(level>=1500)
					if(!learn_sonicspeed)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Sonic Speed."
						contents+=new/obj/Technique/SonicSpeed
						learn_sonicspeed=1
				if(level>=3500)
					if(!learn_phantomburning)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Phantom Burning Attack."
						contents+=new/obj/Technique/PhantomBurning
						learn_phantomburning=1
				if(level>=2000)
					if(!learn_waterjetblast)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Water Jet Blast."
						contents+=new/obj/Technique/WaterJetBlast
						learn_waterjetblast=1
				if(level>=1000)
					if(!learn_zapcannon)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Zap Cannon."
						contents+=new/obj/Technique/ZapCannon
						learn_zapcannon=1
				if(level>=2500)
					if(!learn_novablast)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Nova Wave Blast."
						contents+=new/obj/Technique/NovaHeatBlast
						learn_novablast=1
				if(level>=5000)
					if(!learn_omega_blast)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Omega Blast."
						contents+=new/obj/Technique/OmegaBlast
						learn_omega_blast=1
				if(level>=7000)
					if(!learn_godlyblast)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Godly Blast."
						contents+=new/obj/Technique/GodlyHolyBlast
						learn_godlyblast=1
				if(level>=8000)
					if(!learn_burningstar)
						src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Burning Star."
						contents+=new/obj/Technique/BurningStar
						learn_burningstar=1
mob
	proc
		AbsorbTechs(var/mob/PC/M)
			if(!learn_masenko&&M.learn_masenko)
				contents+=new/obj/Technique/Masenko
				learn_masenko=1
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Masenko."
				return
			if(!learn_dondonpa&&M.learn_dondonpa)
				contents+=new/obj/Technique/Dodonpa
				learn_dondonpa=1
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dodonpa."
				return
			if(!learn_stonespit&&M.learn_stonespit)
				contents+=new/obj/Technique/StoneSpit
				learn_stonespit=1
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Stone Spit."
				return
			if(!learn_supernova&&M.learn_supernova)
				contents+=new/obj/Technique/SuperNova
				learn_supernova=1
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Super Nova."
				return
			if(!learn_galacticdonut&&M.learn_galacticdonut)
				contents+=new/obj/Technique/GalacticDonut
				learn_galacticdonut=1
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Galactic Donut."
				return
			if(!learn_dragonfist&&M.learn_dragonfist)
				learn_dragonfist=1
				contents+=new/obj/Technique/DragonFist
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Dragon Fist."
				return
			if(!learn_afterimage&&M.learn_afterimage)
				learn_afterimage=1
				contents+=new/obj/Technique/AfterImage
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> After Image."
				return
			if(!learn_specialbeam&&M.learn_specialbeam)
				learn_specialbeam=1
				contents+=new/obj/Technique/SpecialBeamCannon
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Special Beam Cannon."
				return
			if(!learn_finalflash&&M.learn_finalflash)
				learn_finalflash=1
				contents+=new/obj/Technique/FinalFlash
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Final Flash."
				return
			if(!learn_finishbuster&&M.learn_finishbuster)
				learn_finishbuster=1
				contents+=new/obj/Technique/FinishBuster
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Finish Buster."
				return
			if(!learn_galickgun&&M.learn_galickgun)
				learn_galickgun=1
				contents+=new/obj/Technique/GalickGun
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Galick Gun."
				return
			if(!learn_deathbeam&&M.learn_deathbeam)
				learn_deathbeam=1
				contents+=new/obj/Technique/DeathBeam
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Death Beam."
				return
			if(!learn_tribeam&&M.learn_tribeam)
				learn_tribeam=1
				contents+=new/obj/Technique/TriBeam
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Tri Beam."
				return
			if(!learn_hellzonegrenade&&M.learn_hellzonegrenade)
				learn_hellzonegrenade=1
				contents+=new/obj/Technique/HellZoneGrenade
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> HellZone Grenade."
				return
			if(!learn_genocideattack&&M.learn_genocideattack)
				learn_genocideattack=1
				contents+=new/obj/Technique/GenocideAttack
				src<<"<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Genocide Attack."
				return
			return
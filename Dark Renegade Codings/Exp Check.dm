mob/var/z_rank = "Zenni Starter"
mob/proc/Exp_Check()

	if(src.rank == "<FONT COLOR=#ff0000>N</FONT><FONT COLOR=#8b0000>u</FONT><FONT COLOR=#c60000>b</FONT><FONT COLOR=#ff0000>c</FONT><FONT COLOR=#c60000>a</FONT><FONT COLOR=#8b0000>k</FONT><FONT COLOR=#ff0000>e</FONT></FONT>")
		if(src.level >= (100*EXPrebirthgain))
			src.rank = "<FONT COLOR=#0000ff>N</FONT><FONT COLOR=#00008b>o</FONT><FONT COLOR=#6a5acd>o</FONT><FONT COLOR=#00008b>b</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Noob!</font>"
			src.tnl += 200
			src.tp += 50
			src.zenni += 5000
			src << "<font color = #ffa500>You gain 50 Training Points and 5-thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#0000ff>N</FONT><FONT COLOR=#00008b>o</FONT><FONT COLOR=#6a5acd>o</FONT><FONT COLOR=#00008b>b</FONT></FONT>")
		if(src.level >= (500*EXPrebirthgain))
			src.rank = "<FONT COLOR=#008000>S</FONT><FONT COLOR=#57c018>u</FONT><FONT COLOR=#adff2f>p</FONT><FONT COLOR=#d7ff18>e</FONT><FONT COLOR=#ffff00>r</FONT><FONT COLOR=#e4ff10> </FONT><FONT COLOR=#c9ff20>N</FONT><FONT COLOR=#adff2f>o</FONT><FONT COLOR=#57c018>o</FONT><FONT COLOR=#008000>b</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Super Noob!</font>"
			src.tnl += 200
			src.tp += 50
			src.zenni += 10000
			src << "<font color = #ffa500>You gain 50 Training Points and 10-thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#008000>S</FONT><FONT COLOR=#57c018>u</FONT><FONT COLOR=#adff2f>p</FONT><FONT COLOR=#d7ff18>e</FONT><FONT COLOR=#ffff00>r</FONT><FONT COLOR=#e4ff10> </FONT><FONT COLOR=#c9ff20>N</FONT><FONT COLOR=#adff2f>o</FONT><FONT COLOR=#57c018>o</FONT><FONT COLOR=#008000>b</FONT></FONT>")
		if(src.level >= 1000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#8b0000>F</FONT><FONT COLOR=#a80000>u</FONT><FONT COLOR=#c60000>l</FONT><FONT COLOR=#e30000>l</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#ff4000>F</FONT><FONT COLOR=#ff8000>l</FONT><FONT COLOR=#ffc000>e</FONT><FONT COLOR=#ffff00>d</FONT><FONT COLOR=#ffc000>g</FONT><FONT COLOR=#ff8000>e</FONT><FONT COLOR=#ff4000>d</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#e30000>N</FONT><FONT COLOR=#c60000>o</FONT><FONT COLOR=#a80000>o</FONT><FONT COLOR=#8b0000>b</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Full Fledged Noob!</font>"
			src.tnl += 500
			src.tp += 100
			src.zenni += 20000
			src << "<font color = #ffa500>You gain 100 Training Points and 20-thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#8b0000>F</FONT><FONT COLOR=#a80000>u</FONT><FONT COLOR=#c60000>l</FONT><FONT COLOR=#e30000>l</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#ff4000>F</FONT><FONT COLOR=#ff8000>l</FONT><FONT COLOR=#ffc000>e</FONT><FONT COLOR=#ffff00>d</FONT><FONT COLOR=#ffc000>g</FONT><FONT COLOR=#ff8000>e</FONT><FONT COLOR=#ff4000>d</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#e30000>N</FONT><FONT COLOR=#c60000>o</FONT><FONT COLOR=#a80000>o</FONT><FONT COLOR=#8b0000>b</FONT></FONT>")
		if(level>=2000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#b8860b>T</FONT><FONT COLOR=#ffff00>h</FONT><FONT COLOR=#ffff00>e</FONT><FONT COLOR=#ffff00> </FONT><FONT COLOR=#ffff00>N</FONT><FONT COLOR=#ffff00>0</FONT><FONT COLOR=#dcc306>0</FONT><FONT COLOR=#b8860b>B</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of The N00B!</font>"
			src.tnl += 500
			src.tp += 200
			src.zenni += 40000
			src << "<font color = #ffa500>You gain 200 Training Points and 40-thousand Zenni for reaching this rank."

	if(src.rank=="<FONT COLOR=#b8860b>T</FONT><FONT COLOR=#ffff00>h</FONT><FONT COLOR=#ffff00>e</FONT><FONT COLOR=#ffff00> </FONT><FONT COLOR=#ffff00>N</FONT><FONT COLOR=#ffff00>0</FONT><FONT COLOR=#dcc306>0</FONT><FONT COLOR=#b8860b>B</FONT></FONT>")
		if(src.level >= 5000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#2f3150>W</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#bb3e46>a</FONT><FONT COLOR=#767a8a>k</FONT><FONT COLOR=#bb3e46>l</FONT><FONT COLOR=#ff0000>i</FONT><FONT COLOR=#981929>n</FONT><FONT COLOR=#2f3150>g</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Weakling!</font>"
			src.tnl += 500
			src.tp += 400
			src.zenni += 80000
			src << "<font color = #ffa500>You gain 400 Training Points and 80-Thousand Zenni for reaching this rank."

	if(src.rank=="<FONT COLOR=#2f3150>W</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#bb3e46>a</FONT><FONT COLOR=#767a8a>k</FONT><FONT COLOR=#bb3e46>l</FONT><FONT COLOR=#ff0000>i</FONT><FONT COLOR=#981929>n</FONT><FONT COLOR=#2f3150>g</FONT></FONT>")
		if(src.level >= 6000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#3f1b1d>E</FONT><FONT COLOR=#8b0000>a</FONT><FONT COLOR=#af3510>s</FONT><FONT COLOR=#d2691e>y</FONT><FONT COLOR=#af3510>g</FONT><FONT COLOR=#8b0000>o</FONT><FONT COLOR=#660e0f>e</FONT><FONT COLOR=#3f1b1d>r</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Easygoer!</font>"
			src.tnl += 500
			src.tp += 800
			src.zenni += 160000
			src << "<font color = #ffa500>You gain 800 Training Points and 160-Thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#3f1b1d>E</FONT><FONT COLOR=#8b0000>a</FONT><FONT COLOR=#af3510>s</FONT><FONT COLOR=#d2691e>y</FONT><FONT COLOR=#af3510>g</FONT><FONT COLOR=#8b0000>o</FONT><FONT COLOR=#660e0f>e</FONT><FONT COLOR=#3f1b1d>r</FONT></FONT>")
		if(src.level >= 7000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#5c4132>C</FONT><FONT COLOR=#94826b>o</FONT><FONT COLOR=#cbc1a3>u</FONT><FONT COLOR=#ddd4bd>c</FONT><FONT COLOR=#eee8d7>h</FONT><FONT COLOR=#fffaf0> </FONT><FONT COLOR=#eee8d7>P</FONT><FONT COLOR=#ddd4bd>o</FONT><FONT COLOR=#cbc1a3>t</FONT><FONT COLOR=#a7977e>a</FONT><FONT COLOR=#816c58>t</FONT><FONT COLOR=#5c4132>o</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Couch Potato!</font>"
			src.tnl += 500
			src.tp += 1600
			src.zenni += 320000
			src << "<font color = #ffa500>You gain 1600 Training Points and 320-Thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#5c4132>C</FONT><FONT COLOR=#94826b>o</FONT><FONT COLOR=#cbc1a3>u</FONT><FONT COLOR=#ddd4bd>c</FONT><FONT COLOR=#eee8d7>h</FONT><FONT COLOR=#fffaf0> </FONT><FONT COLOR=#eee8d7>P</FONT><FONT COLOR=#ddd4bd>o</FONT><FONT COLOR=#cbc1a3>t</FONT><FONT COLOR=#a7977e>a</FONT><FONT COLOR=#816c58>t</FONT><FONT COLOR=#5c4132>o</FONT></FONT>")
		if(src.level >= 8000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#043463>B</FONT><FONT COLOR=#1a4e7e>e</FONT><FONT COLOR=#31699a>g</FONT><FONT COLOR=#4682b4>i</FONT><FONT COLOR=#35a2c7>n</FONT><FONT COLOR=#24c1da>n</FONT><FONT COLOR=#12e1ed>i</FONT><FONT COLOR=#00ffff>n</FONT><FONT COLOR=#12e1ed>g</FONT><FONT COLOR=#24c1da> </FONT><FONT COLOR=#35a2c7>G</FONT><FONT COLOR=#4682b4>a</FONT><FONT COLOR=#31699a>m</FONT><FONT COLOR=#1a4e7e>e</FONT><FONT COLOR=#043463>r</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Beginning Gamer!</font>"
			src.tnl += 500
			src.tp += 2000
			src.zenni += 640000
			src << "<font color = #ffa500>You gain 200 Training Points and 640-Thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#043463>B</FONT><FONT COLOR=#1a4e7e>e</FONT><FONT COLOR=#31699a>g</FONT><FONT COLOR=#4682b4>i</FONT><FONT COLOR=#35a2c7>n</FONT><FONT COLOR=#24c1da>n</FONT><FONT COLOR=#12e1ed>i</FONT><FONT COLOR=#00ffff>n</FONT><FONT COLOR=#12e1ed>g</FONT><FONT COLOR=#24c1da> </FONT><FONT COLOR=#35a2c7>G</FONT><FONT COLOR=#4682b4>a</FONT><FONT COLOR=#31699a>m</FONT><FONT COLOR=#1a4e7e>e</FONT><FONT COLOR=#043463>r</FONT></FONT>")
		if(src.level >= 9000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#111626>N</FONT><FONT COLOR=#890c14>o</FONT><FONT COLOR=#ff0000>v</FONT><FONT COLOR=#f1230a>i</FONT><FONT COLOR=#e14715>c</FONT><FONT COLOR=#d2691e>e</FONT><FONT COLOR=#e14715> </FONT><FONT COLOR=#f1230a>G</FONT><FONT COLOR=#ff0000>a</FONT><FONT COLOR=#b0080d>m</FONT><FONT COLOR=#610f1a>e</FONT><FONT COLOR=#111626>r</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Novice Gamer!</font>"
			src.tnl += 500
			src.tp += 2500
			src.zenni += 1000000
			src << "<font color = #ffa500>You gain 2500 Training Points and 1-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#111626>N</FONT><FONT COLOR=#890c14>o</FONT><FONT COLOR=#ff0000>v</FONT><FONT COLOR=#f1230a>i</FONT><FONT COLOR=#e14715>c</FONT><FONT COLOR=#d2691e>e</FONT><FONT COLOR=#e14715> </FONT><FONT COLOR=#f1230a>G</FONT><FONT COLOR=#ff0000>a</FONT><FONT COLOR=#b0080d>m</FONT><FONT COLOR=#610f1a>e</FONT><FONT COLOR=#111626>r</FONT></FONT>")
		if(src.level >= 10000*EXPrebirthgain)
			src.rank = "Lounge Lizard"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Lounge Lizard!</font>"
			src.tnl += 1000
			src.tp += 3000
			src.zenni += 2000000
			src << "<font color = #ffa500>You gain 3000 Training Points and 2-Million Zenni for reaching this rank."

	if(src.rank == "Lounge Lizard")
		if(src.level >= 1250*EXPrebirthgain)
			src.rank = "<FONT COLOR=#ff0000>L</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#c60000>v</FONT><FONT COLOR=#8b0000>e</FONT><FONT COLOR=#c60000>l</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>r</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of... Leveler!</font>"
			src.tnl += 1000
			src.tp += 3500
			src.zenni += 3000000
			src << "<font color = #ffa500>You gain 3500 Training Points for and 3-Million Zenni reaching this rank."

	if(src.rank == "<FONT COLOR=#ff0000>L</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#c60000>v</FONT><FONT COLOR=#8b0000>e</FONT><FONT COLOR=#c60000>l</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>r</FONT></FONT>")
		if(src.level >= 15000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#008000>P</FONT><FONT COLOR=#4ea71a>r</FONT><FONT COLOR=#9acd32>o</FONT><FONT COLOR=#cdd31a> </FONT><FONT COLOR=#ffd700>G</FONT><FONT COLOR=#cdd31a>a</FONT><FONT COLOR=#9acd32>m</FONT><FONT COLOR=#4ea71a>e</FONT><FONT COLOR=#008000>r</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Pro Gamer!</font>"
			src.tnl += 1000
			src.tp += 4000
			src.zenni += 4000000
			src << "<font color = #ffa500>You gain 4000 Training Points and 4-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#008000>P</FONT><FONT COLOR=#4ea71a>r</FONT><FONT COLOR=#9acd32>o</FONT><FONT COLOR=#cdd31a> </FONT><FONT COLOR=#ffd700>G</FONT><FONT COLOR=#cdd31a>a</FONT><FONT COLOR=#9acd32>m</FONT><FONT COLOR=#4ea71a>e</FONT><FONT COLOR=#008000>r</FONT></FONT>")
		if(src.level >= 20000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#00008b>2</FONT><FONT COLOR=#0000ff>0</FONT><FONT COLOR=#ffd700>k</FONT><FONT COLOR=#806c80>-</FONT><FONT COLOR=#0000ff>e</FONT><FONT COLOR=#00008b>r</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of 20k-er!</font>"
			src.tnl += 1000
			src.tp += 5000
			src.zenni += 5000000
			src << "<font color = #ffa500>You gain 5000 Training Points and 5-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#00008b>2</FONT><FONT COLOR=#0000ff>0</FONT><FONT COLOR=#ffd700>k</FONT><FONT COLOR=#806c80>-</FONT><FONT COLOR=#0000ff>e</FONT><FONT COLOR=#00008b>r</FONT></FONT>")
		if(src.level >= 25000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#008b8b>N</FONT><FONT COLOR=#55b2b2>o</FONT><FONT COLOR=#abd9d9>v</FONT><FONT COLOR=#ffffff>i</FONT><FONT COLOR=#abffff>c</FONT><FONT COLOR=#55ffff>e</FONT><FONT COLOR=#00ffff> </FONT><FONT COLOR=#40ffff>L</FONT><FONT COLOR=#80ffff>e</FONT><FONT COLOR=#c0ffff>v</FONT><FONT COLOR=#ffffff>e</FONT><FONT COLOR=#abd9d9>l</FONT><FONT COLOR=#55b2b2>e</FONT><FONT COLOR=#008b8b>r</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Novice Leveler!</font>"
			src.tnl += 100
			src.tp += 5500
			src.zenni += 6000000
			src << "<font color = #ffa500>You gain 5500 Training Points and 6-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#008b8b>N</FONT><FONT COLOR=#55b2b2>o</FONT><FONT COLOR=#abd9d9>v</FONT><FONT COLOR=#ffffff>i</FONT><FONT COLOR=#abffff>c</FONT><FONT COLOR=#55ffff>e</FONT><FONT COLOR=#00ffff> </FONT><FONT COLOR=#40ffff>L</FONT><FONT COLOR=#80ffff>e</FONT><FONT COLOR=#c0ffff>v</FONT><FONT COLOR=#ffffff>e</FONT><FONT COLOR=#abd9d9>l</FONT><FONT COLOR=#55b2b2>e</FONT><FONT COLOR=#008b8b>r</FONT></FONT>")
		if(src.level >= 30000*EXPrebirthgain)
			src.rank = "Killer [src.race]"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Killer [src.race]!</font>"
			src.tnl += 100
			src.tp += 6000
			src.zenni += 7000000
			src << "<font color = #ffa500>You gain 6000 Training Points and 7-Million Zenni for reaching this rank."

	if(src.rank == "Killer [src.race]")
		if(src.level >= 40000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#b8860b>4</FONT><FONT COLOR=#ffd700>0</FONT><FONT COLOR=#ffd700>k</FONT><FONT COLOR=#ffd700>-</FONT><FONT COLOR=#ffd700>e</FONT><FONT COLOR=#b8860b>r</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of 40k-er!</font>"
			src.tnl += 1500
			src.tp += 6500
			src.zenni += 8000000
			src << "<font color = #ffa500>You gain 6500 Training Points and 8-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#b8860b>4</FONT><FONT COLOR=#ffd700>0</FONT><FONT COLOR=#ffd700>k</FONT><FONT COLOR=#ffd700>-</FONT><FONT COLOR=#ffd700>e</FONT><FONT COLOR=#b8860b>r</FONT></FONT>")
		if(src.level >= 50000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#ffa500>P</FONT><FONT COLOR=#ff5300>r</FONT><FONT COLOR=#ff0000>o</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#ff0000>L</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>v</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>l</FONT><FONT COLOR=#ff5300>e</FONT><FONT COLOR=#ffa500>r</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Pro Leveler!!</font>"
			src.tnl += 1500
			src.tp += 7000
			src.zenni += 9000000
			src << "<font color = #ffa500>You gain 7000 Training Points and 9-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#ffa500>P</FONT><FONT COLOR=#ff5300>r</FONT><FONT COLOR=#ff0000>o</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#ff0000>L</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>v</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>l</FONT><FONT COLOR=#ff5300>e</FONT><FONT COLOR=#ffa500>r</FONT></FONT>")
		if(src.level >= 60000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#008000>L</FONT><FONT COLOR=#55ab55>e</FONT><FONT COLOR=#abd5ab>v</FONT><FONT COLOR=#ffffff>e</FONT><FONT COLOR=#ebffcc>l</FONT><FONT COLOR=#d7ff98>i</FONT><FONT COLOR=#c2ff63>n</FONT><FONT COLOR=#adff2f>g</FONT><FONT COLOR=#c2ff63> </FONT><FONT COLOR=#d7ff98>M</FONT><FONT COLOR=#ebffcc>a</FONT><FONT COLOR=#ffffff>s</FONT><FONT COLOR=#abd5ab>t</FONT><FONT COLOR=#55ab55>e</FONT><FONT COLOR=#008000>r</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Leveling Master!</font>"
			src.tnl += 1500
			src.tp += 7500
			src.zenni += 10000000
			src << "<font color = #ffa500>You gain 7500 Training Points and 10-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#008000>L</FONT><FONT COLOR=#55ab55>e</FONT><FONT COLOR=#abd5ab>v</FONT><FONT COLOR=#ffffff>e</FONT><FONT COLOR=#ebffcc>l</FONT><FONT COLOR=#d7ff98>i</FONT><FONT COLOR=#c2ff63>n</FONT><FONT COLOR=#adff2f>g</FONT><FONT COLOR=#c2ff63> </FONT><FONT COLOR=#d7ff98>M</FONT><FONT COLOR=#ebffcc>a</FONT><FONT COLOR=#ffffff>s</FONT><FONT COLOR=#abd5ab>t</FONT><FONT COLOR=#55ab55>e</FONT><FONT COLOR=#008000>r</FONT></FONT>")
		if(src.level >= 75000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#ff4500>N</FONT><FONT COLOR=#ff5800>o</FONT><FONT COLOR=#ff6a00>v</FONT><FONT COLOR=#ff7d00>i</FONT><FONT COLOR=#ff9000>c</FONT><FONT COLOR=#ffa300>e</FONT><FONT COLOR=#ffb500> </FONT><FONT COLOR=#ffc800>M</FONT><FONT COLOR=#ffdb00>a</FONT><FONT COLOR=#ffed00>r</FONT><FONT COLOR=#ffff00>t</FONT><FONT COLOR=#ffed00>i</FONT><FONT COLOR=#ffdb00>a</FONT><FONT COLOR=#ffc800>l</FONT><FONT COLOR=#ffb500> </FONT><FONT COLOR=#ffa300>A</FONT><FONT COLOR=#ff9000>r</FONT><FONT COLOR=#ff7d00>t</FONT><FONT COLOR=#ff6a00>i</FONT><FONT COLOR=#ff5800>s</FONT><FONT COLOR=#ff4500>t</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Novice Martial Artist! {{::--</font>"
			src.tnl += 1500
			src.tp += 8000
			src.zenni += 11000000
			src << "<font color = #ffa500>You gain 8000 Training Points and 11-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#ff4500>N</FONT><FONT COLOR=#ff5800>o</FONT><FONT COLOR=#ff6a00>v</FONT><FONT COLOR=#ff7d00>i</FONT><FONT COLOR=#ff9000>c</FONT><FONT COLOR=#ffa300>e</FONT><FONT COLOR=#ffb500> </FONT><FONT COLOR=#ffc800>M</FONT><FONT COLOR=#ffdb00>a</FONT><FONT COLOR=#ffed00>r</FONT><FONT COLOR=#ffff00>t</FONT><FONT COLOR=#ffed00>i</FONT><FONT COLOR=#ffdb00>a</FONT><FONT COLOR=#ffc800>l</FONT><FONT COLOR=#ffb500> </FONT><FONT COLOR=#ffa300>A</FONT><FONT COLOR=#ff9000>r</FONT><FONT COLOR=#ff7d00>t</FONT><FONT COLOR=#ff6a00>i</FONT><FONT COLOR=#ff5800>s</FONT><FONT COLOR=#ff4500>t</FONT></FONT>")
		if(src.level >= 90000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#ff4500>P</FONT><FONT COLOR=#ff7400>r</FONT><FONT COLOR=#ffa300>o</FONT><FONT COLOR=#ffd100> </FONT><FONT COLOR=#ffff00>M</FONT><FONT COLOR=#ffc000>a</FONT><FONT COLOR=#ff8000>r</FONT><FONT COLOR=#ff4000>t</FONT><FONT COLOR=#ff0000>i</FONT><FONT COLOR=#ff3300>a</FONT><FONT COLOR=#ff6600>l</FONT><FONT COLOR=#ff9a00> </FONT><FONT COLOR=#ffcd00>A</FONT><FONT COLOR=#ffff00>r</FONT><FONT COLOR=#ffd100>t</FONT><FONT COLOR=#ffa300>i</FONT><FONT COLOR=#ff7400>s</FONT><FONT COLOR=#ff4500>t</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Pro Martial Artist! {{::--</font>"
			src.tnl += 1500
			src.tp += 8500
			src.zenni += 12000000
			src << "<font color = #ffa500>You gain 8500 Training Points and 12-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#ff4500>P</FONT><FONT COLOR=#ff7400>r</FONT><FONT COLOR=#ffa300>o</FONT><FONT COLOR=#ffd100> </FONT><FONT COLOR=#ffff00>M</FONT><FONT COLOR=#ffc000>a</FONT><FONT COLOR=#ff8000>r</FONT><FONT COLOR=#ff4000>t</FONT><FONT COLOR=#ff0000>i</FONT><FONT COLOR=#ff3300>a</FONT><FONT COLOR=#ff6600>l</FONT><FONT COLOR=#ff9a00> </FONT><FONT COLOR=#ffcd00>A</FONT><FONT COLOR=#ffff00>r</FONT><FONT COLOR=#ffd100>t</FONT><FONT COLOR=#ffa300>i</FONT><FONT COLOR=#ff7400>s</FONT><FONT COLOR=#ff4500>t</FONT></FONT>")
		if(src.level == 100000*EXPrebirthgain || src.level > 100000*EXPrebirthgain)
			src.rank = "<FONT COLOR=#000000>-</FONT><FONT COLOR=#0c0012>-</FONT><FONT COLOR=#190023>-</FONT><FONT COLOR=#250035>-</FONT><FONT COLOR=#320047>S</FONT><FONT COLOR=#3e0058>u</FONT><FONT COLOR=#4b006a>p</FONT><FONT COLOR=#57007c>r</FONT><FONT COLOR=#63008d>e</FONT><FONT COLOR=#70009f>m</FONT><FONT COLOR=#7c00b1>e</FONT><FONT COLOR=#8900c2> </FONT><FONT COLOR=#9400d3>L</FONT><FONT COLOR=#8a00c4>o</FONT><FONT COLOR=#7e00b3>r</FONT><FONT COLOR=#7300a3>d</FONT><FONT COLOR=#670093> </FONT><FONT COLOR=#5c0082>o</FONT><FONT COLOR=#500072>f</FONT><FONT COLOR=#450062> </FONT><FONT COLOR=#390052>A</FONT><FONT COLOR=#2e0041>A</FONT><FONT COLOR=#220031>-</FONT><FONT COLOR=#170021>-</FONT><FONT COLOR=#0b0010>-</FONT><FONT COLOR=#000000>-</FONT></FONT>"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "[EXPinfo] [src] has achieved the rank of Supreme Lord of AA! {{::--</font>"
			src << "<center><B><font color=red><font size = 1>--::}} Cograts, you have Reached the Final rank! for this you Also get 15k VP, and 20k Valiants {{::--</font>"
			src.tnl += 1500
			src.tp += 90000
			src.VP += 15000
			src.Valiants += 20000
			src.zenni += 500000000
			src << "<font color = #ffa500>You gain 9000 Training Points and 50-Million Zenni for reaching this rank."

/*	if(src.rank == "<FONT COLOR=#ff0000>N</FONT><FONT COLOR=#8b0000>u</FONT><FONT COLOR=#c60000>b</FONT><FONT COLOR=#ff0000>c</FONT><FONT COLOR=#c60000>a</FONT><FONT COLOR=#8b0000>k</FONT><FONT COLOR=#ff0000>e</FONT></FONT>")
		if(src.level >= 100)
			src.rank = "<FONT COLOR=#0000ff>N</FONT><FONT COLOR=#00008b>o</FONT><FONT COLOR=#6a5acd>o</FONT><FONT COLOR=#00008b>b</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Noob!</font>"
			src.tnl += 50
			src.tp += 50
			src.zenni += 5000
			src << "<font color = #ffa500>You gain 50 Training Points and 5-thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#0000ff>N</FONT><FONT COLOR=#00008b>o</FONT><FONT COLOR=#6a5acd>o</FONT><FONT COLOR=#00008b>b</FONT></FONT>")
		if(src.level >= 500)
			src.rank = "<FONT COLOR=#008000>S</FONT><FONT COLOR=#57c018>u</FONT><FONT COLOR=#adff2f>p</FONT><FONT COLOR=#d7ff18>e</FONT><FONT COLOR=#ffff00>r</FONT><FONT COLOR=#e4ff10> </FONT><FONT COLOR=#c9ff20>N</FONT><FONT COLOR=#adff2f>o</FONT><FONT COLOR=#57c018>o</FONT><FONT COLOR=#008000>b</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Super Noob!</font>"
			src.tnl += 55
			src.tp += 50
			src.zenni += 10000
			src << "<font color = #ffa500>You gain 50 Training Points and 10-thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#008000>S</FONT><FONT COLOR=#57c018>u</FONT><FONT COLOR=#adff2f>p</FONT><FONT COLOR=#d7ff18>e</FONT><FONT COLOR=#ffff00>r</FONT><FONT COLOR=#e4ff10> </FONT><FONT COLOR=#c9ff20>N</FONT><FONT COLOR=#adff2f>o</FONT><FONT COLOR=#57c018>o</FONT><FONT COLOR=#008000>b</FONT></FONT>")
		if(src.level >= 1000)
			src.rank = "<FONT COLOR=#8b0000>F</FONT><FONT COLOR=#a80000>u</FONT><FONT COLOR=#c60000>l</FONT><FONT COLOR=#e30000>l</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#ff4000>F</FONT><FONT COLOR=#ff8000>l</FONT><FONT COLOR=#ffc000>e</FONT><FONT COLOR=#ffff00>d</FONT><FONT COLOR=#ffc000>g</FONT><FONT COLOR=#ff8000>e</FONT><FONT COLOR=#ff4000>d</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#e30000>N</FONT><FONT COLOR=#c60000>o</FONT><FONT COLOR=#a80000>o</FONT><FONT COLOR=#8b0000>b</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Full Fledged Noob!</font>"
			src.tnl += 60
			src.tp += 100
			src.zenni += 20000
			src << "<font color = #ffa500>You gain 100 Training Points and 20-thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#8b0000>F</FONT><FONT COLOR=#a80000>u</FONT><FONT COLOR=#c60000>l</FONT><FONT COLOR=#e30000>l</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#ff4000>F</FONT><FONT COLOR=#ff8000>l</FONT><FONT COLOR=#ffc000>e</FONT><FONT COLOR=#ffff00>d</FONT><FONT COLOR=#ffc000>g</FONT><FONT COLOR=#ff8000>e</FONT><FONT COLOR=#ff4000>d</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#e30000>N</FONT><FONT COLOR=#c60000>o</FONT><FONT COLOR=#a80000>o</FONT><FONT COLOR=#8b0000>b</FONT></FONT>")
		if(level>=2000)
			src.rank = "<FONT COLOR=#b8860b>T</FONT><FONT COLOR=#ffff00>h</FONT><FONT COLOR=#ffff00>e</FONT><FONT COLOR=#ffff00> </FONT><FONT COLOR=#ffff00>N</FONT><FONT COLOR=#ffff00>0</FONT><FONT COLOR=#dcc306>0</FONT><FONT COLOR=#b8860b>B</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of The N00B!</font>"
			src.tnl += 65
			src.tp += 200
			src.zenni += 40000
			src << "<font color = #ffa500>You gain 200 Training Points and 40-thousand Zenni for reaching this rank."

	if(src.rank=="<FONT COLOR=#b8860b>T</FONT><FONT COLOR=#ffff00>h</FONT><FONT COLOR=#ffff00>e</FONT><FONT COLOR=#ffff00> </FONT><FONT COLOR=#ffff00>N</FONT><FONT COLOR=#ffff00>0</FONT><FONT COLOR=#dcc306>0</FONT><FONT COLOR=#b8860b>B</FONT></FONT>")
		if(src.level >= 5000)
			src.rank = "<FONT COLOR=#2f3150>W</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#bb3e46>a</FONT><FONT COLOR=#767a8a>k</FONT><FONT COLOR=#bb3e46>l</FONT><FONT COLOR=#ff0000>i</FONT><FONT COLOR=#981929>n</FONT><FONT COLOR=#2f3150>g</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Weakling!</font>"
			src.tnl += 75
			src.tp += 400
			src.zenni += 80000
			src << "<font color = #ffa500>You gain 400 Training Points and 80-Thousand Zenni for reaching this rank."

	if(src.rank=="<FONT COLOR=#2f3150>W</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#bb3e46>a</FONT><FONT COLOR=#767a8a>k</FONT><FONT COLOR=#bb3e46>l</FONT><FONT COLOR=#ff0000>i</FONT><FONT COLOR=#981929>n</FONT><FONT COLOR=#2f3150>g</FONT></FONT>")
		if(src.level >= 6000)
			src.rank = "<FONT COLOR=#3f1b1d>E</FONT><FONT COLOR=#8b0000>a</FONT><FONT COLOR=#af3510>s</FONT><FONT COLOR=#d2691e>y</FONT><FONT COLOR=#af3510>g</FONT><FONT COLOR=#8b0000>o</FONT><FONT COLOR=#660e0f>e</FONT><FONT COLOR=#3f1b1d>r</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Easygoer!</font>"
			src.tnl += 80
			src.tp += 800
			src.zenni += 160000
			src << "<font color = #ffa500>You gain 800 Training Points and 160-Thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#3f1b1d>E</FONT><FONT COLOR=#8b0000>a</FONT><FONT COLOR=#af3510>s</FONT><FONT COLOR=#d2691e>y</FONT><FONT COLOR=#af3510>g</FONT><FONT COLOR=#8b0000>o</FONT><FONT COLOR=#660e0f>e</FONT><FONT COLOR=#3f1b1d>r</FONT></FONT>")
		if(src.level >= 7000)
			src.rank = "<FONT COLOR=#5c4132>C</FONT><FONT COLOR=#94826b>o</FONT><FONT COLOR=#cbc1a3>u</FONT><FONT COLOR=#ddd4bd>c</FONT><FONT COLOR=#eee8d7>h</FONT><FONT COLOR=#fffaf0> </FONT><FONT COLOR=#eee8d7>P</FONT><FONT COLOR=#ddd4bd>o</FONT><FONT COLOR=#cbc1a3>t</FONT><FONT COLOR=#a7977e>a</FONT><FONT COLOR=#816c58>t</FONT><FONT COLOR=#5c4132>o</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Couch Potato!</font>"
			src.tnl += 85
			src.tp += 1600
			src.zenni += 320000
			src << "<font color = #ffa500>You gain 1600 Training Points and 320-Thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#5c4132>C</FONT><FONT COLOR=#94826b>o</FONT><FONT COLOR=#cbc1a3>u</FONT><FONT COLOR=#ddd4bd>c</FONT><FONT COLOR=#eee8d7>h</FONT><FONT COLOR=#fffaf0> </FONT><FONT COLOR=#eee8d7>P</FONT><FONT COLOR=#ddd4bd>o</FONT><FONT COLOR=#cbc1a3>t</FONT><FONT COLOR=#a7977e>a</FONT><FONT COLOR=#816c58>t</FONT><FONT COLOR=#5c4132>o</FONT></FONT>")
		if(src.level >= 8000)
			src.rank = "<FONT COLOR=#043463>B</FONT><FONT COLOR=#1a4e7e>e</FONT><FONT COLOR=#31699a>g</FONT><FONT COLOR=#4682b4>i</FONT><FONT COLOR=#35a2c7>n</FONT><FONT COLOR=#24c1da>n</FONT><FONT COLOR=#12e1ed>i</FONT><FONT COLOR=#00ffff>n</FONT><FONT COLOR=#12e1ed>g</FONT><FONT COLOR=#24c1da> </FONT><FONT COLOR=#35a2c7>G</FONT><FONT COLOR=#4682b4>a</FONT><FONT COLOR=#31699a>m</FONT><FONT COLOR=#1a4e7e>e</FONT><FONT COLOR=#043463>r</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Beginning Gamer!</font>"
			src.tnl += 90
			src.tp += 2000
			src.zenni += 640000
			src << "<font color = #ffa500>You gain 200 Training Points and 640-Thousand Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#043463>B</FONT><FONT COLOR=#1a4e7e>e</FONT><FONT COLOR=#31699a>g</FONT><FONT COLOR=#4682b4>i</FONT><FONT COLOR=#35a2c7>n</FONT><FONT COLOR=#24c1da>n</FONT><FONT COLOR=#12e1ed>i</FONT><FONT COLOR=#00ffff>n</FONT><FONT COLOR=#12e1ed>g</FONT><FONT COLOR=#24c1da> </FONT><FONT COLOR=#35a2c7>G</FONT><FONT COLOR=#4682b4>a</FONT><FONT COLOR=#31699a>m</FONT><FONT COLOR=#1a4e7e>e</FONT><FONT COLOR=#043463>r</FONT></FONT>")
		if(src.level >= 9000)
			src.rank = "<FONT COLOR=#111626>N</FONT><FONT COLOR=#890c14>o</FONT><FONT COLOR=#ff0000>v</FONT><FONT COLOR=#f1230a>i</FONT><FONT COLOR=#e14715>c</FONT><FONT COLOR=#d2691e>e</FONT><FONT COLOR=#e14715> </FONT><FONT COLOR=#f1230a>G</FONT><FONT COLOR=#ff0000>a</FONT><FONT COLOR=#b0080d>m</FONT><FONT COLOR=#610f1a>e</FONT><FONT COLOR=#111626>r</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Novice Gamer!</font>"
			src.tnl += 95
			src.tp += 2500
			src.zenni += 1000000
			src << "<font color = #ffa500>You gain 2500 Training Points and 1-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#111626>N</FONT><FONT COLOR=#890c14>o</FONT><FONT COLOR=#ff0000>v</FONT><FONT COLOR=#f1230a>i</FONT><FONT COLOR=#e14715>c</FONT><FONT COLOR=#d2691e>e</FONT><FONT COLOR=#e14715> </FONT><FONT COLOR=#f1230a>G</FONT><FONT COLOR=#ff0000>a</FONT><FONT COLOR=#b0080d>m</FONT><FONT COLOR=#610f1a>e</FONT><FONT COLOR=#111626>r</FONT></FONT>")
		if(src.level >= 10000)
			src.rank = "Lounge Lizard"
			world << "[EXPinfo] [src] has achieved the rank of Lounge Lizard!</font>"
			src.tnl += 100
			src.tp += 3000
			src.zenni += 2000000
			src << "<font color = #ffa500>You gain 3000 Training Points and 2-Million Zenni for reaching this rank."

	if(src.rank == "Lounge Lizard")
		if(src.level >= 1250)
			src.rank = "<FONT COLOR=#ff0000>L</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#c60000>v</FONT><FONT COLOR=#8b0000>e</FONT><FONT COLOR=#c60000>l</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>r</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of... Leveler!</font>"
			src.tnl += 105
			src.tp += 3500
			src.zenni += 3000000
			src << "<font color = #ffa500>You gain 3500 Training Points for and 3-Million Zenni reaching this rank."

	if(src.rank == "<FONT COLOR=#ff0000>L</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#c60000>v</FONT><FONT COLOR=#8b0000>e</FONT><FONT COLOR=#c60000>l</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>r</FONT></FONT>")
		if(src.level >= 15000)
			src.rank = "<FONT COLOR=#008000>P</FONT><FONT COLOR=#4ea71a>r</FONT><FONT COLOR=#9acd32>o</FONT><FONT COLOR=#cdd31a> </FONT><FONT COLOR=#ffd700>G</FONT><FONT COLOR=#cdd31a>a</FONT><FONT COLOR=#9acd32>m</FONT><FONT COLOR=#4ea71a>e</FONT><FONT COLOR=#008000>r</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Pro Gamer!</font>"
			src.tnl += 110
			src.tp += 4000
			src.zenni += 4000000
			src << "<font color = #ffa500>You gain 4000 Training Points and 4-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#008000>P</FONT><FONT COLOR=#4ea71a>r</FONT><FONT COLOR=#9acd32>o</FONT><FONT COLOR=#cdd31a> </FONT><FONT COLOR=#ffd700>G</FONT><FONT COLOR=#cdd31a>a</FONT><FONT COLOR=#9acd32>m</FONT><FONT COLOR=#4ea71a>e</FONT><FONT COLOR=#008000>r</FONT></FONT>")
		if(src.level >= 20000)
			src.rank = "<FONT COLOR=#00008b>2</FONT><FONT COLOR=#0000ff>0</FONT><FONT COLOR=#ffd700>k</FONT><FONT COLOR=#806c80>-</FONT><FONT COLOR=#0000ff>e</FONT><FONT COLOR=#00008b>r</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of 20k-er!</font>"
			src.tnl += 120
			src.tp += 5000
			src.zenni += 5000000
			src << "<font color = #ffa500>You gain 5000 Training Points and 5-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#00008b>2</FONT><FONT COLOR=#0000ff>0</FONT><FONT COLOR=#ffd700>k</FONT><FONT COLOR=#806c80>-</FONT><FONT COLOR=#0000ff>e</FONT><FONT COLOR=#00008b>r</FONT></FONT>")
		if(src.level >= 25000)
			src.rank = "<FONT COLOR=#008b8b>N</FONT><FONT COLOR=#55b2b2>o</FONT><FONT COLOR=#abd9d9>v</FONT><FONT COLOR=#ffffff>i</FONT><FONT COLOR=#abffff>c</FONT><FONT COLOR=#55ffff>e</FONT><FONT COLOR=#00ffff> </FONT><FONT COLOR=#40ffff>L</FONT><FONT COLOR=#80ffff>e</FONT><FONT COLOR=#c0ffff>v</FONT><FONT COLOR=#ffffff>e</FONT><FONT COLOR=#abd9d9>l</FONT><FONT COLOR=#55b2b2>e</FONT><FONT COLOR=#008b8b>r</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Novice Leveler!</font>"
			src.tnl += 125
			src.tp += 5500
			src.zenni += 6000000
			src << "<font color = #ffa500>You gain 5500 Training Points and 6-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#008b8b>N</FONT><FONT COLOR=#55b2b2>o</FONT><FONT COLOR=#abd9d9>v</FONT><FONT COLOR=#ffffff>i</FONT><FONT COLOR=#abffff>c</FONT><FONT COLOR=#55ffff>e</FONT><FONT COLOR=#00ffff> </FONT><FONT COLOR=#40ffff>L</FONT><FONT COLOR=#80ffff>e</FONT><FONT COLOR=#c0ffff>v</FONT><FONT COLOR=#ffffff>e</FONT><FONT COLOR=#abd9d9>l</FONT><FONT COLOR=#55b2b2>e</FONT><FONT COLOR=#008b8b>r</FONT></FONT>")
		if(src.level >= 30000)
			src.rank = "Killer [src.race]"
			world << "[EXPinfo] [src] has achieved the rank of Killer [src.race]!</font>"
			src.tnl += 130
			src.tp += 6000
			src.zenni += 7000000
			src << "<font color = #ffa500>You gain 6000 Training Points and 7-Million Zenni for reaching this rank."

	if(src.rank == "Killer [src.race]")
		if(src.level >= 40000)
			src.rank = "<FONT COLOR=#b8860b>4</FONT><FONT COLOR=#ffd700>0</FONT><FONT COLOR=#ffd700>k</FONT><FONT COLOR=#ffd700>-</FONT><FONT COLOR=#ffd700>e</FONT><FONT COLOR=#b8860b>r</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of 40k-er!</font>"
			src.tnl += 135
			src.tp += 6500
			src.zenni += 8000000
			src << "<font color = #ffa500>You gain 6500 Training Points and 8-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#b8860b>4</FONT><FONT COLOR=#ffd700>0</FONT><FONT COLOR=#ffd700>k</FONT><FONT COLOR=#ffd700>-</FONT><FONT COLOR=#ffd700>e</FONT><FONT COLOR=#b8860b>r</FONT></FONT>")
		if(src.level >= 50000)
			src.rank = "<FONT COLOR=#ffa500>P</FONT><FONT COLOR=#ff5300>r</FONT><FONT COLOR=#ff0000>o</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#ff0000>L</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>v</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>l</FONT><FONT COLOR=#ff5300>e</FONT><FONT COLOR=#ffa500>r</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Pro Leveler!!</font>"
			src.tnl += 140
			src.tp += 7000
			src.zenni += 9000000
			src << "<font color = #ffa500>You gain 7000 Training Points and 9-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#ffa500>P</FONT><FONT COLOR=#ff5300>r</FONT><FONT COLOR=#ff0000>o</FONT><FONT COLOR=#ff0000> </FONT><FONT COLOR=#ff0000>L</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>v</FONT><FONT COLOR=#ff0000>e</FONT><FONT COLOR=#ff0000>l</FONT><FONT COLOR=#ff5300>e</FONT><FONT COLOR=#ffa500>r</FONT></FONT>")
		if(src.level >= 60000)
			src.rank = "<FONT COLOR=#008000>L</FONT><FONT COLOR=#55ab55>e</FONT><FONT COLOR=#abd5ab>v</FONT><FONT COLOR=#ffffff>e</FONT><FONT COLOR=#ebffcc>l</FONT><FONT COLOR=#d7ff98>i</FONT><FONT COLOR=#c2ff63>n</FONT><FONT COLOR=#adff2f>g</FONT><FONT COLOR=#c2ff63> </FONT><FONT COLOR=#d7ff98>M</FONT><FONT COLOR=#ebffcc>a</FONT><FONT COLOR=#ffffff>s</FONT><FONT COLOR=#abd5ab>t</FONT><FONT COLOR=#55ab55>e</FONT><FONT COLOR=#008000>r</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Leveling Master!</font>"
			src.tnl += 145
			src.tp += 7500
			src.zenni += 10000000
			src << "<font color = #ffa500>You gain 7500 Training Points and 10-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#008000>L</FONT><FONT COLOR=#55ab55>e</FONT><FONT COLOR=#abd5ab>v</FONT><FONT COLOR=#ffffff>e</FONT><FONT COLOR=#ebffcc>l</FONT><FONT COLOR=#d7ff98>i</FONT><FONT COLOR=#c2ff63>n</FONT><FONT COLOR=#adff2f>g</FONT><FONT COLOR=#c2ff63> </FONT><FONT COLOR=#d7ff98>M</FONT><FONT COLOR=#ebffcc>a</FONT><FONT COLOR=#ffffff>s</FONT><FONT COLOR=#abd5ab>t</FONT><FONT COLOR=#55ab55>e</FONT><FONT COLOR=#008000>r</FONT></FONT>")
		if(src.level >= 75000)
			src.rank = "<FONT COLOR=#ff4500>N</FONT><FONT COLOR=#ff5800>o</FONT><FONT COLOR=#ff6a00>v</FONT><FONT COLOR=#ff7d00>i</FONT><FONT COLOR=#ff9000>c</FONT><FONT COLOR=#ffa300>e</FONT><FONT COLOR=#ffb500> </FONT><FONT COLOR=#ffc800>M</FONT><FONT COLOR=#ffdb00>a</FONT><FONT COLOR=#ffed00>r</FONT><FONT COLOR=#ffff00>t</FONT><FONT COLOR=#ffed00>i</FONT><FONT COLOR=#ffdb00>a</FONT><FONT COLOR=#ffc800>l</FONT><FONT COLOR=#ffb500> </FONT><FONT COLOR=#ffa300>A</FONT><FONT COLOR=#ff9000>r</FONT><FONT COLOR=#ff7d00>t</FONT><FONT COLOR=#ff6a00>i</FONT><FONT COLOR=#ff5800>s</FONT><FONT COLOR=#ff4500>t</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Novice Martial Artist! {{::--</font>"
			src.tnl += 150
			src.tp += 8000
			src.zenni += 11000000
			src << "<font color = #ffa500>You gain 8000 Training Points and 11-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#ff4500>N</FONT><FONT COLOR=#ff5800>o</FONT><FONT COLOR=#ff6a00>v</FONT><FONT COLOR=#ff7d00>i</FONT><FONT COLOR=#ff9000>c</FONT><FONT COLOR=#ffa300>e</FONT><FONT COLOR=#ffb500> </FONT><FONT COLOR=#ffc800>M</FONT><FONT COLOR=#ffdb00>a</FONT><FONT COLOR=#ffed00>r</FONT><FONT COLOR=#ffff00>t</FONT><FONT COLOR=#ffed00>i</FONT><FONT COLOR=#ffdb00>a</FONT><FONT COLOR=#ffc800>l</FONT><FONT COLOR=#ffb500> </FONT><FONT COLOR=#ffa300>A</FONT><FONT COLOR=#ff9000>r</FONT><FONT COLOR=#ff7d00>t</FONT><FONT COLOR=#ff6a00>i</FONT><FONT COLOR=#ff5800>s</FONT><FONT COLOR=#ff4500>t</FONT></FONT>")
		if(src.level >= 90000)
			src.rank = "<FONT COLOR=#ff4500>P</FONT><FONT COLOR=#ff7400>r</FONT><FONT COLOR=#ffa300>o</FONT><FONT COLOR=#ffd100> </FONT><FONT COLOR=#ffff00>M</FONT><FONT COLOR=#ffc000>a</FONT><FONT COLOR=#ff8000>r</FONT><FONT COLOR=#ff4000>t</FONT><FONT COLOR=#ff0000>i</FONT><FONT COLOR=#ff3300>a</FONT><FONT COLOR=#ff6600>l</FONT><FONT COLOR=#ff9a00> </FONT><FONT COLOR=#ffcd00>A</FONT><FONT COLOR=#ffff00>r</FONT><FONT COLOR=#ffd100>t</FONT><FONT COLOR=#ffa300>i</FONT><FONT COLOR=#ff7400>s</FONT><FONT COLOR=#ff4500>t</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Pro Martial Artist! {{::--</font>"
			src.tnl += 155
			src.tp += 8500
			src.zenni += 12000000
			src << "<font color = #ffa500>You gain 8500 Training Points and 12-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#ff4500>P</FONT><FONT COLOR=#ff7400>r</FONT><FONT COLOR=#ffa300>o</FONT><FONT COLOR=#ffd100> </FONT><FONT COLOR=#ffff00>M</FONT><FONT COLOR=#ffc000>a</FONT><FONT COLOR=#ff8000>r</FONT><FONT COLOR=#ff4000>t</FONT><FONT COLOR=#ff0000>i</FONT><FONT COLOR=#ff3300>a</FONT><FONT COLOR=#ff6600>l</FONT><FONT COLOR=#ff9a00> </FONT><FONT COLOR=#ffcd00>A</FONT><FONT COLOR=#ffff00>r</FONT><FONT COLOR=#ffd100>t</FONT><FONT COLOR=#ffa300>i</FONT><FONT COLOR=#ff7400>s</FONT><FONT COLOR=#ff4500>t</FONT></FONT>")
		if(src.level >= 99999)
			src.rank = "<FONT COLOR=#000000>-</FONT><FONT COLOR=#0c0012>-</FONT><FONT COLOR=#190023>-</FONT><FONT COLOR=#250035>-</FONT><FONT COLOR=#320047>S</FONT><FONT COLOR=#3e0058>u</FONT><FONT COLOR=#4b006a>p</FONT><FONT COLOR=#57007c>r</FONT><FONT COLOR=#63008d>e</FONT><FONT COLOR=#70009f>m</FONT><FONT COLOR=#7c00b1>e</FONT><FONT COLOR=#8900c2> </FONT><FONT COLOR=#9400d3>L</FONT><FONT COLOR=#8a00c4>o</FONT><FONT COLOR=#7e00b3>r</FONT><FONT COLOR=#7300a3>d</FONT><FONT COLOR=#670093> </FONT><FONT COLOR=#5c0082>o</FONT><FONT COLOR=#500072>f</FONT><FONT COLOR=#450062> </FONT><FONT COLOR=#390052>A</FONT><FONT COLOR=#2e0041>A</FONT><FONT COLOR=#220031>-</FONT><FONT COLOR=#170021>-</FONT><FONT COLOR=#0b0010>-</FONT><FONT COLOR=#000000>-</FONT></FONT>"
			world << "[EXPinfo] [src] has achieved the rank of Supreme Lord of AA! {{::--</font>"
			src << "<center><B><font color=red><font size = 1>--::}} Cograts, you have Reached the Final rank! for this you Also get 15k VP, and 20k Valiants {{::--</font>"
			src.tnl += 160
			src.tp += 90000
			src.VP += 15000
			src.Valiants += 20000
			src.zenni += 500000000
			src << "<font color = #ffa500>You gain 9000 Training Points and 50-Million Zenni for reaching this rank."

	if(src.rank == "<FONT COLOR=#000000>-</FONT><FONT COLOR=#0c0012>-</FONT><FONT COLOR=#190023>-</FONT><FONT COLOR=#250035>-</FONT><FONT COLOR=#320047>S</FONT><FONT COLOR=#3e0058>u</FONT><FONT COLOR=#4b006a>p</FONT><FONT COLOR=#57007c>r</FONT><FONT COLOR=#63008d>e</FONT><FONT COLOR=#70009f>m</FONT><FONT COLOR=#7c00b1>e</FONT><FONT COLOR=#8900c2> </FONT><FONT COLOR=#9400d3>L</FONT><FONT COLOR=#8a00c4>o</FONT><FONT COLOR=#7e00b3>r</FONT><FONT COLOR=#7300a3>d</FONT><FONT COLOR=#670093> </FONT><FONT COLOR=#5c0082>o</FONT><FONT COLOR=#500072>f</FONT><FONT COLOR=#450062> </FONT><FONT COLOR=#390052>A</FONT><FONT COLOR=#2e0041>A</FONT><FONT COLOR=#220031>-</FONT><FONT COLOR=#170021>-</FONT><FONT COLOR=#0b0010>-</FONT><FONT COLOR=#000000>-</FONT></FONT>")
		if(src.level >= 125000)
			src.rank = "Legendary Warrior"
			world << "<center><B><font color = #87ceeb><font size = 3>--::}} [src] has achieved the rank of Legendary Warrior! {{::--</font>"
			src.tnl += 165
			src.tp += 9500
			src.zenni += 14000000
			src << "<font color = #ffa500>You gain 9500 Training Points and 14-Million Zenni for reaching this rank."

	if(src.rank == "Legendary Warrior")
		if(src.level >= 150000)
			src.rank = "Legendary Slayer"
			world << "<center><B><font color = #87ceeb><font size = 3>--::}} [src] has achieved the rank of Legendary Slayer! {{::--</font>"
			src.tnl = 4000
			src.tp += 10000
			src.zenni += 15000000
			src << "<font color = #ffa500>You gain 10000 Training Points and 15-Million Zenni for reaching this rank."

	if(src.rank == "God Slayer")
		if(src.level >= 175000)
			src.rank = "Semi God"
			world << "<center><B><font color = #87ceeb><font size = 3>--::}} [src] has achieved the rank of Semi God!!! {{::--</font>"
			src.tnl = 5000
			src.tp += 10500
			src.zenni += 16000000
			src << "<font color = #ffa500>You gain 10500 Training Points and 16-Million Zenni for reaching this rank."

	if(src.rank == "Semi God")
		if(src.level >= 200000)
			src.rank = "Supreme God"
			world << "<center><B><font color = #8b0000><font size = 3>--::}} [src] has achieved the rank of Supreme God! {{::--</font>"
			src.tnl = 6000
			src.tp += 11000
			src.zenni += 17000000
			src << "<font color = #ffa500>You gain 1100 Training Points and 17-Million Zenni for reaching this rank."

	if(src.rank == "Supreme God")
		if(src.level >= 250000)
			src.rank = "Elder"
			world << "<center><B><font color = #8b0000><font size = 3>--::}} [src] has achieved the rank of Elder! {{::--</font>"
			src.tnl = 6500
			src.tp += 200000
			src.zenni += 5000000000000
			src << "<font color = #ffa500>You gain 200000 Training Points and 5 Trillion Zenni for reaching this rank."

	if(src.rank == "Elder")
		if(src.level >= 300000)
			src.rank = "Elder Lord"
			world << "<center><B><font color = #8b0000><font size = 3>--::}} [src] has achieved the rank of Elder Lord! {{::--</font>"
			src.tnl = 7500
			src.tp += 225000
			src.zenni += 10000000000000
			src << "<font color = #ffa500>You gain 225000 Training Points and 10 Trillion Zenni for reaching this rank."

	if(src.rank == "Elder Lord")
		if(src.level >= 350000)
			src.rank = "Elder God"
			world << "<center><B><font color = #800080><font size = 3>--::}} [src] has achieved the rank of Elder God! {{::--</font>"
			src.tnl =8500
			src.tp += 250000
			src.zenni += 25000000000000
			src << "<font color = #ffa500>You gain 250000 Training Points and 25 Trillion Zenni for reaching this rank."

	if(src.rank == "Elder God")
		if(src.level >= 400000)
			src.rank = "Titan"
			world << "<center><B><font color = #800080><font size = 3>--::}} [src] has achieved the rank of Titan!! {{::--</font>"
			src.tnl = 9500
			src.tp += 275000
			src.zenni += 50000000000000
			src << "<font color = #ffa500>You gain 275000 Training Points and 50 Trillion Zenni for reaching this rank."

	if(src.rank == "Titan")
		if(src.level >= 450000)
			src.rank = "Titan Warrior"
			world << "<center><B><font color = #d2b48c><font size = 3>--::}} [src] has achieved the rank of Titan Warrior! {{::--</font>"
			src.tnl = 10500
			src.tp += 300000
			src.zenni += 75000000000000
			src << "<font color = #ffa500>You gain 300000 Training Points and 75 Trillion Zenni for reaching this rank."

	if(src.rank == "Titan Warrior")
		if(src.level >= 500000)
			src.rank = "Titan Assassin"
			world << "<center><B><font color = #d2b48c><font size = 3>--::}} [src] has achieved the rank of Titan Assassin! {{::--</font>"
			src.tnl = 11000
			src.tp += 350000
			src.zenni += 100000000000000
			src << "<font color = #ffa500>You gain 350000 Training Points and 100 Trillion Zenni for reaching this rank."

	if(src.rank == "Titan Assassin")
		if(src.level >= 575000)
			src.rank = "Legendary Titan"
			world << "<center><B><font color = #daa520><font size = 3>--::}} [src] has achieved the rank of Legendary Titan! {{::--</font>"
			src.tnl = 12000
			src.tp += 400000
			src.zenni += 150000000000000
			src << "<font color = #ffa500>You gain 400000 Training Points and 150 Trillion Zenni for reaching this rank."

	if(src.rank == "Legendary Titan")
		if(src.level >= 650000)
			src.rank = "Titan Lord"
			world << "<center><B><font color = #daa520><font size = 3>--::}} [src] has achieved the rank of Titan Lord! {{::--</font>"
			src.tnl = 13000
			src.tp += 450000
			src.zenni += 250000000000000
			src << "<font color = #ffa500>You gain 450000 Training Points and 250 Trillion Zenni for reaching this rank."

	if(src.rank == "Titan Lord")
		if(src.level >= 725000)
			src.rank = "Lord Of Darkness"
			world << "<center><B><font color = #daa520><font size = 3>--::}} [src] has achieved the rank of Lord Of Darkness!!! {{::--</font>"
			src.tnl = 14000
			src.tp += 500000
			src.zenni += 400000000000000
			src << "<font color = #ffa500>You gain 500000 Training Points and 400 Trillion Zenni for reaching this rank."

	if(src.rank == "Lord Of Darkness")
		if(src.level >= 800000)
			src.rank = "God"
			world << "<center><B><font color = #b8860b><font size = 3>--::}} [src] has achieved the rank of God! {{::--</font>"
			src.tnl = 16000
			src.tp += 550000
			src.zenni += 500000000000000
			src << "<font color = #ffa500>You gain 550000 Training Points and 500 Trillion Zenni for reaching this rank."

	if(src.rank == "God")
		if(src.level >= 900000)
			src.rank = "Immortal"
			world << "<center><B><font color = #b8860b><font size = 3>--::}} [src] has achieved the rank of Immortal!! {{::--</font>"
			src.tnl = 19000
			src.tp += 600000
			src.zenni += 750000000000000
			src << "<font color = #ffa500>You gain 600000 Training Points and 750 Trillion Zenni for reaching this rank."

	if(src.rank == "Immortal")
		if(src.level >= 1000000)
			src.rank = "Lord Of DragonBall Z AA"
			world << "<center><B><font color = #7fff00><font size = 3>--::}} [src] has achieved the rank of Lord Of DragonBall Z AA!!! {{::--</font>"
			src.tnl = 30000
			src.tp += 700000
			src.zenni += 999000000000000
			src << "<font color = #ffa500>You gain 700000 Training Points and 999 Trillion Zenni for reaching this rank."*/


mob/proc/Z_Check()

	if(src.z_rank == "Zenni Starter")
		if(src.zenni >= 1e+006)
			src.z_rank = "Millionaire"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "<center><B><font color = #7fff00><font size = 2>--::}} [src] has achieved the zenni rank of Millionaire! {{::--</font>"

	if(src.z_rank == "Millionaire")
		if(src.zenni >= 1e+007)
			src.z_rank = "Multi Millionaire"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "<center><B><font color = #7fff00><font size = 2>--::}} [src] has achieved the zenni rank of Multi Millionaire! {{::--</font>"

	if(src.z_rank == "Multi Millionaire")
		if(src.zenni >= 1e+009)
			src.z_rank = "Billionaire"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "<center><B><font color = #7fff00><font size = 2>--::}} [src] has achieved the zenni rank of Billionaire! {{::--</font>"

	if(src.z_rank == "Billionaire")
		if(src.zenni >= 1e+010)
			src.z_rank = "Multi Billionaire"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "<center><B><font color = #7fff00><font size = 2>--::}} [src] has achieved the zenni rank of Multi Billionaire! {{::--</font>"

	if(src.z_rank == "Multi Billionaire")
		if(src.zenni >= 1e+012)
			src.z_rank = "Trillionaire"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "<center><B><font color = #7fff00><font size = 2>--::}} [src] has achieved the zenni rank of Trillionaire! {{::--</font>"

	if(src.z_rank == "Trillionaire")
		if(src.zenni >= 1e+013)
			src.z_rank = "Multi Trillionaire"
			for(var/mob/M in world)
				if(M.traininfo_on)
					M << "<center><B><font color = #7fff00><font size = 2>--::}} [src] has achieved the zenni rank of Multi Trillionaire! {{::--</font>"


//  if(src.zenni >= 1e+006 && src.z_rank == "Zenni Starter")
//		src.z_rank = "Millionaire"
//		world << "<center><B><font color = lime><font size = 3>--::}} [src] has become a Millionaire! {{::--</font>"
//  if(src.zenni >= 1e+007 && src.z_rank == "Millionaire")
  // 	    src.z_rank = "Multi Millionaire"
	//	world << "<center><B><font color = lime><font size = 3>--::}} [src] has become a Multi Millionaire! {{::--</font>"
//  if(src.zenni >= 1e+009 && src.z_rank == "Multi Millionaire")
//		src.z_rank = "Billionaire"
//		world << "<center><B><font color = lime><font size = 3>--::}} [src] has become a [src.z_rank]! {{::--</font>"
  //if(src.zenni >= 1e+010 && src.z_rank == "Billionaire")
	//	src.z_rank = "Multi Billionaire"
	//	world << "<center><B><font color = lime><font size = 3>--::}} [src] has become a [src.z_rank]! {{::--</font>"
//  if(src.zenni >= 1e+012 && src.z_rank == "Multi Billionaire")
//		src.z_rank = "Trillionaire"
//		world << "<center><B><font color = lime><font size = 3>--::}} [src] has become a [src.z_rank]! {{::--</font>"
  //if(src.zenni >= 1e+013 && src.z_rank == "Trillionaire")
	//	src.z_rank = "Multi Trillionaire"
	//	world << "<center><B><font color = lime><font size = 3>--::}} [src] has become a [src.z_rank]! {{::--</font>"

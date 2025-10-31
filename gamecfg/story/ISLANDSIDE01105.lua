return {
	id = "ISLANDSIDE01105",
	mode = 10,
	map = {
		{
			100800,
			10060002
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			characterId = 0,
			say = "Am-Mer-Mar! I got wood, coal, and iron ore – everything we need. We can start whenever.",
			animation = "hi",
			face2Face = {
				{
					0,
					100800
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "Excellent work. The construction on this shop is almost finished. However...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "However? Is there a problem?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "There is. Although the shop is nearly completed, the shop itself is merely a location.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Commercial Area Supervisor",
			characterId = 100800,
			say = "The heart of the catering industry is, naturally, fresh ingredients. As such, we'll need to stock up a lot in preparation for the opening.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Ah, ingredients. Roger that. I'll look around.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "Also, please try to find the highest quality ingredients possible, as ingredient quality is hugely important for the shop's success.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I'm on it!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

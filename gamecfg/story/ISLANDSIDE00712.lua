return {
	id = "ISLANDSIDE00712",
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
			animation = "hi",
			say = "Hey, Am-Mer-Mar.",
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
			animation = "doubt",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "Ah, if it isn't you, Commander? Are you here to taste the area's delicious food?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "Not this time. I'm looking for some rosemary. Know if there's any on the island?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Commercial Area Supervisor",
			characterId = 100800,
			say = "Rosemary? What do you need that for?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Bremen's going to make some honey water for me. I'd love to try it, but the recipe needs rosemary.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "One of Bremen's recipes? Now that does sound worth trying. Hmm... I see, I see.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Commercial Area Supervisor",
			characterId = 100800,
			say = "The Golden Koi Restaurant should have some. They use it to season their food. Why don't you go look there?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Oh, the Golden Koi! Got it. I'll go check.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

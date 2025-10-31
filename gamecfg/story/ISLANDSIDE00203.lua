return {
	id = "ISLANDSIDE00203",
	mode = 10,
	map = {
		{
			100300,
			10020004
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
			say = "Stephen, you busy?",
			face2Face = {
				{
					0,
					100300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Commander? Is... Is there a problem with the orders?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "No, it's not about orders. Don't be nervous.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "See, it's about...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "What? A sketch? We're talking about art?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "I'm not very well-versed when it comes to art and stuff. All I know is work, cargo, and freighters.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Relax. I'm not looking for expert advice or anything like that.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I'm just looking to get a painting made, but I don't know of what yet, so I'm looking around to see if I can find a place or thing that moves me.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Ah, you're looking for inspiration. Why don't you ask Bremen? She knows loads of things and has unique takes on everything. I think she can help you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Bremen, you say? I might go to Café Manjuu, then.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

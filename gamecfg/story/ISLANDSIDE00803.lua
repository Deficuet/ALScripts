return {
	id = "ISLANDSIDE00803",
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
			say = "Stephen, I've got your wood.",
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
			animation = "nod",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "That's great, but there's another problem!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "I was counting up the things we're supposed to ship today, and I noticed a pile of coal was missing from the storage!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "I don't have time to look into why it's missing, I just need more coal!",
			characterId = 100300,
			subName = "Manager of Logistics",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "Please, Commander! I'll pay extra on top of my previous request!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Where should I get the coal from?",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "The mine. It's not far from the logging site you were just at!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I just got back, and now I've gotta go out there again...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "weep",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "I'm sorry, but you're the only one I can count on! Without you, I dunno what I'll do...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Alright, alright. I'll go.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Hooray! Okay, I'll be waiting for your return!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

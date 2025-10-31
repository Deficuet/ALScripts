return {
	id = "ISLANDSIDE00108",
	mode = 10,
	map = {
		{
			100700,
			10040002
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
			say = "O'Brien, here's the wood you wanted.",
			face2Face = {
				{
					0,
					100700
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "Great! It all looks excellent! Here's the wooden makeshift track that John needs.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "Look at its surface. It's perfectly smooth, and it's in the exact measurements of the track.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Feels pretty dang firm, too.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "Mhm. Now, I bet John must be getting impatient.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "Please go and deliver this track to her right away!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

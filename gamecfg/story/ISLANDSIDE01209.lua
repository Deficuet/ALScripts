return {
	id = "ISLANDSIDE01209",
	mode = 10,
	map = {
		{
			101100,
			10050002
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
			animation = "nod",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "My, this coffee is divine! Oh, but I believe it'll taste even better if we drink it after work.",
			face2Face = {
				{
					0,
					101100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "What do you say?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Yeah. Then we'll taste the fruit of our labor – in more ways than one.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "Exactly! That's what I was thinking!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "By the way, I had a look at the orchard's stockpile just earlier.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "I don't think we'll have enough, assuming we get as many orders as last time.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "Could you ask Patrick to confirm how many orders we have?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

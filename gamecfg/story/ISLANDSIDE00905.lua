return {
	id = "ISLANDSIDE00905",
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
			say = "Stephen, I completed that mysterious request.",
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
			animation = "clap",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Whoa! Incredible, Commander! Even with so little information to go on, you got it done effortlessly!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "curious",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "I'm curious – what was the request?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Exactly what the request form said. Just a transport job.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "You can ask Akashi for details later when she drops by.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Ohh, so the package was for her. No wonder it was so shrouded in secrecy.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "Alright, I'll log this request as completed by you!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

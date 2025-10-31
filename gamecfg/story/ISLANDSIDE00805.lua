return {
	id = "ISLANDSIDE00805",
	mode = 10,
	map = {
		{
			100200,
			10020009
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
			say = "Patrick, I completed the request.",
			face2Face = {
				{
					0,
					100200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Welcome back, our savior! You really did everything Stephen asked for?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Yep. She even gave me a second request in the middle of it, and I had to go to the plains twice.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Whoa! You just started handling requests and you're already this fast and flawless. That's impressive!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Oh yeah, she also said she'd double my reward.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "note",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Don't you worry about that, I've got that logged!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "Request complete. Let me just calculate your rewards real quick!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

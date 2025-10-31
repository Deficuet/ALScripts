return {
	id = "ISLAND1001011",
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
			say = "Patrick, you look awfully busy. You don't handle every single request that comes through the harbor, do you?",
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
			animation = "amaze",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Commander?! Well, I do. I oversee the harbor's requests.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "What brings you here, anyway? We could've all welcomed you if you'd given us a heads-up.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "I think you all have your hands full as it is. You don't have the time to welcome one person.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "There's no denying that, I suppose. Our incoming request amount has skyrocketed to triple the usual.",
			characterId = 100200,
			subName = "Manager of Requests",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "(And yet, the port hasn't received a single request from Akashi for the past week.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "(So where does all this cargo end up?)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Um, what are you staring at? Did you come all this way to check my ledger?",
			characterId = 100200,
			subName = "Manager of Requests",
			animation = "curious",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "Oh, nah, I'm just here to deliver these goods from the islanders. O'Brien and John prepared all of these.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "And they're all urgent goods, too! Thanks, Commander!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Although, I'll still need to check each and every one, even though you personally brought them in.",
			characterId = 100200,
			subName = "Manager of Requests",
			animation = "elation",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "Could you submit them in order for me?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

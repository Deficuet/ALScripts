return {
	id = "ISLANDSIDE00903",
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
			animation = "hi",
			say = "O'Brien, are you the one who issued that ore transport request?",
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
			characterId = 0,
			say = "I'm the one who accepted it. I've got the ore right here.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "What?! It's none other than you who's hauling our ore?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "And more importantly, how'd you learn that it's ore you're hauling?!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "You can't transport something if you don't know what it is.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "I mean... I suppose so. Besides, it shouldn't be a problem for you to know what it is.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "Akashi would most likely tell you after the fact either way.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "You, Akashi?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "Yes. She wants to use the ore in some research, but doesn't want others to know, so I was told to issue a request on the down-low.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "Here, I'm done wrapping the ore. Could you bring it to Akashi?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

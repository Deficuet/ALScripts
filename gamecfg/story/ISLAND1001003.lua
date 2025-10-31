return {
	id = "ISLAND1001003",
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
			say = "O'Brien! Hey there.",
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
			say = "Ah... C-Commander? That is you, isn't it?",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "amaze",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "The one and only.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Thank goodness! Long time no see. We all missed you so much! God, we were starting to worry that you'd forgotten about us.",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "shy",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "Over these six months, we've been hard at work developing the island.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Did you just say six months?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Yeah... It might not look very different, but we built an entire harbor on the shore. You should totally check it out when you get the chance!",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "embarrass",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "(Outside, it's just been a week... The flow of time must be different here. No wonder the aircraft malfunctioned.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "I'll do that. By the way, you've been here for a long time. Have you noticed anything strange?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Strange? I can't think of anything in particular during these six months.",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "Except for the huge explosion that happened just before you got here, that is.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "I'm told that an aircraft crashed nearby?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "Funny you should mention that...",
					flag = 1
				},
				{
					content = "Oh, really? I didn't know that.",
					flag = 2
				}
			}
		},
		{
			characterId = 0,
			optionFlag = 1,
			say = "I was on that aircraft. Things went a little awry, as you can tell.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100700,
			optionFlag = 1,
			subName = "Manager of the Forest",
			say = "Oh, my. That was your ride? Well, unfortunately, shrapnel from the explosion destroyed the bus stop leading to the harbor...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100700,
			optionFlag = 2,
			subName = "Manager of the Forest",
			say = "Really! Shrapnel from the explosion destroyed the bus stop leading to the harbor!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Worse, today is the deadline for Akashi's request. This is definitely going to delay our materials shipment...",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Akashi's request? Speaking of her, do you know where she is?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "She's usually around the harbor, but with the bus stop as wrecked as it is, you'll have to wait for the time being.",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "The bus stop, huh? I'll go check it out.",
					flag = 1
				}
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "O-okay... You might wanna talk to John over in Rockheap Mine. She's the one in charge of repairing the stop.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

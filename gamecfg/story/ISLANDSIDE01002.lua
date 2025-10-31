return {
	id = "ISLANDSIDE01002",
	mode = 10,
	map = {
		{
			100100,
			10010041
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
			animation = "doubt",
			characterId = 100100,
			subName = "Manager of the Mill",
			say = "Olympic, I want to show my support to Patrick. How should I go about that?",
			face2Face = {
				{
					0,
					100100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mill",
			characterId = 100100,
			say = "Hmm... Frankly, I think she'll be happy with anything you do for her.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "If you're asking for specific ideas, then... um...",
			characterId = 100100,
			subName = "Manager of the Mill",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mill",
			characterId = 100100,
			say = "……Zzzz……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "…………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Olympic? Hello?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mill",
			characterId = 100100,
			say = "Zzzzz...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Did she just fall asleep while standing?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Dang. I'll ask Stephen instead.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Her and Patrick's jobs overlap a fair bit, so maybe she'll have some ideas.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}

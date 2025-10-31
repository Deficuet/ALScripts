return {
	id = "ISLANDSIDE01302",
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
			animation = "hi",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Good day, Commander. What brings you here?",
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
			animation = "talk",
			characterId = 0,
			say = "Laconia said the fertilizer she needs for her lavenders hasn't arrived.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Is there some trouble with it, or what?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "Ah. I was just thinking about going to see her about that.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "You see, while we were transporting goods past the farm, a bunch of cows suddenly charged us!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "As a result, some cargo fell and got scattered all over the ground.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "Her fertilizer was probably among said cargo, so...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Oh. So that's what happened.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
